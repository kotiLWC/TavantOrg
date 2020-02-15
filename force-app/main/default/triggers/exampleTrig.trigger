trigger exampleTrig on ChildC__c (after insert,after update,after delete) {
    if(Trigger.isInsert){
        set<id> ids = new set<id>();
        for(ChildC__c c: trigger.new){
            ids.add(c.Parent__c); 
        }
        List<ParentP__c> pp = new List<ParentP__c>();
        Map<Id,ChildC__c> lstChlds = new Map<Id,ChildC__c>([Select id,Parent__c,SpendType__c,CreditAmount__c,debitAmount__c from ChildC__c where Parent__c =: ids]);
        Map<Id,ParentP__c> mapAct = new Map<Id,ParentP__c>([Select id,TotalCredits__c,TotalSpends__c,Balance__c from ParentP__c where Id =: ids]);
        
        for(ChildC__c cc: trigger.new)
        {
            for(ParentP__c p : mapAct.values())
            {
                if(cc.Parent__c != Null && cc.SpendType__c =='Debit')
                {
                    p.Balance__c = p.Balance__c - cc.debitAmount__c;
                    p.TotalSpends__c += cc.debitAmount__c;
                    pp.add(p);
                }
                if(cc.Parent__c != Null && cc.SpendType__c =='Credit')
                {
                    p.Balance__c = p.Balance__c + cc.CreditAmount__c ;
                    p.TotalCredits__c += cc.CreditAmount__c;
                    pp.add(p);
                }
            }  
        }
        if(pp.size() >0)
        {
            update pp;
        }
    }
    if(Trigger.isUpdate){
        set<id> ids = new set<id>();
        for(ChildC__c c: trigger.new){
            ids.add(c.Parent__c); 
        }
        List<ParentP__c> pp = new List<ParentP__c>();
        Map<Id,ChildC__c> lstChlds = new Map<Id,ChildC__c>([Select id,Parent__c,SpendType__c,CreditAmount__c,debitAmount__c from ChildC__c where Parent__c =: ids]);
        system.debug('====lstchilds ===='+lstChlds);
        Map<Id,ParentP__c> mapAct = new Map<Id,ParentP__c>([Select id,TotalCredits__c,TotalSpends__c,Balance__c from ParentP__c where Id =: ids]);
        system.debug('====lstParents ===='+mapAct);

        for(ChildC__c cc: lstChlds.values())
        {
            for(ParentP__c p : mapAct.values())
            {
                if(cc.Parent__c != Null && cc.SpendType__c =='Debit' && cc.Parent__c == p.Id)
                {
                   
                   p.Balance__c = p.Balance__c - cc.debitAmount__c + cc.CreditAmount__c;
                    p.TotalSpends__c += cc.debitAmount__c;
                    p.TotalCredits__c -=cc.CreditAmount__c;
                    pp.add(p);
                }
                if(cc.Parent__c != Null && cc.SpendType__c =='Credit' && cc.Parent__c == p.Id)
                {
                    p.Balance__c = p.Balance__c + cc.CreditAmount__c - cc.debitAmount__c ;
                    p.TotalCredits__c += cc.CreditAmount__c;
                    p.TotalSpends__c -=cc.debitAmount__c;
                    pp.add(p);
                }
               
            }  
        }
        if(pp.size() >0)
        {
            update pp;
        }   
    }
}