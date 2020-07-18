<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" session="true" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
String email = request.getParameter("email");
String password = request.getParameter("password");

if (email == "" || password == "") {
    response.sendRedirect("/waserel/login.jsp"); 
} else {
    session.setAttribute("email", email);
    session.setAttribute("password", password);
    response.sendRedirect("/waserel/?state=LOGIN_SUCCESS");
}
%>

${email}<br>
${password}<br>