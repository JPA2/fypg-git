define([ 
        "dojo/ready", 
        "dojo/_base/array", 
        "dojo/request", 
        "dojo/query",
		"dojo/dom", 
		"dojo/dom-attr", 
		"dojo/dom-form", 
		"dojo/dom-style",
		"dojo/dom-class", 
		"dojo/dom-construct", 
		"dojo/dom-geometry",
		"dojo/string", 
		"dojo/on", 
		"dojo/aspect", 
		"dojo/_base/config",
		"dojo/_base/lang", 
		"dojo/_base/fx", 
		"dijit/registry",
		"dijit/WidgetSet", 
		"dojo/parser", 
		"aurora/admin/module" ], 
		function(ready, arrayUtil, request, query, dom, domAttr, domForm, domStyle, domClass, domConstruct, domGeometry, string, on, aspect, config, lang, baseFx, registry, widgetSet, parser) {

	// var ws = new widgetSet();
	// var workSpace = registry.byId("wSO");

	// event.stopPropagation();
	// alert("submitted");
	// console.log(registry.byNode(this));

	// | domAttr.get(dom.byId("nodeId"), "foo");
	// | // or we can just pass the id:
	// | domAttr.get("nodeId", "foo");

	// window.location = event.target.value;

	ready(function() {
		
		
			// for the pageManager buttons, will be refactored to use what is below
//			query(".pageManagerButton").on("click", function(event) {
//				event.preventDefault();
//				//alert("clicked");
//				window.location = event.target.value;
//			});
//			query(".adminUiButton").on("click", function(event) {
//				event.preventDefault();
//				//alert("clicked");
//				window.location = event.target.value;
//			});
		
		//console.log(window.activeUserId);
		//console.log(window.activeLocationId);
		// setup the active user panel
		if(window.activeUserId !== "0") {
			if(registry.byId("userId_" + window.activeUserId)) {
				var userPanel = registry.byId("userId_" + window.activeUserId);
				//console.log(userPanel);
				var userAccordion = registry.byId("userAccordion");
				userAccordion.selectChild(userPanel);
			}
		}
		if(window.activeLocationId !== "0") {
			if(registry.byId("locationId_" + window.activeLocationId)) {
				var locationPanel = registry.byId("locationId_" + window.activeLocationId);
				var locationAccordion = registry.byId("locationAccordion_" + window.activeUserId);
				locationAccordion.selectChild(locationPanel);
			}
		}
	});

	// setupDialogs = function(form) {
	// console.log(form);
	//		
	// form.onSubmit = function(e) {
	// e.preventDefault();
	// e.stopPropagation();
	// // handle the editor see above
	// //beforeSubmit();
	//			
	// request.post(form.action,
	// {
	// data: domForm.toObject("wSFO")
	// }).then(
	// function(response){
	// alert("posted");
	// },
	// function(error) {
	//					
	// }
	// );
	// };
	// },
	startup = function() {
		// console.log("start up called");
	};
	return {
		init : function() {
			startup();
		}
	};
});