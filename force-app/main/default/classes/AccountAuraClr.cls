public class AccountAuraClr {
    //Create new account records
    @AuraEnabled
    public static Account createAccount(Account acc)
    {
       system.debug('Controller values from component=====>'+acc.name); 
        if(acc != null)
        insert acc;
        return acc;
       // system.debug('Account Name'+acc.name);
    }
}