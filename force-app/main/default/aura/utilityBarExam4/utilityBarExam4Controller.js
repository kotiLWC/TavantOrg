({
    getUtilityInfo : function(component, event, helper) {
        debugger;
        var utilityAPI = component.find("utilitybar");
        alert(utilityAPI);
        utilityAPI.getUtilityInfo().then(function(response) {
            if (response.utilityVisible) {
                utilityAPI.minimizeUtility();
            }
            else {
                utilityAPI.openUtility();
            }
        })
        .catch(function(error) {
            console.log(error);
        });
    }
})