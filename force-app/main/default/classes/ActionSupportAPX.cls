public with sharing class ActionSupportAPX{
  
    public contact acc{get;set;}
    public String searchVal{get;set;}
    public List<contact> profilelst{get;set;}   
    List<string> conditions = new List<string>();
    private integer totalRecs = 0;
    private integer OffsetSize = 0;
    private integer LimitSize= 5;
    public boolean showhide{get;set;}
    public string  strQuery{get;set;}
    public string contactId{get;set;}
    public contact con {get;set;}
    public string selectval{get;set;}
    public List<contact>selectedlist{get;set;}
  public String vfParam{get; set;}

    
    public ActionSupportAPX(){
        searchVal='';
        profilelst = New List<contact>();
        profilelst=null;
        showhide=false;
        //searchProfiles();
        acc = new contact();
    }
    public void searchAcc()
    {
        totalRecs = 0;
        OffsetSize = 0;
        //system.debug('OffsetSize '+ OffsetSize );
        if(profilelst!=null && profilelst.size()>0){
            profilelst=null;
        }
        searchProfiles();
        conditions.clear();
        
    }
    
    public void searchProfiles(){
        //System.debug('Total Records is ==>'+totalRecs);
        //System.debug('OffsetSize is ==>'+OffsetSize);
        
        if(profilelst != null && !profilelst.isEmpty()){
            profilelst.clear();
        }
        strQuery ='select id,Name from contact';    
        if(searchVal !=null && searchVal  !='')
        {
            //strQuery = strQuery + 'Profile_Number__c Like \'%' +searchVal+'%\' ';
            conditions.add('Name Like \'%' +searchVal+'%\' ');
        }
        if (conditions.size() > 0) {
            strQuery += '  WHERE ' + conditions[0];
            for (Integer i = 1; i < conditions.size(); i++)
                strQuery += '  AND ' + conditions[i];
        }
        if(totalRecs !=null && totalRecs ==0){
            List<contact> accTemp = Database.query(strQuery);
            totalRecs = (accTemp !=null &&accTemp.size()>0)?accTemp.size():0;
        }
        
        strQuery += ' ORDER BY Name  ASC LIMIT :LimitSize OFFSET :OffsetSize';
        profilelst= Database.query(strQuery);
        
        //System.debug('contactList'+profilelst.size());
        //system.debug('OffsetSize0'+OffsetSize);
       // system.debug('LimitSize0'+LimitSize);
        
        if(profilelst.size() == 0)
        {
            showhide=true;
            
           // System.debug('showhide'+showhide);
        }
        else{
            
            showhide=false;
           // System.debug('showhide'+showhide);
        }
        //system.debug('contactlist'+profilelst.size());
    }
    
    public PageReference doSelectContact()
    {
       System.debug('vfParam : ' + contactId);
        return null;
    }
    
}