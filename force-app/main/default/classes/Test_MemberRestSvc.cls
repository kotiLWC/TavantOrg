@isTest
private class Test_MemberRestSvc {

static {
// setup test data  
}

static testMethod void testDoGet() {

RestRequest req = new RestRequest(); 
RestResponse res = new RestResponse();

req.requestURI = 'https://cs9.salesforce.com/services/apexrest/v.9/member/me/results/today';  
req.httpMethod = 'GET';
RestContext.request = req;
RestContext.response = res;

MemberRestSvc.ReturnClass results = MemberRestSvc.doGet();


}

}