public class wrapperListAccount 
{
    public list<wrapperAcc> wrappAccList{get;set;}
    public list<Account> getAccList = new list<Account>();
    public list<Contact> conList{get;set;}
    public boolean selectedCheck{get;set;}
    
  public wrapperListAccount()
    {   selectedCheck = false;
        wrappAccList = new list<wrapperAcc>();
        for(Account aa : [SELECT id,name,phone from Account WHERE name != null])
        {
            wrappAccList.add(new wrapperAcc(false,aa));
        }
    }
    
    public pagereference displayAcc()
    {    
        selectedCheck = true;
        conList = new list<Contact>();
        for(wrapperAcc aaa : wrappAccList)
        {
            if(aaa.checked == true)
                getAccList.add(aaa.acc);
              system.debug('@@@@@@@@@@@@@@@'+aaa.acc.name);
        }
        update getAccList;
        for(Contact c : [SELECT id,lastname,accountid,account.name from contact WHERE accountid IN: getAccList])
        {
            c.lastname = c.Account.name +'Contact';
            conList.add(c);
        }
        update conList;
        return null;
    }
    
public class wrapperAcc
{
    public Account acc{get;set;}
    public Boolean checked{get;set;}
    
    Public wrapperAcc(Boolean bool,Account aa)
    {
        acc = aa;
        checked = bool;
    }
}
}