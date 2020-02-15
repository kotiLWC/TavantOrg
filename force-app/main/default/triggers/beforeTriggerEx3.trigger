trigger beforeTriggerEx3 on Contact (before insert) {
    for(Contact con:trigger.new){
        if(con.AccountId == null){
            con.addError('Please Select Account');
        }
    }

}