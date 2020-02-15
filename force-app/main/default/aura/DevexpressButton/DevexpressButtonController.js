({
    scriptsLoaded : function(component, event, helper) {
        $("#myButton").dxButton({
            text: "Say 'Hello world'",
            onClick: function() {
             alert('Hello world!', '', false);
            }	
        })
    }
})