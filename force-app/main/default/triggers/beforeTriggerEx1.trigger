trigger beforeTriggerEx1 on Account (before insert) {
    for(Account a:trigger.new){
        if(a.Industry == 'Banking')
        {
            a.Ownership ='private';
        }
    }

}