@isTest
public class wrapperListAccountTest {
    testMethod static void wrapperListAccountTestMethod()
    {
        Account acc = new Account();
        acc.Name = 'Challa KoteswaRao';
        acc.Phone = '7702467702';
        Insert acc;
        
        Contact con = new Contact();
        con.LastName ='Janu';
        con.AccountId = acc.id;
        Insert con;
        wrapperListAccount obj = new wrapperListAccount();
        //obj.wrapperListAccount();
        obj.displayAcc();
    }

}