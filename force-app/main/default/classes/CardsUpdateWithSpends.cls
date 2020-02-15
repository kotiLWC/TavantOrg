public class CardsUpdateWithSpends {
    @InvocableMethod
    public static void updateCardsTotalSpends(List<Id> CardsId){
      decimal price=0.00;
      Id CardId=CardsId[0];
        MY_Card__c card=[Select Id,Spends__c from MY_Card__c where id=:CardId];
        List<MYSpend__c> spends = [select id,Price__c,MYCard__c from MYSpend__c where MYCard__c=:card.Id];
        for(MYSpend__c m:spends){
         price= price+m.Price__c;   
        }
        card.Spends__c =price;
        update card;
    }

}