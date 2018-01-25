<%@ page import="ekaurapp.*,java.io.*,java.util.*"%>
<!-- Set up hitCount -->
<%
	Integer hits = 0;
	if(null != (getServletContext().getAttribute(Attributes.HIT_COUNT))){
		hits = (Integer) getServletContext().getAttribute(Attributes.HIT_COUNT);
	}
	getServletContext().setAttribute(Attributes.HIT_COUNT, ++hits);
	
%>
<!-- //hitCount set up -->
