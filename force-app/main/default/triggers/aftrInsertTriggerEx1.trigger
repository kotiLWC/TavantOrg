trigger aftrInsertTriggerEx1 on Account (after insert) {
    List<Opportunity> lstOpt = new List<Opportunity>();
    for(Account a:trigger.new){
        if(a.Industry == 'Education' && a.Rating == 'Warm'){
           Opportunity op = new Opportunity();
            op.Name ='AccountChild';
            op.AccountId = a.id;
            op.CloseDate =system.today();
            op.StageName = 'Close Won';
            lstOpt.add(op);
        }
    }
    insert lstOpt;

}