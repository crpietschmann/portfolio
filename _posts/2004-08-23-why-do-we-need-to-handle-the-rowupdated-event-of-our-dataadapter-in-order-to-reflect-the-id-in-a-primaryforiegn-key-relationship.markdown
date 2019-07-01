  ---
  layout: post
  title: "Why do we need to handle the RowUpdated event of our DataAdapter in order to reflect the ID in a Primary/Foriegn key relationship??"
  date: 2004-08-23 17:39:00 -0500
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["General"]
  alias: ["/post/2004/08/23/Why-do-we-need-to-handle-the-RowUpdated-event-of-our-DataAdapter-in-order-to-reflect-the-ID-in-a-PrimaryForiegn-key-relationship", "/post/2004/08/23/why-do-we-need-to-handle-the-rowupdated-event-of-our-dataadapter-in-order-to-reflect-the-id-in-a-primaryforiegn-key-relationship"]
  ---
<!-- more -->
{% include imported_disclaimer.html %}
<P>Why do we need to handle the RowUpdated event of our DataAdapter in order to reflect the ID in a Primary/Foriegn key relationship?? Well, anyway here is a page that tells you how to do this.</P>
<P><FONT color=#0000ff size=2>AddHandler</FONT><FONT color=#000000 size=2> daChargeAttendance.RowUpdated, </FONT><FONT color=#0000ff size=2>AddressOf</FONT><FONT size=2><FONT color=#000000> FeeChargeAttendanceRowUpdated</FONT></FONT></P><FONT color=#0000ff size=2>
<P>Private</FONT><FONT size=2> </FONT><FONT color=#0000ff size=2>Sub</FONT><FONT size=2> FeeChargeRowUpdated(</FONT><FONT color=#0000ff size=2>ByVal</FONT><FONT size=2> sender </FONT><FONT color=#0000ff size=2>As</FONT><FONT size=2> </FONT><FONT color=#0000ff size=2>Object</FONT><FONT size=2>, </FONT><FONT color=#0000ff size=2>ByVal</FONT><FONT size=2> e </FONT><FONT color=#0000ff size=2>As</FONT><FONT size=2> SqlRowUpdatedEventArgs)<BR></FONT><FONT color=#0000ff size=2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Dim</FONT><FONT size=2> oCmd </FONT><FONT color=#0000ff size=2>As</FONT><FONT size=2> SqlCommand = </FONT><FONT color=#0000ff size=2>New</FONT><FONT size=2> SqlCommand("SELECT @@IDENTITY", e.Command.Connection)<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e.Row("ID") = oCmd.ExecuteScalar()<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e.Row.AcceptChanges()<BR><FONT color=#0000ff size=2>End</FONT><FONT size=2> </FONT><FONT color=#0000ff size=2>Sub</P></FONT>
<P><A href="http://codeproject.com/cs/database/relationaladonet.asp">http://codeproject.com/cs/database/relationaladonet.asp</A></P></FONT>
