({
    getEnclosingTabId : function(component, event, helper) {
        var utilityAPI = component.find("utilitybar");
        utilityAPI.getEnclosingUtilityId().then(function(utilityId) {
            console.log(utilityId);
        })
        .catch(function(error) {
            console.log(error);
        });
    }
})