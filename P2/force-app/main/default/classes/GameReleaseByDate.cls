public class GameReleaseByDate {
    private List<Product2> prodsList = [SELECT Name, ReleaseDate__c, Thumbs_Up__c FROM Product2];
    public List<Product2> getProds() {
         List<Product2> prods = [SELECT Name, ReleaseDate__c, Thumbs_Up__c FROM Product2];
    
        return prods;
    }
    
    public PageReference displayByDate() {
        prodsList = [SELECT Name, ReleaseDate__c, Thumbs_Up__c FROM Product2 ORDER BY ReleaseDate__c DESC];
        return null;
    }
    
    public List<Product2> getProdsList() {
        return prodsList;
    }
}