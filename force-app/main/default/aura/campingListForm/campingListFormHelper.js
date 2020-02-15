({
    helperMethod : function() {

    },
    createItem : function(component){

        var newItem = component.get("v.newItem");
        console.log(newItem);
        var adItemEvent = component.getEvent('addItem');
        adItemEvent.setParams({'item': newItem});
        component.set("v.newItem", "{'sobjectType':'Camping_Item__c','Name':'',Quantity__c': 0,'Price__c': 0}");
        adItemEvent.fire();
        console.log('Event fired');
    }
})