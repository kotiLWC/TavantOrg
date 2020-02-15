public class OpptyCntlr {
    @AuraEnabled
      public static List <opportunity> getAccounts() {
        return[Select id,Name,CloseDate,Amount from opportunity ORDER BY createdDate ASC];
    }
     @AuraEnabled
    public static boolean updateAccounts(List<opportunity> editedAccountList) {
        system.debug('======TestUser===='+editedAccountList);
        try{
            update editedAccountList;
            return true;
        } catch(Exception e){
            return false;
        }
    }
    
}