public class AccountDisplatRecCls {
  public List<Account> getAccounts(){
      List<Account> lstAcc= [SELECT Id,Name,Rating,phone FROM Account];
      return lstAcc;
      
  }

}