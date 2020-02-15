public class TestUserController {
    @AuraEnabled
    public static List<TestUser__c> getAccounts(){
        return [SELECT Id, Name, LastName__c, Email__c, Phone__c, DOB__c FROM TestUser__c LIMIT 200];
    }
    @AuraEnabled
    public static boolean updateAccounts(List<TestUser__c> editedAccountList){
        try{
            update editedAccountList;
            return true;
        } catch(Exception e){
            return false;
        }
    }
    @AuraEnabled
    public static TestUser__c saveUser (TestUser__c acc) {
        system.debug('======TestUser===='+acc);
        upsert acc;
        return acc;
    }
    @AuraEnabled
    public static List <TestUser__c> fetchAccount(String searchKey) {
        system.debug('====Search keyWord==='+searchKey);
        String searchKey1 = searchKey + '%';
        List < TestUser__c > returnList = new List < TestUser__c > ();
        List < TestUser__c > lstOfAccount = [SELECT Id, Name, LastName__c, Email__c, Phone__c, DOB__c FROM TestUser__c where Name LIKE: searchKey1 LIMIT 500];
        
        for (TestUser__c acc: lstOfAccount) {
            returnList.add(acc);
        }
        return returnList;
    }
    @AuraEnabled
    public static List <String> deleteRecords(List <String> lstRecordId) {
        // for store Error Messages  
        List < String > oErrorMsg = new List < String > ();
        // Query Records for delete where id in lstRecordId [which is pass from client side controller] 
        List < TestUser__c > lstDeleteRec = [select Id from TestUser__c where id IN: lstRecordId];
        
        // delte contact list with Database.DeleteResult[] database class.
        // It deletes some queried contacts using <samp class="codeph apex_code">Database.<span class="statement">delete</span></samp> 
        // with a false second parameter to allow partial processing of records on failure.
        // Next, it iterates through the results to determine whether the operation was successful or not
        // for each record. and check if delete contact successful so print msg on debug, 
        // else add error message to oErrorMsg List and return the list  
        Database.DeleteResult[] DR_Dels = Database.delete(lstDeleteRec, false);
        // Iterate through each returned result
        for (Database.DeleteResult dr: DR_Dels) {
            if (dr.isSuccess()) {
                system.debug('successful delete contact');
                // Operation was successful
            } else {
                // Operation failed, so get all errors   
                oErrorMsg.add('');
                for (Database.Error err: dr.getErrors()) {
                    // add Error message to oErrorMsg list and return the list
                    oErrorMsg.add(err.getStatusCode() + ': ' + err.getMessage());
                }
            }
        }
        return oErrorMsg;
        
    }
}