@isTest
class TestSampleSandboxCopy {
static testMethod void testCopyScript() {
SampleSandboxCopy targetClass = new SampleSandboxCopy();
Test.testSandboxPostCopyScript(targetClass,                  
UserInfo.getOrganizationId(), 
UserInfo.getOrganizationId(), 
'SampleDev');               
List<Account> results = [SELECT Id,Name FROM Account];
System.debug('=====Account====='+results);
}
}