/*
 * Dynamic Component that returns up to 3 Game Studio Records as a featured list
 */
public class FeaturedStudio {

     private final Game_Studio__c gSTu;
    
    //constructor
    public FeaturedStudio(ApexPages.StandardSetController stdController){
        this.gStu = (Game_Studio__c)stdController.getRecord();
    }
    
    public Component.Apex.OutputText getFeaturedStus(){
        Component.Apex.OutputText featured = new Component.Apex.OutputText();
        
        List<Game_Studio__c> stuList = [SELECT Name FROM Game_Studio__c];
        
        //Pick 3 random Studios from pubsList;
        String featStuStr = ' ';
        if(stuList.size() > 0 && stuList.size() < 3 ){
            featStuStr += 'Featured Studios: ';
            for(Integer i=0; i<stuList.size(); i++){
                
                featStuStr += stuList[i].Name;
                
                if(i != stuList.size()){
                    featStuStr+=', ';
                }
            }
        }
        else if(stuList.size() >= 3){
            featStuStr += 'Featured Studios: ';
            for(Integer i=0; i<3; i++){
                Integer rand = Integer.valueof((Math.random() * stuList.size()));
                
                featStuStr += stuList[rand].Name;
                stuList.remove(rand);
                
                if(i<2){
                    featStuStr+=', ';
                }
            }
        }
        
        featured.value = featStuStr;
        
        return featured;
       
    }
}