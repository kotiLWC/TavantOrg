public class SampleSandboxCopy implements SandboxPostCopy {
    public void runApexClass(SandboxContext context) {
        
        integer m=0;
        list<string> accIDs = new list<string>();   
        list<Account> lstAcc = new list<Account>();
        StaticResource defaultResource = [Select  s.Body From StaticResource s where s.Name LIKE 'AccountTest%'];
        //system.debug('Test1====='+defaultResource);
        blob tempB = defaultResource.Body;
        String contentFile = tempB.toString();
        String[] filelines = contentFile.split('\n');
        system.debug('Account CSV====='+filelines);
        for (Integer i=1;i<filelines.size();i++)
        {
            Account acc= new Account();
            String[] inputvalues = filelines[i].split(',');
            acc.Name =inputValues[0];
            acc.TYPE =inputValues[1];
            //insert acc;
            // accIDs.add(acc.id);
            lstAcc.add(acc);
        }
        insert lstAcc;
        Map<integer,id> mapAccountWithId = new Map<integer,id>();
        for(Account a:lstAcc){
            m++;
            mapAccountWithId.put(m,a.Id);  
        }
        
        // system.debug('accounts====='+lstAcc);
        //  system.debug('accIDs====='+accIDs);
        //system.debug('===Map Values===='+mapAccountWithId);
        
        list<Contact> lstCon = new list<Contact>();
        StaticResource defaultResource1 = [Select  s.Body From StaticResource s where s.Name LIKE 'ContactTest%'];
        //system.debug('Test3====='+defaultResource1);
        blob tempB1 = defaultResource1.Body;
        String contentFile1 = tempB1.toString();
        String[] filelines1 = contentFile1.split('\n');
        system.debug('=====Contact CSV====='+filelines1);
        for (Integer j=1;j<filelines1.size();j++)
        {
            Contact con= new Contact();
            String[] inputvalues = filelines1[j].split(',');
            integer  myInt = Integer.valueof(inputvalues[0]);
            if(myInt == j){
                con.LastName =inputValues[1];
                con.Phone =inputValues[2];
                con.AccountId=mapAccountWithId.get(j);
                // insert con;
                lstCon.add(con);
            }
        }
        
        insert lstCon;
        
        
        list<CustSettingTest__c> lstCust = new list<CustSettingTest__c>();
        StaticResource defaultResource2 = [Select  s.Body From StaticResource s where s.Name LIKE 'CustTest%'];
        //system.debug('Test3====='+defaultResource1);
        blob tempB2 = defaultResource2.Body;
        String contentFile2 = tempB2.toString();
        String[] filelines2 = contentFile2.split('\n');
        for (Integer k=1;k<filelines2.size();k++)
        {
            CustSettingTest__c cust= new CustSettingTest__c();
            String[] inputvalues = filelines2[k].split(',');
            cust.Name =inputValues[0];
            cust.Phone__c =inputValues[1];
            cust.Email__c =inputValues[2];
            // insert con;
            lstCust.add(cust);
            
        }
        
        insert lstCust;
        
        system.debug('====lstCust==='+lstCust);
        
        
        Metadata.CustomMetadata customMetadata =  new Metadata.CustomMetadata();
        customMetadata.fullName = 'TestCustMetadata.Krishna';
        customMetadata.label = 'gopal';
        
        Metadata.CustomMetadataValue customField = new Metadata.CustomMetadataValue();
        customField.field = 'Phone__c';
        customField.value = '565565656665';
        
        customMetadata.values.add(customField);
        
        Metadata.DeployContainer mdContainer = new Metadata.DeployContainer();
        mdContainer.addMetadata(customMetadata);
        
        // Setup deploy callback, MyDeployCallback implements
        // the Metadata.DeployCallback interface (code for
        // this class not shown in this example)
        CustomMetadataCallback callback = new CustomMetadataCallback();
        
        // Enqueue custom metadata deployment
        // jobId is the deployment ID
        Id jobId = Metadata.Operations.enqueueDeployment(mdContainer, callback);
        ///////////////class//////////
        
        system.debug('======custom metaData==='+mdContainer);
    }
}