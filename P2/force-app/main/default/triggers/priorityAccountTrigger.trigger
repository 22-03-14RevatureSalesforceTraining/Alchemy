trigger priorityAccountTrigger on Account (before insert) {
    Account acc = Trigger.new[0];
    if(acc.AnnualRevenue == NULL){
        acc.priority__c = 'Undetermined';
    } else if(acc.AnnualRevenue < 10000000 && acc.AnnualRevenue >= 0){
        acc.priority__c = 'Low';
    } else if(acc.AnnualRevenue < 50000000 && acc.AnnualRevenue >= 10000000){
        acc.priority__c = 'Medium';
    } else if(acc.AnnualRevenue >= 50000000){
        acc.priority__c = 'High';
    }
}