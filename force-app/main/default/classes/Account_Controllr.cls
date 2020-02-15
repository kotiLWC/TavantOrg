public class Account_Controllr {
    @AuraEnabled
    public static list<Account> getAccounts()
    {
        return [SELECT ID,NAME,RATING FROM ACCOUNT limit 5];
    }

}