global class SummarizeAccountTotal implements Database.Batchable<sObject>, Database.Stateful{
    global final String query;
    global Map<Id, Account> accountmap;
    
    global SummarizeAccountTotal(){
        accountmap = new Map<Id, Account> ();
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<sObject> scope){
        List<Opportunity> ops = (List<Opportunity>)scope;
        for (Opportunity o : ops) {
            
            if (accountmap.containskey(o.AccountId)) 
            {
                Account a = accountmap.get(o.AccountId);
                a.Total_Amp__c += o.Amount;
                accountmap.put(o.AccountId, a);
            }
            else
            {
                accountmap.put(o.AccountId, new Account (Id = o.AccountId, Total_Amp__c = o.Amount));
            } 
            
        }
        
    }
    global void finish(Database.BatchableContext BC){
        try 
        {
            update accountmap.values();
        }
        catch (Exception Ex) 
        {
            system.debug(Ex);
        }
        
    }
}