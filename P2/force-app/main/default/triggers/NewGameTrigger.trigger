/*
 * Trigger on Product that fires whenever a new game is inserted or deleted. Will utilize class: EmailManager & Customer sObject.
 * After-trigger
 * Author: Daniel Alcala
 * 2022-22-04
 */

trigger NewGameTrigger on Product2 (after insert) {
    
    //Fire conditions (2)
    if (Trigger.isInsert){
        
        // Inserting a new game to the product library trigger process
        
        //Grab the count of the records that triggered the insertion condition, will use for email purposes.
        Integer recordCount = Trigger.New.size();
        
        //Grab all active Mist Customers with verified email's to notify of this product/game library update using SOQL.
        for (Customer c : [SELECT Name, Email__c FROM Customer
                           WHERE (Email__c != '' AND CustomerStatusType = 'Active')] ){
                               
                               //Notification Process
                               
                               // Call a utility method from another class
                                EmailManager.sendMail(c.Email__c, 'MIST Store: New Game(s) Added!', 
                                                        recordCount + ' game(s) were inserted. Go check them out now!');
                           }
    }
}