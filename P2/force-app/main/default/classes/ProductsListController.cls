public class ProductsListController {
    public Flow.Interview.Add_Wishlist_Item_Flow myFlow{get; set;}
    public Customer cust;
    
    public String productName{get; set;}
    public Integer numThumbsUp{get; set;}
    public Integer gameRank{get; set;}
    
    //extension constructor
    public ProductsListController(ApexPages.StandardSetController stdController){
        cust = [SELECT Id FROM Customer WHERE Name = 'Cloud Strife'];
    }
    public void addToWishList(String name, Customer cust){
        Map<String, Object> inputs = new Map<String, Object>();
        inputs.put('ProductName', name);
  		inputs.put('CustomerSelected', cust);
        myFlow = new Flow.Interview.Add_Wishlist_Item_Flow(inputs);
        myFlow.start();
    }
    
    public void launch(){
        addToWishList(productName, cust);
    }
    
    public void thumbsUp(){
        BCThumbsUp thumbsUpEvent = new BCThumbsUp();
        List<Product2> rank = [SELECT Name, Thumbs_Up__c FROM Product2 ORDER BY Thumbs_Up__c DESC];
        Product2 prod;
            
        for(Integer i = 0; i<rank.size();i++){
            if(rank[i].Name == productName){
                gameRank = i;
                prod = rank[i];
                break;
            }
        }
        
        rank[gameRank].Thumbs_Up__c = numThumbsUp+1;
        //update  rank[gameRank].Thumbs_Up__c;
        
        thumbsUpEvent.broadcastEvent(productName,numThumbsUp,gameRank);
             
    }
}