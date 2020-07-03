// iPhone style flicking support using JavaScript
// Live Sample: http://pietschsoft.com/download/javascript/iphoneflickui/
// Copyright (c) 2007, Chris Pietschmann (http://pietschsoft.com)
// All rights reserved
// You may use this code free of charge. All that I ask is
// that you leave the above copyright notice in place.
var pietschsoft_iPhoneFlickUI_MouseMovedPixels = 0;
var pietschsoft_iPhoneFlickUI_MouseMovedPixelsLast = 0;
var pietschsoft_iPhoneFlickUI_MouseLastPosition = null;
var pietschsoft_iPhoneFlickUI_IsNetscape = (navigator.appName == "Netscape");
var pietschsoft_iPhoneFlickUI_MouseIsDown = false;
var pietschsoft_iPhoneFlickUI_MouseDownTime = null;
var pietschsoft_iPhoneFlickUI_Timer = null;
function pietschsoft_iPhoneFlickUI_OnMouseDown()
{
	if (pietschsoft_iPhoneFlickUI_Timer != null) { window.clearInterval(pietschsoft_iPhoneFlickUI_Timer); }
	pietschsoft_iPhoneFlickUI_MouseMovedPixels = 0;
	pietschsoft_iPhoneFlickUI_MouseLastPosition = null;
	pietschsoft_iPhoneFlickUI_MouseDownTime = new Date;
	pietschsoft_iPhoneFlickUI_MouseIsDown = true;
}
function pietschsoft_iPhoneFlickUI_OnMouseUp()
{
	pietschsoft_iPhoneFlickUI_MouseIsDown = false;
	
	var scrolledTime = (new Date) - pietschsoft_iPhoneFlickUI_MouseDownTime;
		
	var autoDistance = 0;
	// Figure out distance to auto-scroll
	if (pietschsoft_iPhoneFlickUI_MouseMovedPixels != 0)
	{
		autoDistance = pietschsoft_iPhoneFlickUI_MouseMovedPixels / 5;
	}
	
	// Figure out how fast to scroll
	var scrollTimePerPixel = scrolledTime / Math.abs(autoDistance);
	
	// Figure out the velocity to scroll
	var scrollVelocity = 1;
	if (scrollTimePerPixel < 10)
	{
		scrollVelocity = scrollVelocity * (scrollTimePerPixel);
		if (scrollVelocity < 7.5) // If flicked fast, then scroll all the way through the list
		{
			autoDistance =  (document.documentElement.offsetHeight - document.documentElement.scrollTop);
		}
	}
	
	if (scrollTimePerPixel < 20)
	{
		pietschsoft_iPhoneFlickUI_Timer_AutoScroll( (Math.abs(autoDistance) / 1),
			(pietschsoft_iPhoneFlickUI_MouseMovedPixels < 0 ? "-" : "") + scrollVelocity,
			scrollTimePerPixel / 5 );
	}
}
function pietschsoft_iPhoneFlickUI_Timer_AutoScroll(count, length, timeout)
{
	count--;
	pietschsoft_iPhoneFlickUI_ScrollBy(length);
	
	if ((count / 10) < 1.0) // Slow it down a little each time
	{
		timeout = parseFloat(timeout) +  (count / 10);
	}
	
	if (count > 0)
	{
		pietschsoft_iPhoneFlickUI_Timer = window.setTimeout("pietschsoft_iPhoneFlickUI_Timer_AutoScroll(" + count + ", " + length + ", " + timeout + ");", timeout);
	}
}
function pietschsoft_iPhoneFlickUI_ScrollBy(y)
{
	var newY = (document.documentElement.scrollTop - y);
	if (pietschsoft_iPhoneFlickUI_IsNetscape)
	{
		window.scrollBy(0, newY);
	}
	else
	{
		window.scrollTo(document.documentElement.scrollLeft, newY);
	}

}
function pietschsoft_iPhoneFlickUI_MouseMove(e)
{
	var mouseButtonDown = pietschsoft_iPhoneFlickUI_MouseIsDown; //false;
	
	if (mouseButtonDown) //Left Mouse Button is Down
	{
		if (pietschsoft_iPhoneFlickUI_MouseLastPosition == null)
		{
			pietschsoft_iPhoneFlickUI_MouseLastPosition = e.clientY;
		}
		
		// Get how far the mouse was moved this time
		pietschsoft_iPhoneFlickUI_MouseMovedPixelsLast = (e.clientY - pietschsoft_iPhoneFlickUI_MouseLastPosition);

		// Scroll with the mouse 
		//document.body.scrollHeight
		pietschsoft_iPhoneFlickUI_ScrollBy(pietschsoft_iPhoneFlickUI_MouseMovedPixelsLast);
	
		// Get how far the mouse was moved total while the mouse button is down
		pietschsoft_iPhoneFlickUI_MouseMovedPixels += pietschsoft_iPhoneFlickUI_MouseMovedPixelsLast;
		pietschsoft_iPhoneFlickUI_MouseLastPosition = e.clientY;
		
	}
}
