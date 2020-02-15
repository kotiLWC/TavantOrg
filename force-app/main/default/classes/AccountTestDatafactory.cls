public class AccountTestDatafactory {
    public Account accountCreate()
    {
      Account a= new Account();
        a.Name ='Test';
        a.Rating='hot';
        insert a;
        return a;
    }

}