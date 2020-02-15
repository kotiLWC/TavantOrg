trigger aftrInsertTriggerEx2 on Contact (after insert) {
    List<Account> lstAcc = [Select id,name,phone,
                            (Select id,Name,Phone,AccountId 
                             From contacts where Id IN:trigger.new)
                           From Account];
    for(Account a:lstAcc){
        for(Contact c:a.contacts){
            if(c.AccountId == a.Id){
                c.Phone = a.Phone;
                update c;
        }
       
    }
    }
}