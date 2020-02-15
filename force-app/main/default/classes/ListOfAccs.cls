public class ListOfAccs {
    public List<Account> lstAcc{set;get;}
    public ListOfAccs(){
      lstAcc =[Select id,Name,Industry,rating from Account where rating !=null AND Industry != null];  
    }
}