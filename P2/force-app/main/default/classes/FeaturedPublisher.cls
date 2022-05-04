/*
 * Dynamic Component that returns up to 3 Game Publisher Records as a featured list
 */
public class FeaturedPublisher {
    private final Game_Publisher__c gPub;
    
    //constructor
    public FeaturedPublisher(ApexPages.StandardSetController stdController){
        this.gPub = (Game_Publisher__c)stdController.getRecord();
    }
    
    public Component.Apex.OutputText getFeaturedPubs(){
        
        Component.Apex.OutputText featured = new Component.Apex.OutputText();
        
        List<Game_Publisher__c> pubsList = [SELECT Name FROM Game_Publisher__c];
        
        //Pick 3 random Publishers from pubsList;
        String featPubStr = ' ';
        if(pubsList.size() > 0 && pubsList.size() < 3 ){
            featPubStr += 'Featured Publishers: ';
            for(Integer i=0; i<pubsList.size(); i++){
                
                featPubStr += pubsList[i].Name;
                
                if(i != pubsList.size()){
                    featPubStr+=', ';
                }
            }
        }
        else if(pubsList.size() >= 3){
            featPubStr += 'Featured Publishers: ';
            for(Integer i=0; i<3; i++){
                Integer rand = Integer.valueof((Math.random() * pubsList.size()));
                
                featPubStr += pubsList[rand].Name;
                pubsList.remove(rand);
                
                if(i<2){
                    featPubStr+=', ';
                }
            }
        }
        
        featured.value = featPubStr;
        
        return featured;
       
    }
}