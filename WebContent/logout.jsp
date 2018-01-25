<%@ page  language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="ekaurapp.*"%>
<%
	session.setAttribute(Attributes.USER_TYPE, null);
	session.setAttribute(Attributes.USER_ID, null);
	session.setAttribute(Attributes.USER, null);
	session.setAttribute(Attributes.PATIENT_ID,null);
	response.getWriter().write("Logged out successfully!");
	response.setHeader("Refresh", "5;url=default.jsp");
%>