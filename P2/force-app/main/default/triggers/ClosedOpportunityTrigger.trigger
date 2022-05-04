trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> taskList = new List<Task>();
    
    for(Opportunity opp : Trigger.new) {
        if(opp.StageName == 'Closed Won'){
            taskList.add(new Task(Subject = opp.Name + ' Follow-Up', WhatId = opp.Id));
            
            User currUser = [SELECT Id, Email FROM User WHERE Id =: Trigger.new[0].OwnerId];
            if (currUser.email!=null) {
                String userName = UserInfo.getUserName();
                User activeUser = [SELECT Email FROM User WHERE Username = : userName limit 1];
                String userEmail = activeUser.Email;
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                String[] toAddresses = new String[] {currUser.email, userEmail};
                mail.setToAddresses(toAddresses);
                
                mail.setSubject('Automated Email: Opportunity has been CLOSED WON');
                String body = 'The opportunity ' + opp.Name + ' has successfully been closed by ' + userName;
                body += '<b> \n Current Stage in system: ' + opp.StageName + '</b>';
                body += ' Congratulations on a job well done. \n Please look at the new created task for a Follow-Up';
                mail.setHtmlBody(body);
                
                try {
                    Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
                } catch(Exception e) {
                    
                }
            }
        }
    }
    if(taskList.size() > 0){
        insert taskList;
    }
}