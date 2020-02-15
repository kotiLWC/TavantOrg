@isTest
public class AccountTestDatafactoryTest {
    testMethod static void accountCreationTest()
    {
        Account a= TestDataFactory.createTestRecords('koti', 'hot');
        system.debug('===a==='+a);
        AccountTestDatafactory obj= new AccountTestDatafactory();
        obj.accountCreate();
    }

}