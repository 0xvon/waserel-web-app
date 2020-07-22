<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" session="true" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.security.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%!
int login(String email, String password) {
    try {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        String encrypted_password = Base64.getEncoder().encodeToString(md.digest(password.getBytes()));
        Class.forName("org.h2.Driver");
        Connection connection = DriverManager.getConnection("jdbc:h2:sdev", "", "");
        Statement statement = connection.createStatement();

        String query = String.format("SELECT * FROM users WHERE email_address = '%s' AND encrypted_password = '%s'", email, encrypted_password);
        ResultSet resultSet = statement.executeQuery(query);
        System.out.println(resultSet.next());
        int user_id = resultSet.getInt("user_id");

        statement.close();
        connection.close();

        return user_id;

    } catch (NoSuchAlgorithmException e) {
        System.out.println(e);
        return 0;
    } catch (ClassNotFoundException e) {
        System.out.println(e);
        return 0;
    } catch (SQLException e) {
        System.out.println(e);
        return 0;
    }
}       
%>

<%

String email = request.getParameter("email");
String password = request.getParameter("password");

if (email == null || password == null) {
    response.sendRedirect("/waserel/login.jsp?state=HAS_NULL");
} else {
    int user_id = login(email, password);
    if (user_id == 0) {
        response.sendRedirect("/waserel/login.jsp?state=NOT_FOUND");
    } else {
        session.setAttribute("user_id", String.valueOf(user_id));
        response.sendRedirect("/waserel/?state=LOGIN_SUCCESS");
    }
}

%>