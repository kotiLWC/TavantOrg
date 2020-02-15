public class empDetailsController {
    @AuraEnabled
    public static List<pesEmployee__c> getEmployees() {
        List<pesEmployee__c	> emps = 
                [SELECT Name,employeeID__c, startDate__c, endDate__c FROM pesEmployee__c];
        return emps;
    }

}