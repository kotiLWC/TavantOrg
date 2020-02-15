public class myControllerExtension {
    private final Account acct;
    public myControllerExtension(ApexPages.StandardController stdController)
    {
        this.acct = (Account)stdController.getRecord();
        system.debug('=====>'+acct);
    }
    
    public String getGreeting() {
        return 'Hello ' + acct.name + ' (' + acct.id + ')';
    }
    
}