public class AgricultureProducts {
    @AuraEnabled
    public static List<Agr_Product__c	> getProducts() {
        List<Agr_Product__c	> prdcts = 
                [SELECT Name,Amount__c, City__c, Country__c,Date__c,Region__c FROM Agr_Product__c];
        return prdcts;
    }

}