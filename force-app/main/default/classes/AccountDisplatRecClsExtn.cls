public class AccountDisplatRecClsExtn {
    public List<Contact> contList {get;set;}
    public AccountDisplatRecClsExtn(AccountDisplatRecCls act){
        contList = [select id,FirstName,LastName,Email from Contact];
    }
}