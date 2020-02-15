trigger beforeTriggerEx2 on Account (before insert) {
    list<opportunity> opty=new list<opportunity>();   
    for(Account a:trigger.new){
        if(a.Industry == 'Banking' && a.Rating =='Warm')
        {
            Opportunity Op = new Opportunity();
            Op.Name = a.Name;
            Op.CloseDate =system.today();
            op.StageName = 'Close Won';
            opty.add(Op);
            
        }
    }
    insert opty;
}