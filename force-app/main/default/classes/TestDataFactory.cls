@isTest
public class TestDataFactory {
    public static Account createTestRecords(String name, string rating){
        Account a=new Account();
        a.Name=name;
        a.Rating=rating;
        //insert a;
        return a;
    }

}