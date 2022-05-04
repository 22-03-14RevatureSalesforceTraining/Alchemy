/*
 * Test utility class for testing NewGameTrigger on Product
 * Involved: NewGameTrigger, TestNewGameTrigger, & EmailManager
 * Will essentially create Test games to insert into test product library
 * & creates Test customers to notify of Product library updates.
 * Will be used in TestNewGameTrigger.
 * 
 * Author: Daniel Alcala
 * Modified: 2022-22-04
 */


@isTest
public class ProdAndCustomerFactory {
	
    public static List<Product2> createGamesAndCustomers (Integer numOfGames){
        //List that will hold test products that are generated.
        List<Product2> testGames = new List<Product2>();
        
        //List that will hold test customer accounts that are generated.
        //List<Customer> testCustomers = new List<Customer>();
        
        //Automatic generation of Game Products
        for (Integer i = 0; i < numOfGames; i++){
            testGames.add(new Product2(Name = 'TestGame' + i));
        }
        insert testGames;
        
        //Automatic generation of Test Customers
        //for (Integer j = 0; j < numOfCustomers; j++){
        //    Customer temp = new Customer(Name = 'TestCustomer' + j, Email__c = 'dlalcala@uci.edu',
         //                               CustomerStatusType = 'Active');
         //   testCustomers.add(temp);
      //  }
        //insert testCustomers;
        
        return testGames;
    }
}