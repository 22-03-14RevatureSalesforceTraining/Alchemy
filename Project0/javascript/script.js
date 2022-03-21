// Author: Johnny Tran

/* Functions listed (3): 
	- Changing bottom contents with buttons
		- Functions based on W3Schools: https://www.w3schools.com/howto/howto_js_tabs.asp
	- Opening link to external site
	- Show the current time and time zone
*/

/* Classes 'buttonPage' that display its following contents is first cleared,
   then active button is recolored to show which content is displayed,
   finally destination 'buttonLink' is colored to indicate new content */
function openPage(evt, pageName) {
	var i, buttonPage, buttonLinks;
	buttonPage = document.getElementsByClassName("buttonPage");
	for (i = 0; i < buttonPage.length; i++) {
		buttonPage[i].style.display = "none";
	}
	// console.log("Page cleared");
	
	buttonLinks = document.getElementsByClassName("buttonLinks");
	for (i = 0; i < buttonLinks.length; i++) {
		buttonLinks[i].className = buttonLinks[i].className.replace(" active", "");
	}
	// console.log("Replacing content with " + pageName);
	
	document.getElementById(pageName).style.display = "block";
	evt.currentTarget.className += " active";
}

/* object 'systemTime' created using system date and time,
   then displays system D&T text line
   where element 'Time' is located */
function showTime() {
	var systemTime = new Date();
	document.getElementById('Time').innerHTML = systemTime
	// console.log("Showing current time");
}