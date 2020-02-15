public class wrapperList {
    public List<wrapper> lw{set;get;}
    public wrapperList(){
       lw = new List<wrapper>();
        for(integer i=0;i<10;i++){
        wrapper w = new wrapper();
        w.Name ='Koti'+i;
        w.age ='30';
        lw.add(w);
        }
    }   
    
    public class wrapper{
        public string Name{set;get;}
        public string age{set;get;}
  
    }

}