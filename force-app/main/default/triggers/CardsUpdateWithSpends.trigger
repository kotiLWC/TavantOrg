trigger CardsUpdateWithSpends on MYSpend__c (After insert,After update,after delete) {

    if(Trigger.isInsert){
            try {
                for (MYSpend__c co : Trigger.new){
                decimal amount=0.00; 
                   // Parent_Object__c po = [SELECT Id, Sum_Field__c  FROM Parent_Object__c WHERE Id = :co.Parent_Lookup__c];
                    MY_Card__c po=[Select Id,Spends__c from MY_Card__c where id=:co.MYCard__c];

                    //List<Child_Object__c> l_co = [SELECT Id, Amount__c FROM Child_Object__c WHERE Parent_Lookup__c = :po.Id];
                    List<MYSpend__c> lCO = [select id,Price__c,MYCard__c from MYSpend__c where MYCard__c=:po.Id];

                    for(MYSpend__c am_co : lCO) {
                        amount += am_co.Price__c;  
                    }
                    po.Spends__c = amount;

                    update po;
                }
            } catch (Exception e) {
                System.debug(e);
            }
        }

    if(Trigger.isAfter) {
        if(Trigger.isUpdate){
            try {
                 for (MYSpend__c co : Trigger.old){
                decimal amount=0.00; 
                   // Parent_Object__c po = [SELECT Id, Sum_Field__c  FROM Parent_Object__c WHERE Id = :co.Parent_Lookup__c];
                    MY_Card__c po=[Select Id,Spends__c from MY_Card__c where id=:co.MYCard__c];

                    //List<Child_Object__c> l_co = [SELECT Id, Amount__c FROM Child_Object__c WHERE Parent_Lookup__c = :po.Id];
                    List<MYSpend__c> lCO = [select id,Price__c,MYCard__c from MYSpend__c where MYCard__c=:po.Id];

                    for(MYSpend__c am_co : lCO) {
                        amount += am_co.Price__c;  
                    }
                    po.Spends__c = amount;

                    update po;
                }
            } catch (Exception e) {
                System.debug(e);
            }
        }

        /*if(Trigger.isDelete){
            try {
                 for (MYSpend__c co : Trigger.new){
                decimal amount=0.00; 
                   // Parent_Object__c po = [SELECT Id, Sum_Field__c  FROM Parent_Object__c WHERE Id = :co.Parent_Lookup__c];
                    MY_Card__c po=[Select Id,Spends__c from MY_Card__c where id=:co.MYCard__c];

                    //List<Child_Object__c> l_co = [SELECT Id, Amount__c FROM Child_Object__c WHERE Parent_Lookup__c = :po.Id];
                    List<MYSpend__c> lCO = [select id,Price__c,MYCard__c from MYSpend__c where MYCard__c=:po.Id];

                    for(MYSpend__c am_co : lCO) {
                        amount -= am_co.Price__c;  
                    }
                    po.Spends__c = amount;

                    update po;
                }
            } catch (Exception e) {
                System.debug(e);
            }
        }*/
    }
}