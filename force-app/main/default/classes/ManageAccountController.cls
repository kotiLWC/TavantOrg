public with sharing class ManageAccountController {
    @AuraEnabled
    public static list<Account> getAccounts()
    {
        return[Select id,name,rating,(select Name, email FROM Contacts Order by CreatedDate asc) from Account];
    }

}