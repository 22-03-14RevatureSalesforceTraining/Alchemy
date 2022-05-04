public class accController {
    public List<Account> getAccounts(){
        List<Account> accountInfo = [SELECT Name, Phone, AnnualRevenue FROM Account];
        return accountInfo;
    }
}