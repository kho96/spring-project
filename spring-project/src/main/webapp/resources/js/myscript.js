/**
 * myscript.js
 */
 
 function toDateString(milli){
 	var d = new Date(milli);
 	var year = d.getFullYear();
 	var month = d.getMonth() + 1;
 	var date = d.getDate();
 	var hour = d.getHours();
 	var minutes = d.getMinutes();
 	var seconds = d.getSeconds();
 	return year + "/" + make2digits(month) + "/" + make2digits(date) + " " + make2digits(hour) + ":" + make2digits(minutes) + ":" + make2digits(seconds);
 }
 
 function make2digits(val){
 	if(val < 10){
 		val = "0" + val;
 	}
 	return val;	
 }