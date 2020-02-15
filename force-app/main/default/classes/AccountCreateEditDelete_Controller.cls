public class AccountCreateEditDelete_Controller {
    @AuraEnabled
    public static List<Account> getAccounts() {
        List<Account> accounts = 
                [SELECT Id,Name,Phone, Rating, Industry FROM Account];
        return accounts;
    }

}