public class MultipleObj {
    public account acc{set;get;}
    public contact con{set;get;}
    public opportunity opty{set;get;}
    
    public MultipleObj(){
        acc= new account();
        con=new contact();
        opty=new opportunity();
    }
    public void createObjs(){
        Insert acc;
        Insert con;
        Insert opty;
    }


}