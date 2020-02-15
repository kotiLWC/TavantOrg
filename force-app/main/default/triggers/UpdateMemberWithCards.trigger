trigger UpdateMemberWithCards on MY_Card__c (After insert,After update,after delete) {
      if(Trigger.isUpdate){
      UpdateMemberWithCardsHandler.UpdateTotalSpendsUpdate(Trigger.New);   
    }
}