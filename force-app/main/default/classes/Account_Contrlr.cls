public with sharing class Account_Contrlr {
@AuraEnabled

public static Account saveAccount (Account acc) {

upsert acc;
return acc;
}
}