public class WAccOpty {
    public wacc acc{set;get;}
    public woopty opty{set;get;}
    public WAccOpty(){
        acc = new wacc();
        opty = new woopty();
    }
    public void accs(){
        if(acc.industry == 'finance'){
            acc.rating = 'Hot';
        }else{
            acc.rating ='Cold';
        }
        
    }
     public void optys(){
         if(opty.stageName =='Close Won'){
             opty.closedate =system.today();
         }else{
             opty.closedate =system.today()-1; 
         }
    }
}