<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" session="true" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
String identity = request.getParameter("identity");
String address = request.getParameter("address");
String payment = request.getParameter("payment");

if (identity == "" || address == "") {
    response.sendRedirect("/waserel/confirmation.jsp");
} else {
    session.setAttribute("isCartExist", null);
    response.sendRedirect("/waserel/");
}
%>
