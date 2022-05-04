public class OpportunitiesListWithController {
    private String sortOrder = 'Name';
    public List<Opportunity> getOpportunities() {
        List<Opportunity> results = Database.query(
            'SELECT Name, AccountId, OwnerId, Amount, ExpectedRevenue, CloseDate ' +
            'FROM Opportunity ' +
            'ORDER BY ' + sortOrder + ' DESC ' +
            'LIMIT 25'
        );
        return results;
    }
    public void sortByName() {
        this.sortOrder = 'Name';
    }
    public void sortByOwner() {
        this.sortOrder = 'OwnerId';
    }
    public void sortByRevenue() {
        this.sortOrder = 'ExpectedRevenue';
    }
    
    public List<Account> getAccounts() {
        List<Account> accResults = Database.query(
            'SELECT Name, AccountNumber ' +
            'FROM Account ' +
            'ORDER BY ' + sortOrder + ' ASC ' +
            'LIMIT 25'
        );
        return accResults;
    }
}