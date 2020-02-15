public class ApexParamController{
  public String vfParam{get; set;}
  public ApexParamController(ApexPages.StandardSetController controller){
    
  }
  public PageReference doActionSupport(){
    // Do Something...
    System.debug('vfParam : ' + vfParam);
    return null;
  }
}