({
getInput  : function(cmp, event) {
	var fullName = cmp.find("name").get("v.value");
	console.log('fullName::::'+fullName);
	var outName = cmp.find("nameOutput");
	outName.set("v.value", fullName);
	console.log('outName::::'+outName);

}
})