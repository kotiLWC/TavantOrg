@isTest
public class AnimalsCalloutsTestCls {
    static testMethod void testMethodForAll()
    {
        Test.startTest();
        RestResponse res = new RestResponse();
        RestRequest req = new RestRequest();
        req.httpMethod = 'Get';
        req.requestURI = '/services/apexrest/myURL/all' ; 
        RestContext.request = req;
        RestContext.response = res;
        
        AnimalsCallouts.makeGetCallout();
        Test.stopTest();  
        
    }
}