<%@page import="ekaurapp.*"%>
<jsp:include page="header.jsp" />
<%
	Patient p = new Patient();
try {
	p.setName(request.getParameter(Attributes.USER_NAME));
	p.setEmail(request.getParameter(Attributes.USER_ID));
	p.setHeight(Integer.parseInt(request.getParameter(Attributes.PATIENT_HEIGHT)));
	p.setAddress(request.getParameter(Attributes.PATIENT_ADDRESS));
	p.setBloodPressure(request.getParameter(Attributes.PATIENT_BLOOD_PRESSURE));
	p.setWeight(Integer.parseInt(request.getParameter(Attributes.PATIENT_WEIGHT)));
	p.setAllergies(request.getParameter(Attributes.PATIENT_ALLERGIES));

	System.out.println(request.getParameter(Attributes.PATIENT_BLOOD_GROUP));

	p.setBloodGroup(BloodGroup.parseBloodGroup(request.getParameter(Attributes.PATIENT_BLOOD_GROUP)));

	p.setCurrentMedications(request.getParameter(Attributes.PATIENT_CURRENT_MEDS));
	p.setPastDiseases(request.getParameter(Attributes.PATIENT_PAST_DISEASES));
	p.setPass(request.getParameter(Attributes.USER_PASS));
	p.setAge(Integer.parseInt(request.getParameter(Attributes.PATIENT_AGE)));

} catch (Exception e) {
	e.printStackTrace();
	//response.sendRedirect("RegisterPatient.jsp");
}
%>

<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>Medical Appointment Form a Responsive Widget Template ::
	w3layouts</title>
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
					try {
				
						if((!(null == session.getAttribute(Attributes.USER_TYPE)))
								&& session.getAttribute(Attributes.USER_TYPE).equals(Values.USER_PATIENT)){
							p.setEmail((String)session.getAttribute(Attributes.USER_ID));
							p.setName(((Patient)session.getAttribute(Attributes.USER)).getName());
							
							p.updatePatient();
							%><h2>Registered Successfully!</h2><% 
							
						}
						else{
						p.putPatientInDB();
						out.write("<h2>Registered Successfully!</h2>");
						}
			%>
						
						<form action="Appointment.jsp" method="get">
							<div class="clear"></div>
							<input type="submit" value="Go to Appointment page">
						</form>
			<%
					} catch (Exception e) {
						response.sendRedirect("error.jsp");	
						e.printStackTrace();
					}
			%>
		</div>
	</div>
	<!--copyright-->
	<div class="copy w3ls">
		<p>
			<jsp:include page="footer.jsp" />
		</p>
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