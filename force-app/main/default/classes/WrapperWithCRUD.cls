public class WrapperWithCRUD {
    public string Name{set;get;}
    public string Age{set;get;}
    public string EName{set;get;}
    public string EAge{set;get;}
    public integer x {set;get;}
    public List<wrapperDeclaration> lwd{set;get;}
    public List<wrapperDeclaration> EditedRecs{set;get;}
    public WrapperWithCRUD(){
     lwd = new List<wrapperDeclaration>();
    }
    public void create(){
       wrapperDeclaration w = new wrapperDeclaration(); 
        w.wName =Name;
        w.wAge =Age;
        w.wSelectBox =false;
        lwd.add(w);
    }
    public void del(){
         for(integer c=0;c<lwd.size();c++){ 
              if(lwd[c].wSelectBox==True) { 
                  lwd.remove(c);   
                  c--;    
              }    
          }
    }
     public void edit(){
         for(integer c=0;c<lwd.size();c++){ 
              if(lwd[c].wSelectBox==True) { 
               system.debug('===Name=='+lwd[c].wName);
               system.debug('===Name=='+lwd[c].wAge);
                  Name = lwd[c].wName;
                  Age = lwd[c].wAge;
                  x=c;
                  break;
              }    
          }
    }
    public void SaveEdit(){
        lwd[x].wName =Name;
        lwd[x].wAge = Age;
        lwd[x].wSelectBox = false;
    }
    
    public class wrapperDeclaration{
        public string wName{set;get;}
        public string wAge{set;get;}
        public Boolean wSelectBox{set;get;}

    }

}