public class CreateRecordsUsingStaticResource {
    public list<Account> createAccount(){
        list<Account> lstAcc = new list<Account>();
        StaticResource defaultResource = [Select  s.Body From StaticResource s where s.Name LIKE 'AccountTest%'];
        system.debug('Test1====='+defaultResource);
        blob tempB = defaultResource.Body;
        String contentFile = tempB.toString();
        String[] filelines = contentFile.split('\n');
        for (Integer i=1;i<filelines.size();i++)
        {
            Account acc= new Account();
            String[] inputvalues = filelines[i].split(',');
            acc.Name =inputValues[0];
            acc.Rating =inputValues[1];
            lstAcc.add(acc);
        }
        insert lstAcc;
        system.debug('Test2====List of Account====='+lstAcc);
        return lstAcc;
    }
    
}