<%@ page import ="ekaurapp.*"%>

<% 
String referer = "Pending.jsp";
System.out.println("aaa" + request.getParameter(Attributes.APPOINTMENT_ID));
Appointment  a = Appointment.getAppointmentFromDb(request.getParameter(Attributes.APPOINTMENT_ID));
a.close();
response.sendRedirect(referer);
%>