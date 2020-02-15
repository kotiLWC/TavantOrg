public class UpdateMemberWithCardsHandler {
    public static void UpdateTotalSpendsUpdate(List<MY_Card__c> SpendList) {
        for (MY_Card__c co : SpendList){
            decimal Creditcardamount=0.00;
            decimal Debitcardamount=0.00; 
            String CardType;
            Person_Account__c po=[Select Id,CreditCard_Spends__c,DebitCard_Spends__c from Person_Account__c where id=:co.AccountHolder__c];
            List<MY_Card__c> lCO = [select id,Spends__c,Card__c	 from MY_Card__c where AccountHolder__c=:po.Id];
            
            for(MY_Card__c my : lCO) {
                if(my.Card__c =='Credit'){
                  Creditcardamount +=my.Spends__c;   
                }else if(my.Card__c =='Debit'){
                  Debitcardamount += my.Spends__c;  
                }  
            }
            po.CreditCard_Spends__c = Creditcardamount;
            po.DebitCard_Spends__c = Debitcardamount;
            
            update po;
        }
    }
    
}