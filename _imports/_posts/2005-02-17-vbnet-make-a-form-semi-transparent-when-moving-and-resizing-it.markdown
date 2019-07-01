---
layout: post
title: "VB.NET: Make a Form semi-transparent when moving and resizing it"
date: 2005-02-17 00:10:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General", "vb.net"]
redirect_from: 
  - /post/2005/02/17/VBNET-Make-a-Form-semi-transparent-when-moving-and-resizing-it
 -  /post/2005/02/17/vbnet-make-a-form-semi-transparent-when-moving-and-resizing-it
---
<!-- more -->
<p style="margin: 0in 0in 0pt" class="MsoNormal">
Here&#39;s a little VB.NET code snippet that I wrote to make a Form semi-transparent when moving and resizing it. I think this is a neat little effect to add to an application.
</p>
<p style="margin: 0in 0in 0pt" class="MsoNormal">
&nbsp;
</p>
<font size="2" color="#0000ff">Public</font><font size="2"> </font><font size="2" color="#0000ff">Class</font><font size="2"> frmTransparentMoveResize</font><font size="2"> 
<blockquote dir="ltr" style="margin-right: 0px">
	<p>
	<font size="2" color="#0000ff">Inherits</font><font size="2"> System.Windows.Forms.Form</font>
	</p>
	<font size="2" color="#0000ff">Private</font><font size="2"> _OpacityResize </font><font size="2" color="#0000ff">As</font><font size="2"> </font><font size="2" color="#0000ff">Double</font><font size="2"> = 0.5</font><font size="2"> </font><font size="2" color="#0000ff">Private</font><font size="2"> _OpacityMove </font><font size="2" color="#0000ff">As</font><font size="2"> </font><font size="2" color="#0000ff">Double</font><font size="2"> = 0.5</font><font size="2"> 
	<p>
	<font size="2" color="#0000ff">Private</font><font size="2"> _OpacityOriginal </font><font size="2" color="#0000ff">As</font><font size="2"> </font><font size="2" color="#0000ff">Double</font>
	</p>
	</font><font size="2"></font><font size="2" color="#0000ff">Private</font><font size="2"> </font><font size="2" color="#0000ff">Const</font><font size="2"> WM_NCLBUTTONDOWN </font><font size="2" color="#0000ff">As</font><font size="2"> </font><font size="2" color="#0000ff">Long</font><font size="2"> = &amp;HA1</font><font size="2"> 
	<p>
	<font size="2" color="#0000ff">Private</font><font size="2"> </font><font size="2" color="#0000ff">Const</font><font size="2"> WM_NCLBUTTONUP </font><font size="2" color="#0000ff">As</font><font size="2"> </font><font size="2" color="#0000ff">Long</font><font size="2"> = &amp;HA0</font>
	</p>
	</font><font size="2" color="#0000ff">Private</font><font size="2"> </font><font size="2" color="#0000ff">Const</font><font size="2"> WM_MOVING </font><font size="2" color="#0000ff">As</font><font size="2"> </font><font size="2" color="#0000ff">Long</font><font size="2"> = &amp;H216</font><font size="2"> 
	<p>
	<font size="2" color="#0000ff">Private</font><font size="2"> </font><font size="2" color="#0000ff">Const</font><font size="2"> WM_SIZE </font><font size="2" color="#0000ff">As</font><font size="2"> </font><font size="2" color="#0000ff">Long</font><font size="2"> = &amp;H5</font>
	</p>
	</font><font size="2" color="#0000ff">Protected</font><font size="2"> </font><font size="2" color="#0000ff">Overrides</font><font size="2"> </font><font size="2" color="#0000ff">Sub</font><font size="2"> DefWndProc(</font><font size="2" color="#0000ff">ByRef</font><font size="2"> m </font><font size="2" color="#0000ff">As</font><font size="2"> System.Windows.Forms.Message)</font><font size="2"> 
	<blockquote dir="ltr" style="margin-right: 0px">
		<p>
		<font size="2" color="#0000ff">Static</font><font size="2"> LButtonDown </font><font size="2" color="#0000ff">As</font><font size="2"> </font><font size="2" color="#0000ff">Boolean</font>
		</p>
		<font size="2">
		<p>
		<font size="2" color="#008000">&#39;Check the state of the Left Mouse Button</font>
		</p>
		</font><font size="2">
		<p>
		<font size="2" color="#0000ff">If</font><font size="2"> </font><font size="2" color="#0000ff">CLng</font><font size="2">(m.Msg) = WM_NCLBUTTONDOWN </font><font size="2" color="#0000ff">Then</font>
		</p>
		</font><font size="2">
		<blockquote dir="ltr" style="margin-right: 0px">
			<p>
			<font size="2" color="#008000">&#39;set LButtonDown to True is Left Mouse Button is down</font>
			</p>
			<font size="2">
			<p>
			LButtonDown = <font size="2" color="#0000ff">True</font>
			</p>
			</font>
		</blockquote>
		</font><font size="2">
		<p>
		<font size="2" color="#0000ff">ElseIf</font><font size="2"> </font><font size="2" color="#0000ff">CLng</font><font size="2">(m.Msg) = WM_NCLBUTTONUP </font><font size="2" color="#0000ff">Then</font>
		</p>
		</font><font size="2">
		<blockquote dir="ltr" style="margin-right: 0px">
			<p>
			<font size="2" color="#008000">&#39;set LButtonDown to False is Left Mouse Button is not down</font>
			</p>
			<font size="2">
			<p>
			LButtonDown = <font size="2" color="#0000ff">False</font>
			</p>
			</font>
		</blockquote>
		</font><font size="2">
		<p>
		<font size="2" color="#0000ff">End</font><font size="2"> </font><font size="2" color="#0000ff">If</font>
		</p>
		</font><font size="2">
		<p>
		<font size="2" color="#0000ff">If</font><font size="2"> LButtonDown </font><font size="2" color="#0000ff">Then</font>
		</p>
		</font><font size="2">
		<blockquote dir="ltr" style="margin-right: 0px">
			<p>
			<font size="2" color="#0000ff">If</font><font size="2"> </font><font size="2" color="#0000ff">CLng</font><font size="2">(m.Msg) = WM_MOVING </font><font size="2" color="#0000ff">Then</font>
			</p>
			<font size="2">
			<blockquote dir="ltr" style="margin-right: 0px">
				<p>
				<font size="2" color="#008000">&#39;Set the forms opacity to 50% if user is draging the window</font>
				</p>
				<font size="2">
				<p>
				<font size="2" color="#0000ff">If</font><font size="2"> </font><font size="2" color="#0000ff">Me</font><font size="2">.Opacity &lt;&gt; _OpacityMove </font><font size="2" color="#0000ff">Then</font>
				</p>
				</font><font size="2">
				<blockquote dir="ltr" style="margin-right: 0px">
					_OpacityOriginal = <font size="2" color="#0000ff">Me</font><font size="2">.Opacity</font><font size="2"> </font><font size="2" color="#0000ff">Me</font><font size="2">.Opacity = _OpacityMove</font><font size="2">
					<p>
					<font size="2" color="#0000ff">End</font><font size="2"> </font><font size="2" color="#0000ff">If</font>
					</p>
					</font>
				</blockquote>
				</font>
			</blockquote>
			</font><font size="2">
			<p>
			<font size="2" color="#0000ff">ElseIf</font><font size="2"> </font><font size="2" color="#0000ff">CLng</font><font size="2">(m.Msg) = WM_SIZE </font><font size="2" color="#0000ff">Then</font>
			</p>
			</font><font size="2">
			<blockquote dir="ltr" style="margin-right: 0px">
				<p>
				<font size="2" color="#008000">&#39;Set the forms opacity to 50% if user is resizing the window</font>
				</p>
				<font size="2">
				<p>
				<font size="2" color="#0000ff">If</font><font size="2"> </font><font size="2" color="#0000ff">Me</font><font size="2">.Opacity &lt;&gt; _OpacityResize </font><font size="2" color="#0000ff">Then</font>
				</p>
				</font><font size="2">
				<blockquote dir="ltr" style="margin-right: 0px">
					_OpacityOriginal = <font size="2" color="#0000ff">Me</font><font size="2">.Opacity</font><font size="2"> </font><font size="2" color="#0000ff">Me</font><font size="2">.Opacity = _OpacityResize</font><font size="2">
					<p>
					<font size="2" color="#0000ff">End</font><font size="2"> </font><font size="2" color="#0000ff">If</font>
					</p>
					</font>
				</blockquote>
				</font>
			</blockquote>
			</font><font size="2">
			<p>
			<font size="2" color="#0000ff">End</font><font size="2"> </font><font size="2" color="#0000ff">If</font>
			</p>
			</font>
		</blockquote>
		</font><font size="2">
		<p>
		<font size="2" color="#0000ff">ElseIf</font><font size="2"> </font><font size="2" color="#0000ff">Not</font><font size="2"> LButtonDown </font><font size="2" color="#0000ff">Then</font>
		</p>
		</font><font size="2">
		<blockquote dir="ltr" style="margin-right: 0px">
			<font size="2" color="#0000ff">If</font><font size="2"> </font><font size="2" color="#0000ff">Me</font><font size="2">.Opacity &lt;&gt; _OpacityOriginal </font><font size="2" color="#0000ff">Then</font><font size="2"> </font><font size="2" color="#0000ff">Me</font><font size="2">.Opacity = _OpacityOriginal</font><font size="2">
			<p>
			<font size="2" color="#0000ff">End</font><font size="2"> </font><font size="2" color="#0000ff">If</font>
			</p>
			</font>
		</blockquote>
		</font><font size="2"></font><font size="2" color="#0000ff">MyBase</font><font size="2">.DefWndProc(m)</font><font size="2">
		<p>
		<font size="2" color="#0000ff">End</font><font size="2"> </font><font size="2" color="#0000ff">Sub</font>
		</p>
		</font>
	</blockquote>
	</font><font size="2">
	<p>
	<font size="2" color="#0000ff">Public</font><font size="2"> </font><font size="2" color="#0000ff">Property</font><font size="2"> OpacityMove() </font><font size="2" color="#0000ff">As</font><font size="2"> </font><font size="2" color="#0000ff">Double</font>
	</p>
	</font><font size="2">
	<blockquote dir="ltr" style="margin-right: 0px">
		<p>
		<font size="2" color="#0000ff">Get</font>
		</p>
		<font size="2">
		<blockquote dir="ltr" style="margin-right: 0px">
			<font size="2" color="#0000ff">Return</font><font size="2"> _OpacityMove</font><font size="2">
			<p>
			<font size="2" color="#0000ff">End</font><font size="2"> </font><font size="2" color="#0000ff">Get</font>
			</p>
			</font>
		</blockquote>
		</font><font size="2"></font><font size="2" color="#0000ff">Set</font><font size="2">(</font><font size="2" color="#0000ff">ByVal</font><font size="2"> Value </font><font size="2" color="#0000ff">As</font><font size="2"> </font><font size="2" color="#0000ff">Double</font><font size="2">)</font><font size="2"> 
		<blockquote dir="ltr" style="margin-right: 0px">
			<p>
			_OpacityMove = Value
			</p>
		</blockquote>
		<p>
		<font size="2" color="#0000ff">End</font><font size="2"> </font><font size="2" color="#0000ff">Set</font>
		</p>
		</font>
	</blockquote>
	</font><font size="2">
	<p>
	<font size="2" color="#0000ff">End</font><font size="2"> </font><font size="2" color="#0000ff">Property</font>
	</p>
	</font><font size="2">
	<p>
	<font size="2" color="#0000ff">Public</font><font size="2"> </font><font size="2" color="#0000ff">Property</font><font size="2"> OpacityResize() </font><font size="2" color="#0000ff">As</font><font size="2"> </font><font size="2" color="#0000ff">Double</font>
	</p>
	</font><font size="2">
	<blockquote dir="ltr" style="margin-right: 0px">
		<p>
		<font size="2" color="#0000ff">Get</font>
		</p>
		<font size="2">
		<blockquote dir="ltr" style="margin-right: 0px">
			<font size="2" color="#0000ff">Return</font><font size="2"> _OpacityResize</font><font size="2">
			<p>
			<font size="2" color="#0000ff">End</font><font size="2"> </font><font size="2" color="#0000ff">Get</font>
			</p>
			</font>
		</blockquote>
		</font><font size="2"></font><font size="2" color="#0000ff">Set</font><font size="2">(</font><font size="2" color="#0000ff">ByVal</font><font size="2"> Value </font><font size="2" color="#0000ff">As</font><font size="2"> </font><font size="2" color="#0000ff">Double</font><font size="2">)</font><font size="2"> 
		<blockquote dir="ltr" style="margin-right: 0px">
			<p>
			_OpacityResize = Value
			</p>
		</blockquote>
		<p>
		<font size="2" color="#0000ff">End</font><font size="2"> </font><font size="2" color="#0000ff">Set</font>
		</p>
		</font>
	</blockquote>
	</font><font size="2"></font><font size="2" color="#0000ff">End</font><font size="2"> </font><font size="2" color="#0000ff">Property</font><font size="2" color="#0000ff">
	<p>
	End<font size="2"> </font><font size="2" color="#0000ff">Class</font>
	</p>
	</font>
</blockquote>
</font>
<p style="margin: 0in 0in 0pt" class="MsoNormal">
&nbsp;
</p>
