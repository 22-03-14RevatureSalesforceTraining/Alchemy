@isTest
public class priorityAccountTriggerTest {
    @isTest static void testAccountPriorityUndetermined(){
		Account acc = new Account(Name = 'Trigger Test Account');
        acc.AnnualRevenue = NULL;
    	insert acc;
        System.assertEquals('Undetermined', acc.Priority__c);
    }
    @isTest static void testAccountPriorityLow(){
		Account acc = new Account(Name = 'Trigger Test Account');
        acc.AnnualRevenue = 0;
    	insert acc;
        System.assertEquals('Low', acc.Priority__c);
    }
    @isTest static void testAccountPriorityMedium(){
		Account acc = new Account(Name = 'Trigger Test Account');
        acc.AnnualRevenue = 10000000;
    	insert acc;
        System.assertEquals('Medium', acc.Priority__c);
    }
    @isTest static void testAccountPriorityHigh(){
		Account acc = new Account(Name = 'Trigger Test Account');
        acc.AnnualRevenue = 50000000;
    	insert acc;
        System.assertEquals('High', acc.Priority__c);
    }
}