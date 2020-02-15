public class Apex4 {
    public Integer Aval{set;get;}
    public Integer Bval{set;get;}
    public Integer Cval{set;get;}
    public Integer Dval{set;get;}
    public void m1(){
       Aval =10;
       Bval =20;
        m2();
    }
    public void m2(){
       Cval=30;
       Dval=40;
    }

}