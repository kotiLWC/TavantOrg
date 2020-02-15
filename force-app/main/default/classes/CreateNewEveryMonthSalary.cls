global class CreateNewEveryMonthSalary implements Database.Batchable<SObject>, Database.Stateful {
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return null;
    }
    global void execute(Database.BatchableContext bc, List<MonthlySalary__c> Scope){
        
    }
    global void finish(Database.BatchableContext bc) {}

}