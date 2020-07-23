<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" session="true" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%!
boolean addOrder(String item_id, String count, String user_id) {
    try {
        Class.forName("org.h2.Driver");
        Connection connection = DriverManager.getConnection("jdbc:h2:sdev", "", "");
        Statement statement = connection.createStatement();

        String query = String.format("INSERT INTO orders (item_id, user_id, amount, order_state) VALUES (%s, %s, %s, 'ordered')", item_id, user_id, count);
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

<%!
boolean cancelOrder(String order_id) {
    try {
        Class.forName("org.h2.Driver");
        Connection connection = DriverManager.getConnection("jdbc:h2:sdev", "", "");
        Statement statement = connection.createStatement();

        String query = String.format("UPDATE orders SET order_state = 'canceled' WHERE order_id = %s", order_id);
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
String type = request.getParameter("type");

switch (type) {
    case "add":
        String item_id = request.getParameter("id");
        String count = request.getParameter("count");
        String user_id = (String)session.getAttribute("user_id");
        
        boolean isAddSucceed = addOrder(item_id, count, user_id);
        if (isAddSucceed) {
            response.sendRedirect("/waserel/?state=ADD_CART_SUCCESS");
        } else {
            response.sendRedirect("/waserel/?state=ADD_CART_FAILED");
        }
        
        break;
    case "delete":
        String order_id = request.getParameter("order_id");
        boolean isDeleteSucceed = cancelOrder(order_id);
        if (isDeleteSucceed) {
            response.sendRedirect("/waserel/cart.jsp?state=DELETE_SUCCESS");
        } else {
            response.sendRedirect("/waserel/cart.jsp?state=DELETE_FAILED");
        }

        break;
    default:
        response.sendRedirect("/waserel/");
        break;
}
%>