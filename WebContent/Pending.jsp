<%@page import="ekaurapp.*,java.util.*"%>



<%session.setAttribute(Attributes.REFERER,"Pending.jsp");	%>

<jsp:include page="header.jsp" />

<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>Pending | Medical Appointment Form</title>
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
	<jsp:include page="navbar.jsp" />
	<!--background-->
	<h1>----------------------------------------</h1>
	<h1>Medical Appointment Form</h1>
	<div class="bg-agile">
		<div class="book-appointment">

			
			<%
				if (!(null == session.getAttribute(Attributes.USER_TYPE))){
					if (((String) session.getAttribute(Attributes.USER_TYPE)).equals(Values.USER_DOCTOR)) {
							Doctor d = (Doctor) session.getAttribute(Attributes.USER);
							ArrayList<Appointment> appointments = Appointment.getTodaysAppointmentsFromDb(d.getDepartment().getDepartmentString());
						
			%>
			<h2>Pending appointments</h2>
			<form action="">
				<%
					for (Appointment a : appointments) {
				%>
				<div class="clear"></div>
				<div class="gaps">
					<p>
						<u>UserId:</u>&nbsp;<%
							out.write(a.getPatientEmailId());
						%>
						&nbsp;&nbsp;&nbsp; <u>Time:</u>&nbsp;
						<%
							out.write(a.getFormTimeString());
						%>
						&nbsp;&nbsp;&nbsp; <a
							href="profile.jsp?<%out.write(Attributes.PATIENT_ID + "=" + a.getPatientEmailId());%>">Profile</a>
						&nbsp;&nbsp;&nbsp; <a
							href="close.jsp?<%out.write(Attributes.APPOINTMENT_ID + "=" +a.getId());%>">Close</a>
					</p>
				</div>
				<%
					}
				%>

			</form>
			<%
				}
			} 
			%>
			
			<% if(null == session.getAttribute(Attributes.USER_TYPE) 
					|| (!((String)session.getAttribute(Attributes.USER_TYPE)).equals(Values.USER_DOCTOR)) ) {%>
			<h2>You need to be logged in as a doctor to view pending
				appointments!</h2>
			<%
				}
			%>
		</div>
	</div>
	<!--copyright-->
	<div class="copy w3ls">
		<jsp:include page="footer.jsp" />
	</div>
	<!--//copyright-->

</body>
</html>