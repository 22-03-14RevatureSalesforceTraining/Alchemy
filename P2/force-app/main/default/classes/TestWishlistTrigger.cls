@isTest
private class TestWishlistTrigger {
    @isTest(SeeAllData=True)
    static void TestAddItem(){
        Customer tempcust = [SELECT Id FROM Customer WHERE Name = 'Cloud Strife'];
        Wish_List_Item__c temp = new Wish_List_Item__c(Name = 'Test Game', Customer__c = tempcust.Id);
        //insert temp;
        // Perform test
        Test.startTest();
        Database.SaveResult result = Database.insert(temp);
        Test.stopTest();
        // Verify that the insertion should have succeded,
        // so check that we got back a success.
      
        System.assertEquals(true, result.isSuccess());
    }
    
    @isTest(SeeAllData=True)
    static void TestRemoveItem(){
        Customer tempcust = [SELECT Id FROM Customer WHERE Name = 'Cloud Strife'];
        Wish_List_Item__c temp = new Wish_List_Item__c(Name = 'Test Game', Customer__c = tempcust.Id);
        insert temp;

        // Perform test
        Test.startTest();
        Database.DeleteResult result = Database.delete(temp);
        Test.stopTest();
        // Verify that the insertion should have succeded,
        // so check that we got back a success.
      
        System.assertEquals(true, result.isSuccess());
    }
}