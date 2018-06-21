<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@page import="ekaurapp.*"%>
<%
	session.setAttribute(Attributes.REFERER, "RegisterPatient.jsp");
%>
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
			<h2>Make an appointment</h2>
			<form action="DoRegister.jsp" method="get">
				<div class="left-agileits-w3layouts same">
					<div class="gaps">
						<p>Name</p>

						<%
							Patient p = null;
							if (null != session.getAttribute(Attributes.USER_TYPE)
									&& (((String) session.getAttribute(Attributes.USER_TYPE)).equals(Values.USER_PATIENT))
									&& ((String) session.getAttribute(Attributes.USER_ID))
											.equals((String) session.getAttribute(Attributes.PATIENT_ID))) {

								p = Patient.getPatientFromDb((String) session.getAttribute(Attributes.USER_ID));
								out.write("<p>" + p.getName() + "</p><br>");
							} else {
						%>

						<input type="text" name="<%out.write(Attributes.USER_NAME);%>"
							placeholder="" required="" />
						<%
							}
						%>
					</div>
					<div class="gaps">
						<p>Password</p>
						<input id="p1" type="password"
							name="<%out.write(Attributes.USER_PASS);%>" placeholder=""
							required="" />
					</div>

					<div class="gaps">
						<p>Height (in cm)</p>
						<input type="number"
							name="<%out.write(Attributes.PATIENT_HEIGHT);%>" placeholder=""
							required="" />
					</div>

					<div class="gaps">
						<p>Blood Pressure</p>
						<input type="text"
							name="<%out.write(Attributes.PATIENT_BLOOD_PRESSURE);%>"
							placeholder="" required="" />
					</div>
					<div class="gaps">
						<p>Allergies</p>
						<input type="text"
							name="<%out.write(Attributes.PATIENT_ALLERGIES);%>"
							placeholder="" required= />
					</div>
					<div class="gaps">
						<p>Current Medications</p>
						<input type="text"
							name="<%out.write(Attributes.PATIENT_CURRENT_MEDS);%>"
							placeholder="" required="" />
					</div>

				</div>
				<div class="right-agileinfo same">
					<div class="gaps">
						<p>Email</p>
						<%
							if (null != session.getAttribute(Attributes.USER_TYPE)
									&& (((String) session.getAttribute(Attributes.USER_TYPE)).equals(Values.USER_PATIENT))
									&& ((String) session.getAttribute(Attributes.USER_ID))
											.equals((String) session.getAttribute(Attributes.PATIENT_ID))) {
								p = Patient.getPatientFromDb((String) session.getAttribute(Attributes.USER_ID));
								out.write("<p>" + p.getEmail() + "</p><br>");
							} else {
						%>

						<input type="email" name="<%out.write(Attributes.USER_ID);%>"
							placeholder="" required="" />
						<%
							}
						%>


					</div>
					<div class="gaps">
						<p>Age</p>
						<input id="p1" type="number"
							name="<%out.write(Attributes.PATIENT_AGE);%>" placeholder=""
							required="" />
					</div>
					<div class="gaps">
						<p>Address</p>
						<textarea name="<%out.write(Attributes.PATIENT_ADDRESS);%>"
							placeholder="" required=""></textarea>
					</div>
					<div class="gaps">
						<p>Weight (in kg)</p>
						<input type="number"
							name="<%out.write(Attributes.PATIENT_WEIGHT);%>" placeholder=""
							required="" />
					</div>
					<div class="gaps">
						<p>Blood Group</p>
						<select name="<%out.write(Attributes.PATIENT_BLOOD_GROUP);%>"
							class="form-control">
							<option></option>
							<option value="<%out.write(BloodGroup.A_MINUS);%>">A-</option>
							<option value="<%out.write(BloodGroup.A_PLUS);%>">A+</option>
							<option value="<%out.write(BloodGroup.B_MINUS);%>">B-</option>
							<option value="<%out.write(BloodGroup.B_PLUS);%>">B+</option>
							<option value="<%out.write(BloodGroup.O_MINUS);%>">O-</option>
							<option value="<%out.write(BloodGroup.O_PLUS);%>">O+</option>
						</select>
					</div>
					<div class="gaps">
						<p>Past Diseases</p>
						<textarea
							name="<%out.write(Attributes.PATIENT_PAST_DISEASES);%>"
							placeholder="" required=""></textarea>
					</div>
				</div>

				<div class="clear">
					<%
						if (null != session.getAttribute(Attributes.USER_TYPE)
								&& (((String) session.getAttribute(Attributes.USER_TYPE)).equals(Values.USER_PATIENT))
								&& ((String) session.getAttribute(Attributes.USER_ID))
										.equals((String) session.getAttribute(Attributes.PATIENT_ID))) {
					%>
					<input type="submit" value="Update" />
					<%
						} else {
					%>
					<input type="submit" value="Register" />
					<%
						}
					%>
				</div>
				<br>
				<div class="gaps" align="center">
					<p>
						Already registered? Make an appointment, <a href="Appointment.jsp">here!</a>
					</p>
				</div>
			</form>
		</div>
	</div>
	<!--copyright-->
	<div class="copy w3ls">
		<jsp:include page="footer.jsp" />
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
	<script src="js/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#datepicker,#datepicker1,#datepicker2,#datepicker3")
					.datepicker();
		});
	</script>


	<!-- //Calendar -->

</body>
</html>