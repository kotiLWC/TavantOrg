public with sharing class QuickContactController {
@AuraEnabled
public static Account getAccount(Id accountId) {
// Perform isAccessible() checks here
return [SELECT Name, BillingCity, BillingState FROM Account WHERE Id = :accountId];

}

}