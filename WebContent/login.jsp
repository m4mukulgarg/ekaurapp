<%@ page import="ekaurapp.*" %>
<jsp:include page="header.jsp"/>


<%

	String referer = (String)session.getAttribute(Attributes.REFERER);
	if(null == referer)
		referer = "default.jsp";
	
	if(null != session.getAttribute(Attributes.USER)){
		response.sendRedirect(referer);
	}
	
	else if(null == session.getAttribute(Attributes.USER)){
		try{
			
			Doctor d = null;
			Patient p = null;
			String userId = request.getParameter(Attributes.USER_ID);
	 		String password = request.getParameter(Attributes.USER_PASS);
			if(null != userId){
	 			d = Doctor.getDrFromDb(userId);
		 		if (null != d){
		 			if (password.equals(d.getPassword())){
			 			// Logged in successfully as Doctor
			 			session.setAttribute(Attributes.USER_TYPE,Values.USER_DOCTOR);
			 			session.setAttribute(Attributes.USER_ID, userId);
			 			session.setAttribute(Attributes.USER, d);
			 			
			 			response.sendRedirect(referer);
		 			}
		 		}
		 		else{
		 			p = Patient.getPatientFromDb(userId);
		 			if(null != p){
		 				if (password.equals(p.getPassword())){
		 		 			// Logged in successfully as patient
		 		 			session.setAttribute(Attributes.USER_TYPE,Values.USER_PATIENT);
		 		 			session.setAttribute(Attributes.USER_ID, userId);
		 		 			session.setAttribute(Attributes.USER, p);
		 		 			session.setAttribute(Attributes.PATIENT_ID,userId);
		 		 			response.sendRedirect(referer);
		 	 			}
		 			}
			 	}
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="images/favicon.ico">
<LINK
	href="css/footer.css"
	rel="stylesheet"/>
    <title>Signin</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">
  </head>

  <body>
<jsp:include page="navbar.jsp"/>
    <div class="container">

      <form class="form-signin" action="login.jsp" method="post">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputEmail" class="sr-only">User_Id</label>
        <input type ="text" id="inputUserId" name = "<% out.write(Attributes.USER_ID); %>" class="form-control" placeholder="User Id" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" name="<%out.write(Attributes.USER_PASS); %>" class="form-control" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" name="<%out.write(Attributes.USER_REMEMBER); %>" value="<%out.write(Values.REMEMBER_YES); %>"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>

    </div> <!-- /container -->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
   <jsp:include page="footer.jsp"/> 
  </body>
</html>
