@isTest
public class CreatePubAndStuTest {

    @isTest static void testCreateExistPubAccount(){
        Account ac = new Account(Name='testPublisher', RecordTypeId = '0128b000000pN6FAAU');
        Game_Publisher__c gpub = new Game_Publisher__c(Name= 'testPublisher');
       	insert gpub;
        
        Test.startTest();
        //insert a new account of publisher type that doesn't have a publisher
        Database.SaveResult result = Database.insert(ac, false);
        System.assert(result.isSuccess());
        
        List<Game_Publisher__c> curPubObj = [ SELECT Name FROM Game_Publisher__c WHERE Name = :ac.Name];
        System.assertEquals(ac.Name, curPubObj[0].Name);
        
        Test.stopTest();
		
    }
    @isTest static void testCreateExistStuAccount(){
        String stuName = 'testStudio';
        
        Account ac = new Account(Name=stuName, RecordTypeId = '0128b000000pN6KAAU');
        Game_Studio__c gpub = new Game_Studio__c(Name= stuName);
        
        insert gpub;
        
        Test.startTest();
        //insert a new account of publisher type that doesn't have a publisher
        Database.SaveResult result = Database.insert(ac, false);
        System.assert(result.isSuccess());
        
        List<Game_Studio__c> curPubObj = [ SELECT Name FROM Game_Studio__c WHERE Name = :ac.Name];
        System.assertEquals(ac.Name, curPubObj[0].Name);
        
        Test.stopTest();

    }
    
    //adding an Account of Publisher RT, that doesn't have a Publisher entry
    @isTest static void testCreateNonExistPubAccount(){
        Account ac = new Account(Name='testPublisher', RecordTypeId = '0128b000000pN6FAAU');
        
        Test.startTest();
        //insert a new account of publisher type that doesn't have a publisher
        Database.SaveResult result = Database.insert(ac, false);
        System.assert(result.isSuccess());
        
        List<Game_Publisher__c> curPubObj = [ SELECT Name FROM Game_Publisher__c WHERE Name = :ac.Name];
        System.assertEquals(ac.Name, curPubObj[0].Name);
        
        Test.stopTest();
        
    }
  //adding an Account of STudio RT, that doesn't have a Studio entry
    @isTest static void testCreateNonExistingStuAccount(){
        Account ac = new Account(Name='testStudio', RecordTypeId = '0128b000000pN6KAAU');
        
        Test.startTest();
        Database.SaveResult result = Database.insert(ac, false);
        System.assert(result.isSuccess());
        
        List<Game_Studio__c> curStuObj = [ SELECT Name FROM Game_Studio__c WHERE Name = :ac.Name];
        System.assertEquals(ac.Name, curStuObj[0].Name);
        
        Test.stopTest();
    }
}