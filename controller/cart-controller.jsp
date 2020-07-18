<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" session="true" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
String type = request.getParameter("type");
String itemId = request.getParameter("id");
String itemCount = (String)session.getAttribute("count");

if (session.getAttribute("isCartExist") == null) {
    session.setAttribute("isCartExist", "true");
}

response.sendRedirect("/waserel/?state=ADD_CART_SUCCESS");
%>
