public class Apex5 {
    public decimal  exp{set;get;}
    public decimal  sal{set;get;}
    public decimal  bonus{set;get;}
    public void callApex(){
          if(exp!=null && exp>0){
              if(exp>5){
                  sal=50000;
                  bonus= sal*0.10;
              }
              else{
                  sal=30000;
                  bonus=sal*0.10;
                  apexpages.Message ss=new apexpages.Message(apexpages.Severity.confirm,'success'); 
                  apexpages.addmessage(ss); 
              }
          }
        else{
             apexpages.Message ms=new apexpages.Message(apexpages.Severity.Error,'Error');             
            apexpages.addmessage(ms); 
        }
    }

}