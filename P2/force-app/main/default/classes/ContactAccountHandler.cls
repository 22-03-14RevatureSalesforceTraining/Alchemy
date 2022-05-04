public class ContactAccountHandler {
     public static void relateContactToAccount(List<Contact> contactList){
        
        Set<Id> accountSet = new Set<Id>();
        List<Account> updateAccList = new List<Account>();
        
        for(Contact con : contactList) {
            accountSet.add(con.AccountId);
        }        
                
        List<Account> accContactMatchList = [SELECT Id, Related_Contacts__c,
                                            (SELECT Id, Name FROM Contacts ORDER BY LastModifiedDate DESC) 
                                            FROM Account Where id IN :accountSet];
        for(Account acc : accContactMatchList){
            Account newAcc = new Account();
            String strAllContacts = '';
            for(Contact con :acc.Contacts){
                
                strAllContacts= strAllContacts + con.Name + ' , '; 
            }
            newAcc.Related_Contacts__c = strAllContacts.removeEnd(' , ');
            newAcc.Id = acc.id;
            updateAccList.add(newAcc);
        }   
        if(!updateAccList.isEmpty()) {
            update updateAccList; 
        }
    }  
}