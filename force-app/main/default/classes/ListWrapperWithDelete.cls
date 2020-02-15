public class ListWrapperWithDelete {
    public List<wrapperData> lw{set;get;}
    public ListWrapperWithDelete(){
       lw = new List<wrapperData>();
        for(integer i=0;i<10;i++){
        wrapperData w = new wrapperData();
        w.Name ='Koti'+i;
        w.age =28+i;
        w.checkBox =false;
        lw.add(w);
        }
    }   
    
    public class wrapperData{
        public string Name{set;get;}
        public Integer age{set;get;}
        public boolean checkBox{set;get;}
  
    }
    public void del(){
          for(integer c=0;c<lw.size();c++){ 
              if(lw[c].checkBox==True) { 
                  lw.remove(c);   
                  c--;    
              }    
          }
    }

}