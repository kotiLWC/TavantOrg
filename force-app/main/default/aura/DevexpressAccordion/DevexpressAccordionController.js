({
    scriptsLoaded : function(component, event, helper) {
        var accordionData = [{
            title: "Personal Data",
            firstName: "John",
            lastName: "Smith",
            birthYear: 1986
        }, {
            title: "Contacts",
            phone: "(555)555-5555",
            email: "John.Smith@example.com"
        }, {
            title: "Address",
            state: "CA",
            city: "San Francisco",
            street: "Stanford Ave"
        }];
        $(function () {
            $("#accordionContainer").dxAccordion({
                dataSource: accordionData,
                itemTemplate: function (itemData, itemIndex, itemElement) {
                    for (var field in itemData) {
                        itemElement.append("<p>" + field + ": " + itemData[field] + "</p>");
                    }
                }
            });
        });
    }
})