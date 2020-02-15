global class PagingSortingController {
    @AuraEnabled global static Account[] getAccounts(String search) {
        search = '%'+search+'%' ;
        return [SELECT Id,Name, Industry, AnnualRevenue FROM Account WHERE Name LIKE :search LIMIT 1000];
    }
    
    @AuraEnabled
    public static Account createAccount(Account acc)
    {
        system.debug('Controller values from component=====>'+acc.name); 
        if(acc != null)
            insert acc;
        return acc;
        // system.debug('Account Name'+acc.name);
    }
    @AuraEnabled
    public static List<Account> viewAccounts(String accid) {
        system.debug('Account id====>'+accID);
        List<Account> acc = [select id,name,rating,phone,Industry,AnnualRevenue From Account where id=:accID];
        system.debug('Account Details====>'+acc);
        return acc;
    }
    @AuraEnabled
    public static Account deleteAccount(Account acc) {
        // Perform isDeletable() check here 
        delete acc;
        return acc;
    }
    
    @Auraenabled
    public static List<Account> delteAccountById(String accid)
    {
        System.debug('In controller delteAccountById method..');
        Account delAccount=[Select Id from Account where id=:accid];
        delete delAccount;
        return [Select ID,Name,Phone from Account ORDER BY CREATEDDATE DESC LIMIT 10];
    }
}