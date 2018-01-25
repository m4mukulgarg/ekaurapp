<%@page import="ekaurapp.*"%>
<%session.setAttribute(Attributes.REFERER,"Appointment.jsp"); %>
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
	<jsp:include page="navbar.jsp" />
<!--background-->
	<h1>----------------------------------------</h1>
	<h1>Medical Appointment Form</h1>
	<div class="bg-agile">
		<div class="book-appointment">
			<h2>Make an appointment</h2>
			<form action="MakeAppointment.jsp" method="get">
				<div class="left-agileits-w3layouts same">
					<div class="gaps">
						<p>Name</p>
						<input type="text" class="form-control" name="name" placeholder="" required="" />
					</div>
					<div class="gaps">
						<p>Select Date</p>
						<input id="datepicker1" name="<% out.write(Attributes.DATE); %>" class="form-control" type="text" value=""
							onfocus="this.value = '';"
							onblur="if (this.value == '') {this.value = 'mm/dd/yyyy';}"
							required="">
					</div>
					
				</div>

				<div class="right-agileinfo same">
					<div class="gaps">
						<p>Email</p>
						<input type="email" class="form-control" name="<% out.write(Attributes.PATIENT_ID); %>" placeholder="" required="" />
					</div>
					<div class="gaps">
						<p>Time</p>
						<input type="text" id="timepicker" name="<% out.write(Attributes.TIME); %>"
							class="timepicker form-control" value="">
					</div>
					

				</div>
				
				<div class="clear"></div>
				<div class="gaps">
					<p>Department</p>
					<select name="<% out.write(Attributes.DEPARTMENT); %>" class="form-control">
						<option></option>
						<option value="<% out.write(Department.CARDIO); %>">Cardiology</option>
						<option value="<% out.write(Department.OPHTHAL); %>">Ophthalmology</option>
						<option value="<% out.write(Department.NEURO); %>">Neurology</option>
						<option value="<% out.write(Department.PSYCHO); %>">Psychology</option>
						<option value="<% out.write(Department.DERMAT); %>">Dermatology</option>
					</select>
				</div>
				<input type="submit" value="Make Appointment">
			</form>
		</div>
	</div>
	<!--copyright-->
	<div class="copy w3ls">
		<jsp:include page="footer.jsp"/>
	</div>
	<!--//copyright-->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/wickedpicker.js"></script>
	<script type="text/javascript">
		$('.timepicker').wickedpicker({
			twentyFour : false
		});
	</script>
	<!-- Calendar -->
	<link rel="stylesheet" href="css/jquery-ui.css" />
	<script src="js/jquery-ui.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function() {
			$("#datepicker,#datepicker1,#datepicker2,#datepicker3")
					.datepicker();
		});
	</script>
	<!-- //Calendar -->
</body>
</html>