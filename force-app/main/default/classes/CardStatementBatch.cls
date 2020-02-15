global class CardStatementBatch implements Database.Batchable<sObject>{
global Database.QueryLocator start(Database.BatchableContext BC){
     string query='SELECT Id, Name, CardUsageDate__c, Purpose__c, SpendAmount_del__c, Card_Name__c, Balance_del__c, Card_Type__c, Purchase_Place__c FROM Card_Statement__c'; 
    return Database.getQueryLocator(query);
   }

   global void execute(Database.BatchableContext BC, List<sObject> scope){
     for(sobject s : scope){
     system.debug('====s===='+s);
     }
    }

   global void finish(Database.BatchableContext BC){
   }
}