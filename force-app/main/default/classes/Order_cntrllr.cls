public class Order_cntrllr {
 @AuraEnabled
    public static List<Orders__c> getOrders() {
        List<Orders__c> lstOrders = 
                [SELECT Name,Employee__c,Order_Date__c,Sale_Amount__c,City__c,State__c FROM Orders__c];
        return lstOrders;
    }

}