<%@page import="ekaurapp.*"%>
<%session.setAttribute(Attributes.REFERER,"default.jsp"); %>
<jsp:include page="header.jsp"/>

<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>Medical Appointment Form</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Medical Appointment Form template Responsive, Login form web template,Flat Pricing tables,Flat Drop downs Sign up Web Templates, 
 Flat Web Templates, Login sign up Responsive web template, SmartPhone Compatible web template, free web designs for Nokia, Samsung, LG, SonyEricsson, Motorola web design">
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Custom Theme files -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="css/wickedpicker.css" rel="stylesheet" type='text/css'
	media="all" />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!--fonts-->
<link href="//fonts.googleapis.com/css?family=Roboto:300,400,500,700"
	rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Droid+Sans:400,700"
	rel="stylesheet">
<!--//fonts-->
</head>
<body>

	<%if(!(null == session.getAttribute(Attributes.USER))){
		if (((String)session.getAttribute(Attributes.USER_TYPE)).equals(Values.USER_PATIENT)) {%>
		<jsp:include page="profile.jsp"/>
		<%}
		if (((String)session.getAttribute(Attributes.USER_TYPE)).equals(Values.USER_DOCTOR)) {%>
		<jsp:include page="Pending.jsp"/>
	<%	}
	}
	else { %>
		<jsp:include page="Appointment.jsp"/>
	<%} %>		
</body>
</html>