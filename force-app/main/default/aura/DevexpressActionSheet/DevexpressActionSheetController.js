({
    scriptsLoaded : function(component, event, helper) {
        var processClick = function (name) {
            DevExpress.ui.notify(name + " clicked", "success", 3000);
        }
        $(function() {
            $("#buttonContainer").dxButton({
                text: 'Show the ActionSheet',
                onClick: function () {
                    // Shows the ActionSheet widget
                    $("#actionSheetContainer").dxActionSheet("instance").show();
                }
            });
        })
        $("#actionSheetContainer").dxActionSheet({
        dataSource: [
            { text: "Reply",icon: 'arrowleft', onClick: function () { processClick("Reply") } },
            { text: "Reply All",icon: 'arrowleft', onClick: function () { processClick("Reply All") } },
            { text: "Forward",icon: 'arrowright', onClick: function () { processClick("Forward") } },
            { text: "Delete",icon: 'close', onClick: function () { processClick("Delete") } }
        ]
    });
    }
 })