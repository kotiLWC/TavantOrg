public with sharing class UserTasks {
    @AuraEnabled
    public static List<TaskByStatus> fetchTaskData() {
        
        if(Schema.SObjectType.Task.isAccessible()&&
           Schema.SObjectType.Task.fields.Id.isAccessible()&&
           Schema.SObjectType.Task.fields.Status.isAccessible()&&
           Schema.SObjectType.Task.fields.Activitydate.isAccessible()&&
           Schema.SObjectType.Task.fields.OwnerId.isAccessible()&&
           Schema.SObjectType.User.isAccessible()&&
           Schema.SObjectType.User.fields.Id.isAccessible()
          ){
              Date dt1 = System.today() + 7;
              Date dt2 = System.today() -7;
              
              AggregateResult[] groupedResults = [SELECT Status, Count(id) from Task where OwnerId =:UserInfo.getUserId()
                                                  AND ActivityDate < :dt1 AND ActivityDate < :dt2 Group By status];
                  }
        return null;
    }
}