function clock() {
	var now = new Date();
	var hours = now.getHours();
	var minutes = now.getMinutes();
	var seconds = now.getSeconds();
	var tod = (hours < 12) ? "AM" : "PM";
	
	hours = (hours > 12) ? hours - 12 : hours;
	minutes = (minutes < 10 ? "0" : "") + minutes;
	seconds = (seconds < 10 ? "0" : "") + seconds;
	
	var months = new Array('January','February','March','April','May','June','July','August','September','October','November','December');
	var days = new Array('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday');
	
	var time = hours + ":" + minutes + ":" + seconds + " " + tod;
	var date = days[now.getDay()] + ", " + now.getMonth() + " " + now.getDate() + " " + now.getFullYear();
	
	var currentDateAndTime = date + " " + time;
	
	document.getElementById('clock').innerHTML=currentDateAndTime;
}