trigger Nach_Status1 on Nach_Registration_List__c (After insert) {
 Set<String> setOppCodes = new Set<String>();
    Set<String> setAccId = new Set<String>();
    
    Map<string, Id> mapAccId = new Map<String, Id>();
    Map<string, Id> mapAccIdNach = new Map<String, Id>();    
    Map<string, Id> mapAccIdnew = new Map<String, Id>();
    
    Map<String, Nach_Registration_List__c> mapNACHRegistraionUploaded = new Map<String, Nach_Registration_List__c>();
    
    String csvFielString = 'Opportunity Name, Status\n';
    
    //collecting setOppCodes to query soql
    for (Nach_Registration_List__c nachreg:Trigger.new){     
        setOppCodes.add(nachreg.Refer__c);
        mapNACHRegistraionUploaded.put(nachreg.Reference1__c, nachreg);
        system.debug('=====reference code===='+setOppCodes);
    }
    List<opportunity> listopp = [select Name, accountid from opportunity where Name in :setOppCodes]; //Collecting all Opp
     system.debug('=====listopp===='+listopp);
    for(opportunity Opp:listopp){ 
        setAccId.add(Opp.accountid);
        mapAccId.put(Opp.Name, Opp.accountid);
        system.debug( ' SetOppCodes : '+ setOppcodes  );
    }
    
    System.debug( ' setAccId : '+ setAccId  ); 
    //***  Update logic 
    //if(setAccId!= null)
    if(setAccId.isEmpty() == false)
    {     
        //***query on Nach 
        List <NACH__c> Listnach =
            [Select ID,Account__c,Reason_For_Rejection__c,Reference1__c,Status__c,UMRN_Number__c,EMI_Amount__c,Utility_Code__c,Sponsor_Bank_Code__c,Borrower_Account_Number__c,
             Borrower_Bank_Name__c,Borrower_bank_IFSC_Number__c,Borrower_Name__c, Response__c from NACH__c where Account__c in :setAccId and Reference1__c in :setOppCodes];
        
        Map<String, NACH__c> mapNach = new Map<String, NACH__c>();
        
        for(NACH__c nach:Listnach){
            mapNach.put(nach.Reference1__c, nach);
        }
        for (String ref1 : mapNACHRegistraionUploaded.keySet())
        {
            Nach_Registration_List__c nacReg = mapNACHRegistraionUploaded.get(ref1);
            NACH__c nac = mapNach.get(ref1);
            
            if (nac == null) 
            {
                nac = new NACH__c();
                nac.Reference1__c = ref1;
                nac.Account__c = mapAccId.get(ref1);
                Listnach.add(nac);
                csvFielString += '"' + ref1 +'","Nach created in DMI SFDC with latest Nach information."\n';
            }
            else
            {
                csvFielString += '"' + ref1 + '","Nach available in DMI SFDC and updated."\n';
            }
            nac.Status__c = nacReg.Status__c;                    
            nac.UMRN_Number__c = nacReg.UMRN_Number__c;
            nac.NACH_Amount__c = nacReg.NACH_Amount__c;                    
            nac.EMI_Amount__c = nacReg.EMI_Amount__c;                    
            nac.Sponsor_Bank_Code__c = nacReg.Sponsor_Bank_Code__c;                     
            nac.Utility_Code__c = nacReg.Utility_Code__c;
            nac.Borrower_Account_Number__c = nacReg.Borrower_Account_Number__c;
            nac.Borrower_Bank_Name__c = nacReg.Borrower_Bank_Name__c;
            nac.Borrower_bank_IFSC_Number__c = nacReg.Borrower_bank_IFSC_Number__c;
            nac.Borrower_Name__c = nacReg.Borrower_Name__c;
            nac.Reason_For_Rejection__c= nacReg.Reason_For_Rejection__c;
        }
        upsert Listnach;
        
        Messaging.EmailFileAttachment csvAttc = new Messaging.EmailFileAttachment();
        csvAttc.setFileName('NACH_Registration_' + system.today().day() + '' + system.today().month() + '' + system.today().year() + '.csv');
        csvAttc.setBody(Blob.valueOf(csvFielString));
        Messaging.SingleEmailMessage email =new Messaging.SingleEmailMessage();
        email.setSubject('Nach Registration');
        email.setToAddresses( new String[] {'prudvi.raj@dmifinance.in','imran.khatri@dmifinance.in'} );
        email.setPlainTextBody('Nach CSV');
        email.setFileAttachments(new Messaging.EmailFileAttachment[]{csvAttc});
        Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
    }
}