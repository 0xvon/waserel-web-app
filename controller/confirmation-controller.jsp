<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" session="true" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%!
boolean confirmOrder(String address, String payment_method) {
    try {
        Class.forName("org.h2.Driver");
        Connection connection = DriverManager.getConnection("jdbc:h2:sdev", "", "");
        Statement statement = connection.createStatement();

        String query = String.format("UPDATE orders SET address = '%s', payment_method = '%s', order_state = 'confirmed' WHERE order_state = 'ordered'", address, payment_method);
        System.out.println(query);
        int resultSet = statement.executeUpdate(query);

        statement.close();
        connection.close();

        return true;

    } catch (ClassNotFoundException e) {
        System.out.println(e);
        return false;
    } catch (SQLException e) {
        System.out.println(e);
        return false;
    }
}       
%>

<%
String identity = request.getParameter("identity");
String address = request.getParameter("address");
String payment = request.getParameter("payment");

if (identity == "" || address == "") {
    response.sendRedirect("/waserel/confirmation.jsp?state=HAS_NULL");
} else {
    boolean isConfirmSucceed = confirmOrder(address, payment);
    if (isConfirmSucceed) {
        response.sendRedirect("/waserel/?state=BUY_SUCCESS");
    } else {
        response.sendRedirect("/waserel/confirmation.jsp?state=BUY_FAILED");
    }
    
}
%>