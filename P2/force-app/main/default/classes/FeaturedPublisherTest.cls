@isTest
public class FeaturedPublisherTest {

    @isTest static void addLessThan3NewPublisher(){
        
        List <Game_Publisher__c> gamePublishers = new List<Game_Publisher__c>();
        
        Game_Publisher__c testPublisher;
        for(Integer i=0; i<2; i++){
           testPublisher = new Game_Publisher__c();
           testPublisher.Name='Test Publisher'+i+'_P';
           gamePublishers.add(testPublisher);
            
        }

        insert  gamePublishers;
        
        Test.startTest();
        Test.setCurrentPage(Page.Publisher_List);
        ApexPages.StandardSetController stdSetController = new ApexPages.StandardSetController(gamePublishers);
        stdSetController.setSelected(gamePublishers);
        FeaturedPublisher ext = new FeaturedPublisher(stdSetController);
        ext.getFeaturedPubs();
        Test.stopTest();
    }
    
    @isTest static void addMoreThan3NewPublisher(){
        
        List <Game_Publisher__c> gamePublishers = new List<Game_Publisher__c>();
        
        Game_Publisher__c testPublisher;
        for(Integer i=0; i<4; i++){
           testPublisher = new Game_Publisher__c();
           testPublisher.Name='Test Publisher'+i+'_P';
           gamePublishers.add(testPublisher);
            
        }

        insert  gamePublishers;
        
        Test.startTest();
        Test.setCurrentPage(Page.Publisher_List);
        ApexPages.StandardSetController stdSetController = new ApexPages.StandardSetController(gamePublishers);
        stdSetController.setSelected(gamePublishers);
        FeaturedPublisher ext = new FeaturedPublisher(stdSetController);
        ext.getFeaturedPubs();
        Test.stopTest();
    }

}