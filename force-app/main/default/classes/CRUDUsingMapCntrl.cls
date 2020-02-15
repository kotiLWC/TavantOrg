public class CRUDUsingMapCntrl {
    public string name{set;get;}
    public string city{set;get;}
    public string find{set;get;}
    public string result{set;get;}
    public map<string,string> mapData {set;get;}
    public map<string,string> mapData1 {set;get;} 

    public CRUDUsingMapCntrl(){
        mapData = new map<string,string>();
        mapData1 = new map<string,string>();
       	mapData.put('ravi','hyd');   
        mapData.put('kot','ban');     
        mapData.put('kotesh','sec'); 
        mapData.put('Gangu','pak');   
    }
    public void create(){
       	mapData.put(name,city);   
    }
    public void search(){
        result = mapData.get(find);
    }
    public void Modify(){
       result=mapData.get(find);  
        name=find;     
        city=result;       
    }
     public void save(){
       mapData.put(name,city);    
    }
    public void savenew(){
       mapData.put(name,city);  
       name=null;     
       city=null;    
    } 
    public void del(){
         result=mapData.get(find);    
        mapData1.put(find,result);  
        mapData.remove(find); 
    }
    public void undel(){
         result=mapData.get(find);   
        mapData.put(find,result);    
        mapData1.remove(find); 
    }

}