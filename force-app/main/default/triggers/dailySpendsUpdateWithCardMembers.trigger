trigger dailySpendsUpdateWithCardMembers on DaySpends__c (after insert) {
    set<id> daySpendsId= new set<id>();
    decimal Debittotalval=0.00;
    for(DaySpends__c ds:trigger.new){
     daySpendsId.add(ds.Id); 
    }
    list<DaySpends__c>lstDaySpends = [Select id,Price__c,TypeOftransaction__c from DaySpends__c where id=:daySpendsId];
    for(DaySpends__c d: lstDaySpends){
        
    }

}