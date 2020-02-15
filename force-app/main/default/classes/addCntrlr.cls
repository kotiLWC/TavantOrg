public class addCntrlr {
    public Integer aval{set;get;}
    public Integer bval{set;get;}
    public Integer cval{set;get;}

    public void add(){
        system.debug('===A Value==='+aval);
        system.debug('===B Value==='+bval);
       cval = aval+bval; 
        system.debug('===C Value==='+cval);
    }
    public void reset(){
        aval =null;
        bval =null;
        cval =null;
        
    }

}