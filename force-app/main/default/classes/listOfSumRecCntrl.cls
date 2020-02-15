public class listOfSumRecCntrl {
    public Integer Sum {set;get;}
    public Integer Min {set;get;}
    public Integer Max {set;get;}
    Public List<Integer> lstRecs{set;get;}
    public void SumRecords(){
     lstRecs = new List<Integer>();
      	lstRecs.add(5);
        lstRecs.add(10);  
        lstRecs.add(20);  
        lstRecs.add(30);  
        lstRecs.add(40);  
        lstRecs.add(50);
        Sum =0;
        Min=10;
        Max=10;
        for(integer i=0;i<lstRecs.size();i++){
            if(Min>lstRecs[i]){
                Min = lstRecs[i];
            }
            if(Max<lstRecs[i]){
               Max = lstRecs[i]; 
            }
            Sum = Sum+lstRecs[i]; 
        }
    }

}