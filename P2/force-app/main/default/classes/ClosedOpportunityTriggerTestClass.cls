@isTest
public class ClosedOpportunityTriggerTestClass {
    static testMethod void createOppMethod() {
        try {
            Test.startTest();
            Profile prof = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
            User testUser = new User(Alias = 'UTest', Email = 'utest@jtdiamond.com', EmailEncodingKey = 'ISO-8859-1', FirstName = 'Ulysses', LanguageLocaleKey = 'en_US', LastName = 'Test', LocaleSidKey = 'en_US', ProfileId = prof.Id, TimeZoneSidKey = 'America/Los_Angeles', Username = 'test.utest@jtdiamond.com'); 
            insert testUser;
            System.runAs(testUser) {
                Opportunity createOpp = new Opportunity(Name='Special Promotion', StageName='stage', Probability = 95, CloseDate=System.today());
                insert createOpp;
                createOpp.Amount = 1000;
                createOpp.StageName = 'Closed Won';
                update createOpp;
                
                Opportunity testResult = [SELECT Id, IsClosed FROM Opportunity WHERE Id =: createOpp.Id];
                System.debug('testResult is Closed Won:' + testResult.IsClosed);
                System.assertEquals(true, testResult.IsClosed);
            }
            Test.stopTest();
        
        } catch(Exception e) {
            System.debug('error:' + e);
        }
    }
}