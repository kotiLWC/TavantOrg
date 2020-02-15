trigger trgMnUpdateContactFieldsFromUserTable on Contact (before insert, before update) {
Set<Id> userIds = new Set<Id>();
for (Contact a : Trigger.new){
  userIds.add(a.OwnerId);
}
Map<Id, User> fields = new Map<Id, User>([select Name from User where id in :userIds]);
for (Contact a : Trigger.new) {
a.ConUserOwner__c = fields.get(a.OwnerId).Name;

}
}