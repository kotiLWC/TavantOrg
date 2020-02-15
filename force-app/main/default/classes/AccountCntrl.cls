public class AccountCntrl {
    public Account account  {get; set;}
    public AccountCntrl(){
        account = new Account();
    }
    public void save() {
        
       
        if(account.isCheck__c == true)
        {
            insert account;
            
            // Query the accounts to lock
            Account[] accts = [SELECT Id from Account WHERE id =:account.Id];
            System.debug('Test--::'+accts);
            // Lock the accounts
            Approval.LockResult[] lrList = Approval.lock(accts, false);
            
            // Iterate through each returned result
            for(Approval.LockResult lr : lrList) {
                  System.debug('Test--1::'+lr);
                if (lr.isSuccess()) {
                    // Operation was successful, so get the ID of the record that was processed
                    System.debug('Successfully locked account with ID: ' + lr.getId());
                }
                else {
                    // Operation failed, so get all errors                
                    for(Database.Error err : lr.getErrors()) {
                        System.debug('The following error has occurred.');                    
                        System.debug(err.getStatusCode() + ': ' + err.getMessage());
                        System.debug('Account fields that affected this error: ' + err.getFields());
                    }
                }
            }
        }
        
    }
}