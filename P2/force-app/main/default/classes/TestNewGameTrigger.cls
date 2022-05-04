/*
 * Test class for testing NewGameTrigger for P2
 * After-save conditions for single and bulk loading based on conditions
* Involved: Products, Customers ; NewGameTrigger, ProdAndCustomerFactory (test utility class)
* Author: Daniel Alcala
* Modified: 2022-22-04
*/


@isTest
public class TestNewGameTrigger {
    
    //AFTER SAVE INSERTION TEST CONDITIONS
    
    @isTest(SeeAllData=True)
    public static void oneGameUpdateNotify (){
        // Test data setup
        
        // Create one game product with one Customer by calling a utility method
        //Product2[] tempGames = ProdAndCustomerFactory.createGamesAndCustomers (1);
        
        Product2 temp = new Product2(Name = 'TestGame');
        Individual itemp = new Individual(FirstName = 'Barry', LastName = 'Bonds');
        insert itemp;
        Customer ctemp = new Customer(PartyId = itemp.Id, Name = 'Barry Bonds', Email__c = 'billyBob@uci.edu', CustomerStatusType = 'Active' );
        
        // Perform test
        Test.startTest();
        Database.SaveResult result = Database.insert(temp);
        Database.SaveResult cResult = Database.insert(ctemp);
        Test.stopTest();
        // Verify that the insertion should have succeded,
        // so check that we got back a success.
      
        System.assertEquals(true, result.isSuccess());
        System.assertEquals(true, cResult.isSuccess());
    }
}