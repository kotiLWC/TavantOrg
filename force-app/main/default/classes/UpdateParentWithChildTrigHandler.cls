public class UpdateParentWithChildTrigHandler {
    public static void UpdateTotalSpendsInsert(List<MYSpend__c> SpendList) 
    {
        list<MY_Card__c> myCards= new list<MY_Card__c>();
        List<Id> cardIds=new list<id>();
        for(MYSpend__c ms:SpendList)
        {
         cardIds.add(ms.MYCard__c);
        }
        system.debug('Test==== 1'+cardIds);
        Map<Id, MY_Card__c> objAById = new Map<Id, MY_Card__c>([SELECT Id,Credits__c,Spends__c FROM MY_Card__c WHERE Id in :cardIds]);
        system.debug('Test==== 2'+objAById);

        for(MYSpend__c m:SpendList){
         MY_Card__c mCard= objAById.get(m.MYCard__c);
            if(m.SpendType__c=='Debit'){
               mCard.Spends__c += m.DebitAmount__c;
            }
        }
        update objAById.values(); 
    }
}//main class