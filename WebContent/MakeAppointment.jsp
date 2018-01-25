<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.*,java.util.*,ekaurapp.*"%>

<%
try{
	request.setAttribute(Attributes.ERROR_INFO, "");
	if (Appointment.makeAppointment(request))
		response.getWriter().write("Successfully created the appointment");
	else {
		out.print(request.getAttribute(Attributes.ERROR_INFO));
	}
	response.setHeader("Refresh", "5;url=default.jsp");
}
catch(Exception e){
	response.sendRedirect("error.jsp");
	e.printStackTrace();
}
%>