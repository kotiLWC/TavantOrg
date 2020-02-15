public with sharing class ApexWireMethodToPropertyCls {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList() {
        return [SELECT Id, Name, Phone FROM Account WHERE Phone != null LIMIT 10];
    }
     @AuraEnabled(cacheable=true)
    public static List<Account> findAccounts(String searchKey) {
        String key = '%' + searchKey + '%';
        return [SELECT Id, Name, Phone FROM Account WHERE Name LIKE :key AND Phone != null LIMIT 10];
    }
    @AuraEnabled(cacheable=true)
    public static Account getSingleAccount(){
        return [SELECT Id, Name, Phone FROM Account LIMIT 1];
    }

}