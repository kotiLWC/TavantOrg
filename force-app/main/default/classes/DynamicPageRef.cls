public class DynamicPageRef {
    public account acc{set;get;}
    public DynamicPageRef(){
        acc=new account();
    } 
    public pageReference CreatePage(){
        Insert acc;
         pagereference p=new pagereference('/'+acc.Id);
        return p;   
    }

}