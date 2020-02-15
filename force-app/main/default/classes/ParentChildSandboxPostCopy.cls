public class ParentChildSandboxPostCopy {
    Public void parentChild(){
        list<string> accIDs = new list<string>();   
        list<TestAccount__c> lstAcc = new list<TestAccount__c>();
        StaticResource defaultResource = [Select  s.Body From StaticResource s where s.Name LIKE 'MDParent%'];
        //system.debug('Test1====='+defaultResource);
        blob tempB = defaultResource.Body;
        String contentFile = tempB.toString();
        String[] filelines = contentFile.split('\n');
        //system.debug('Account CSV====='+filelines);
        for (Integer i=1;i<filelines.size();i++)
        {
            TestAccount__c acc= new TestAccount__c();
            String[] inputvalues = filelines[i].split(',');
            acc.Name =inputValues[1];
            acc.Rating__c =inputValues[2];
            acc.Externalid__c=inputValues[0];
            lstAcc.add(acc);
        }
        insert lstAcc;
        set<String> lstExid = new set<string>();
        //map<id,TestAccount__c>mapWithAcc= new map<id,TestAccount__c>();
        for(TestAccount__c a:[select id,name,Externalid__c from TestAccount__c where Externalid__c!=null]){
           // mapWithAcc.put(a.Externalid__c,a); 
            lstExid.add(a.Externalid__c);  
        }
        system.debug('lstAcc====='+lstAcc);
        
        list<TestContact__c> lstCon = new list<TestContact__c>();
        StaticResource defaultResource1 = [Select  s.Body From StaticResource s where s.Name LIKE 'MDChild%'];
        //system.debug('Test3====='+defaultResource1);
        blob tempB1 = defaultResource1.Body;
        String contentFile1 = tempB1.toString();
        String[] filelines1 = contentFile1.split('\n');
        Map<String,TestAccount__c> mapOfAccount=new Map<String,TestAccount__c>();
        List<TestAccount__c> ta2 =[select id,name,Externalid__c from TestAccount__c where Externalid__c IN:lstExid];
        for(TestAccount__c tc2:ta2){
            mapOfAccount.put(tc2.Externalid__c,tc2);
        }
        for (Integer j=1;j<filelines1.size();j++)
        {
            String[] inputvalues = filelines1[j].split(',');
            TestAccount__c record=mapOfAccount.get(String.valueOf(inputvalues[2]).trim());
            System.debug('record==>'+record);
            if(record!=null){
                TestContact__c tc= new TestContact__c();
                tc.Name= inputvalues[0];
                tc.Phone__c= inputvalues[1];
                tc.AccountID__c=record.id; 
                lstCon.add(tc);
            }else{
                
            }
        }
        insert lstCon;
        for(TestContact__c tt:lstCon){
        system.debug('===Lst Contacts===='+tt);
        }
    }
}