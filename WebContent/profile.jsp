<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import = "ekaurapp.*" %>
<%session.setAttribute(Attributes.REFERER,"profile.jsp"); %>
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>Medical Appointment Form a Responsive Widget Template :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Medical Appointment Form template Responsive, Login form web template,Flat Pricing tables,Flat Drop downs Sign up Web Templates, 
 Flat Web Templates, Login sign up Responsive web template, SmartPhone Compatible web template, free web designs for Nokia, Samsung, LG, SonyEricsson, Motorola web design">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Custom Theme files -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="css/wickedpicker.css" rel="stylesheet" type='text/css' media="all" />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!--fonts--> 
<link href="//fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Droid+Sans:400,700" rel="stylesheet">
<!--//fonts--> 
</head>
<body>
<jsp:include page="navbar.jsp"/>
<!--background-->
<h1>----------------------------------------</h1>
<h1> Profile </h1>
    <div class="bg-agile">
	<div class="book-appointment">
	<%
	Patient p = null;
	if((null == session.getAttribute(Attributes.USER_TYPE))){
		out.write("<h2>Please <a href = \"login.jsp\">Login</a> to view your or a patient's profile.</h2>");
	}
	
	else{
		p = Patient.getPatientFromDb((String)session.getAttribute(Attributes.PATIENT_ID));
		
		if(null == p){
			p = Patient.getPatientFromDb((String)request.getParameter(Attributes.PATIENT_ID));
			if(null == p){
				out.write("<h2>You have supplied an invalid or no Patient_ID.</h2>");
			}
		}
	}
	
	if(null != p){
	
	%>
		
		<form action = "RegisterPatient.jsp">
			<div class="left-agileits-w3layouts same">
				<div class="gaps">
					<p>Name:</p>
					<p><% out.write(p.getName()); %></p>
					<br>
				</div>
				
				
				<div class="gaps">	
					<p>Height (in cm)</p>
					<p><% out.write(p.getHeight()); %></p>
					<br>
				</div>
				
				<div class="gaps">
				<p>Blood Pressure</p>
					<p><% out.write(p.getBloodPressure()); %></p>
					<br>
				</div>
				<div class="gaps">
				<p>Allergies</p>
					<p><% out.write(p.getAllergies()); %></p>
					<br>
				</div>
				<div class="gaps">
				<p>Current Medications</p>
					<p><% out.write(p.getCurrentMedications()); %></p>
					<br>
				</div>
				
			</div>
			<div class="right-agileinfo same">
			<div class="gaps">
				<p>Email</p>
					<p><% out.write(p.getEmail()); %></p>
					<br>
				</div>	
			<div class="gaps">
					<p>Address</p>
					<p><% out.write(p.getAddress()); %></p>
					<br>
				</div>
			<div class="gaps">	
				<p>Weight (in kg)</p>
					<p><% out.write(p.getWeight()); %></p>
					<br>
				</div><div class="gaps">
					<p>Blood Group</p>
					<p><% out.write(p.getBloodGroup().getBloodGroupString()); %></p>
					<br>
				</div>	
				<div class="gaps">
					<p>Past Diseases</p>
					<p><% out.write(p.getPastDiseases()); %></p>
					<br>
				</div>
			</div>
			
			<div class="clear"><input onclick="chkPwd()" type="submit" value="Edit Details"/></div>
			</form>
			<%}
	
			%>
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
				$('.timepicker').wickedpicker({twentyFour: false});
			</script>
		<!-- Calendar -->
				<link rel="stylesheet" href="css/jquery-ui.css" />
				<script src="js/jquery-ui.js"></script>
				  <script>
						  $(function() {
							$( "#datepicker,#datepicker1,#datepicker2,#datepicker3" ).datepicker();
						  });
				  </script>
			<!-- //Calendar -->
			

</body>
</html>
