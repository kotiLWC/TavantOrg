@isTest
public class Nach_Status1Test {
    testMethod static void method1(){
        Account acc= new Account();
        acc.Name='TestTriggerAccount';
        acc.Rating='Hott';
        insert acc;
        
        Opportunity opp= new Opportunity();
        opp.Name = 'TestOppName';
        opp.AccountId=acc.Id;
        opp.CloseDate=system.today();
        opp.StageName='Qualification';
        insert opp;
       Nach_Registration_List__c nrl = new Nach_Registration_List__c();
        nrl.name='List1';
        nrl.Refer__c='TestOppName';//i used this field as a text field name same as opportunity name then only it's passed
        nrl.Status__c='Active';
        insert nrl;
       
    }

}