trigger UpdateParentWithChildTrig on MYSpend__c (before insert,After update,after delete) {
   /* if(Trigger.isDelete){
        UpdateParentWithChildTrigHandler.UpdateTotalSpendsDelete(Trigger.Old);
    }
    if(Trigger.isUpdate){
        UpdateParentWithChildTrigHandler.UpdateTotalSpendsUpdate(Trigger.New);   
    }*/
    if(Trigger.isInsert){
        UpdateParentWithChildTrigHandler.UpdateTotalSpendsInsert(Trigger.New);   
    }
    
    
}