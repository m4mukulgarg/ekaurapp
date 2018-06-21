<%@page import="ekaurapp.*"%>
<!-- nav bar  -->
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>

			<%
				if (((null == session.getAttribute(Attributes.USER_TYPE)))
						|| (((String) session.getAttribute(Attributes.USER_TYPE)).equals(Values.USER_GUEST))) {
			%>

			<a class="navbar-brand" href="RegisterPatient.jsp">Register</a>
			<a	class="navbar-brand" href="login.jsp?user_id=mg@m.com&password=123456">Demo (Patient)</a>
			<a	class="navbar-brand" href="login.jsp?user_id=abc@abc.com&password=abcd@1234" >Demo (Doctor)</a>
			<%
				} else if (!(null == session.getAttribute(Attributes.USER_TYPE))) {
					if (((String) session.getAttribute(Attributes.USER_TYPE)).equals(Values.USER_DOCTOR)) {
			%>
			<a class="navbar-brand" href="Pending.jsp">Pending</a>
			<%
				} else if (((String) session.getAttribute(Attributes.USER_TYPE)).equals(Values.USER_PATIENT)) {
			%>
			<a class="navbar-brand" href="profile.jsp">Profile</a> <a
				class="navbar-brand" href="Appointment.jsp">New Appointment</a>
			<%
				}
				}
			%>
		</div>
		<%
			if (((null == session.getAttribute(Attributes.USER_TYPE)))
					|| (((String) session.getAttribute(Attributes.USER_TYPE)).equals(Values.USER_GUEST))) {
		%>
		<div id="navbar" class="navbar-collapse collapse">
			<form class="navbar-form navbar-right" action="login.jsp"
				method="post">
				<div class="form-group">
					<input type="text" placeholder="User id"
						name="<%out.write(Attributes.USER_ID);%>" class="form-control">
				</div>
				<div class="form-group">
					<input type="password" placeholder="Password"
						name="<%out.write(Attributes.USER_PASS);%>" class="form-control">
				</div>
				<button type="submit" class="btn btn-success">Sign in</button>
			</form>
		</div>
		<%
			} else {
		%>
		<div id="navbar" class="navbar-collapse collapse">
			<div class="navbar-header navbar-right">
				<a class="navbar-brand" href="profile.jsp">Hello, <%
					out.write(((User) session.getAttribute(Attributes.USER)).getName());
				%>!
				</a>
				<form class="navbar-form navbar-right" action="logout.jsp"
					method="post">
					<button type="submit" class="btn btn-success">Logout</button>
				</form>
			</div>
		</div>
		<%
			}
		%>
		<!--/.navbar-collapse -->
	</div>
</nav>

