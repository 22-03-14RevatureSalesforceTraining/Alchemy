@isTest
public class TestContactNameOnAccountTrigger {
    @isTest
    static void insertTest (){
        
        
        Account acc = new Account(Name = 'Farm Bureau');
        Account acc2 = new Account(Name = 'Life Insurance');
        insert acc2;
       insert acc;
       List<Account> accList = [SELECT Id FROM Account];
        Contact con = new Contact(AccountId = accList[0].Id, FirstName = 'Jill', LastName = 'Simmons');
       
       insert con;
        
       /*List<Account> accContactMatchList = [SELECT Id, Related_Contacts__c,
                                            (SELECT Id, Name FROM Contacts ORDER BY LastModifiedDate DESC) 
                                            FROM Account Where id IN :accountSet]; */
     Test.startTest();
        con = new Contact(FirstName = 'Randy', LastName = 'Bobby');
        Database.saveResult result = Database.insert(con, false);
          
     Test.stopTest();
     System.assertEquals(true, result.isSuccess());
     //List<Account> acc1 = [SELECT Related_Contacts__c FROM Account];
        //System.assertEquals(expected, actual)
    }

}