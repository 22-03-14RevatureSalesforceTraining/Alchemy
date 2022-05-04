@isTest
public class FeaturedStudioTest {
    
    @isTest static void addLessThan3NewStudio(){
        
        List <Game_Studio__c> gameStudios = new List<Game_Studio__c>();
        
        Game_Studio__c testStudio;
        
        for(Integer i=0; i<2; i++){
            testStudio = new Game_Studio__c();
            testStudio.Name='Test Studio'+i+'_S' ;
        	gameStudios.add(testStudio);
        }
       
        insert  gameStudios;
        
        Test.startTest();
        Test.setCurrentPage(Page.Studio_List);
        ApexPages.StandardSetController stdSetController = new ApexPages.StandardSetController(gameStudios);
        stdSetController.setSelected(gameStudios);
        FeaturedStudio ext = new FeaturedStudio(stdSetController);
        ext.getFeaturedStus();
        Test.stopTest();
    }
    
    @isTest static void addMoreThan3NewStudio(){
        
        List <Game_Studio__c> gameStudios = new List<Game_Studio__c>();
        
        Game_Studio__c testStudio = new Game_Studio__c();
        testStudio.Name='Test Studio1_P' ;
        gameStudios.add(testStudio);
        
        Game_Studio__c testStudio2 = new Game_Studio__c();
        testStudio2.Name='Test Studio2_P' ;
        gameStudios.add(testStudio2);
        
        Game_Studio__c testStudio3 = new Game_Studio__c();
        testStudio3.Name='Test Studio3_P' ;
        gameStudios.add(testStudio3);
        
        insert  gameStudios;
        
        Test.startTest();
        Test.setCurrentPage(Page.Studio_List);
        ApexPages.StandardSetController stdSetController = new ApexPages.StandardSetController(gameStudios);
        stdSetController.setSelected(gameStudios);
        FeaturedStudio ext = new FeaturedStudio(stdSetController);
        ext.getFeaturedStus();
        Test.stopTest();
        
	}
}