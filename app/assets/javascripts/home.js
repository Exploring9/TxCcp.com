// SELF-INVOKING FUNCTION:
/* Write with ES6 Modules - When they are supported by firefox [ALL PARTS WILL BE SEPERATE MODULES!]
 * PART 1 - GROUNDING FUNCTION
 * PART 2 - ENVIRONMENT CREATION
 * PART 3 - MANDATORY INFORMATION
 * PART 4 - PERSONAL DATA
 * PART 5 - ECONOMIC DATA
 * PART 6 - SENDING THE INFO TO CALCULATE THE TAXES
 * PART 7 - AJAX CALLER
 * PART 8 - CODE EXECUTER
 * LOAD UNDERSCORE
 */
// Listening events (The country selection changes the filing status)
var url_of_the_website = window.location.href;
console.log(url_of_the_website);
(function ($, windows){
"use strict";
$(document).ready(function() {
  // Scoping variables
  var GLOBAL_SCOPE = window;
  var DOCUMENT_SCOPE = this;
  var created_economic_classes = null; // This is to check all of the economic objects that I have been created
  // PART 2 - ENVIRONMENT CREATION 
  var environment_Creation_Tax = {
  	// PART A - Get all of the information about the country [Elements that don't need predecessors']
  	information_Fetcher: function(){
  		var selection_scope = $("[data-check=false]");//console.log(selection_scope);
  		var selected_Element_List = {
  			"name" : []
  		};
  		for (var i=0; i<selection_scope.length-1; i++) {
  			//console.log(selection_scope[i]);
            selected_Element_List["name"].push(selection_scope[i]["name"]);		
  		} 
  		// Now there is only one value - Countries - Change it for optimazation?
  		console.log(selected_Element_List);
  		ajax_Caller.ajax_Send_Input_Forms(selected_Element_List);
  	},
  	// PART B - GET THE INFO ON THE DEPENDED VARIABLES (I will need to change it since it very data dependent -> There is a strict flow)
  	information_Fetcher_Single: function(){
  		$("select[data-selector]").change(function(){
  			console.log(this);
  			console.log(this["value"]);
  			var selected_Element_List = {
  				"name" : [],
  				"from_selection": [],
  				"value" :[]
  			};
  			for (var i=0;i<1;i++){
  				selected_Element_List["name"].push(this.getAttribute("data-selector"));
  				selected_Element_List["from_selection"].push(this["name"]);
  				selected_Element_List["value"].push(this["value"]);
  			}
  			console.log(selected_Element_List);
  			ajax_Caller.ajax_Send_Input_Forms(selected_Element_List);
  		});
  	},
  	// PART C - INPUT THE ELEMENTS RECEIVED (FROM THE DB)
  	add_Input_Data: function(data){
  		console.log("environment_Creation_Tax.add_Input_Data");
  		var data = data.split(",");
  		console.log(data);
  		console.log(typeof data);
  		$("select[name="+data[0]+"]").append("<option>Select a value</option>");
  		for(var i=1;i<data.length;i++){
  			$("select[name="+data[0]+"]").append(data[i]); //Check if it would be better to add all of the strings and call append once
  		}
  	}
  };
  // PART 7 - AJAX CALLER
  var ajax_Caller = {
  	ajax_Send_Input_Forms: function (selected_Element_List) {
  		$.ajax({
  			type: 'POST',
  			//Change in the production environment
  			url:  url_of_the_website+'home/Send_Input_Data',
  			data: selected_Element_List,
  			dataType: "text", //See if it works with other datatypes
  			success: function(data) {
  				if(data){
  				  environment_Creation_Tax.add_Input_Data(data);
  				}//This is so that null values don't throw an exception
  			},
  			error: function(jqXHR, exception, errorThrown){
  				console.log(jqXHR);console.log(exception);
  				console.log(errorThrown);
  			}
  		});
  	}
  };
  // PART 8 - CODE EXECUTER
  // TODO - Execution of the functions
  //Part 2 - A (Mass data addition)
  environment_Creation_Tax.information_Fetcher();
  //Part 2 - B (Single data addition)
  environment_Creation_Tax.information_Fetcher_Single();
});
})(jQuery, window);
