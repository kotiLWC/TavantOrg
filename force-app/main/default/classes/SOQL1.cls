public class SOQL1 {
    public string find{set;get;}
    public List<account> lstAcc{set;get;}
    
    public SOQL1(){
     lstAcc = new List<account>();
     lstAcc = [Select Name,rating,industry,phone from account where rating !=null];  
    }
    public void fetchAccs(){
      lstAcc = [Select Name,rating,industry,phone from account where rating =:find];  
    }

}