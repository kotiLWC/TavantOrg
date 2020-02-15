public class TestSampleSandboxPostCopy {
    public transient Blob fileBody { get; set; }
    Public void postCopySandbox(){
        //Standard Object creation
        integer m=0;
        list<string> accIDs = new list<string>();   
        list<Account> lstAcc = new list<Account>();
        StaticResource defaultResource = [Select  s.Body From StaticResource s where s.Name LIKE 'AccountTest%'];
        //system.debug('Test1====='+defaultResource);
        blob tempB = defaultResource.Body;
        String contentFile = tempB.toString();
        String[] filelines = contentFile.split('\n');
        //system.debug('Account CSV====='+filelines);
        for (Integer i=1;i<filelines.size();i++)
        {
            Account acc= new Account();
            String[] inputvalues = filelines[i].split(',');
            acc.Name =inputValues[0];
            acc.TYPE =inputValues[1];
            lstAcc.add(acc);
        }
        insert lstAcc;
        system.debug('Test===Standard Object====='+lstAcc);
        
        //Custom Objects Records Creation
        list<string> accIDs1 = new list<string>();   
        list<TestAccount__c> lstAcc1 = new list<TestAccount__c>();
        StaticResource defaultResource1 = [Select  s.Body From StaticResource s where s.Name LIKE 'AccountTest%'];
        blob tempB1 = defaultResource1.Body;
        String contentFile1 = tempB1.toString();
        String[] filelines1 = contentFile1.split('\n');
        for (Integer i=1;i<filelines1.size();i++)
        {
            TestAccount__c acc= new TestAccount__c();
            String[] inputvalues1 = filelines1[i].split(',');
            acc.Name =inputValues1[0];
            acc.Rating__c =inputValues1[1];
            lstAcc1.add(acc);
        }
        insert lstAcc1;
        system.debug('Test====Custom Object====='+lstAcc1);
        
        //Custom settings Creation
        list<CustSettingTest__c> lstCust = new list<CustSettingTest__c>();
        StaticResource defaultResource2 = [Select  s.Body From StaticResource s where s.Name LIKE 'CustTest%'];
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
            lstCust.add(cust);
        }
        //insert lstCust;
        system.debug('Test====Custom Settings==='+lstCust);
        
        //Create Document
        List<StaticResource> defaultResource3 = [Select Name,ContentType,body,Description From StaticResource  where ContentType='image/png'];
        for(StaticResource sr:defaultResource3){
        string name=sr.Name+'11';
        Document dc= new Document();
        dc.name=name;
        dc.DeveloperName=name;
        dc.ContentType ='image/png';
        dc.FolderId=UserInfo.getUserId();
        dc.Type='URL';
        dc.Body=sr.Body;
       // insert dc;
        system.debug('Test=======Test'+dc); 
        }   
            
        //create user
        	Profile p = [SELECT Id,Name FROM Profile WHERE name='Standard Platform User'];
            system.debug('Test3333====='+p);
        
            list<user>lstUser = new list<User>();
            StaticResource defaultResource4 = [Select  s.Body From StaticResource s where s.Name LIKE 'UserTest%'];
            blob tempB4 = defaultResource4.Body;
            String contentFile4 = tempB4.toString();
            String[] filelines4 = contentFile4.split('\n');
            for (Integer k=1;k<filelines4.size();k++)
            {
                User u= new User();
                String[] inputvalues4 = filelines4[k].split(',');
                u.Alias = inputValues4[0];
                u.Email = inputValues4[1];
                u.EmailEncodingKey = 'UTF-8';
                u.LastName = inputValues4[2];
                u.LanguageLocaleKey = 'en_US';
                u.LocaleSidKey = 'en_US';
                u.TimeZoneSidKey ='America/Los_Angeles';
                u.Username = inputValues4[3];
                u.FederationIdentifier = inputValues4[4];
                u.ProfileId =p.Id;
                lstUser.add(u);
            }
            //insert lstUser;
            system.debug('Test====list of Users==='+lstUser);
       // postCopySandbox2();
    }
    @future
    Public static void postCopySandbox2(){
    //Create PermissionSet
        list<PermissionSet>lstPS = new list<PermissionSet>();
        StaticResource defaultResource5 = [Select  s.Body From StaticResource s where s.Name LIKE 'PermissionSet%'];
         blob tempB5 = defaultResource5.Body;
            String contentFile5 = tempB5.toString();
            String[] filelines5 = contentFile5.split('\n');
        
        for (Integer k=1;k<filelines5.size();k++)
            {
                 PermissionSet ps=new PermissionSet();
                 String[] inputvalues5 = filelines5[k].split(',');
        			ps.Name=inputValues5[0];
        			ps.Label=inputValues5[1];
                lstPS.add(ps);
            }
            insert lstPS;
            system.debug('Test====list of ps==='+lstPS);    
    }
    
}