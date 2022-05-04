public class CustomerCustController {
    
    //Record variables. Need?
	public String custName, custStatus, custEmail;
    
    //List to be referenced for displaying all customer accounts.
    List<Customer> custAccs = [SELECT Name, Email__c, CustomerStatusType FROM Customer];
    
    //Constructor. Need?
    public CustomerCustController(){
        
    }
    
    //Setter(s)
    public void setCustName(String inputName){
        custName = inputName;
    }
    
    public void setCustStatus(String inputCStatus){
        custStatus = inputCStatus;
    }
    
    public void setCustEmail(String inputCEmail){
        custEmail = inputCEmail;
    }
    
    //Getters
    
    //Primary Focus, displaying all customer accounts
    public List<Customer> getCustAccs(){
        return custAccs;
    }
    
    public String getCustName(){
        return custName;
    }
    
     public String getCustStatus(){
        return custStatus;
    }
    
     public String getCustEmail(){
        return custEmail;
    }
}