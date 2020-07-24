<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" session="true" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="state" value="${param.state}" />
<c:set var="user_id" value="${sessionScope.user_id}" />
<sql:setDataSource driver="org.h2.Driver" url="jdbc:h2:sdev" />

<c:choose>
    <c:when test="${state == 'history'}">
        <sql:query var="orders">
            SELECT order_id, item_name, amount, price, ordered_at
            FROM orders, items
            WHERE order_state = 'delivered' AND items.item_id = orders.item_id AND user_id = ?
            ORDER BY ordered_at;
            <sql:param value="${user_id}" />
        </sql:query>
        <c:set var="orders" value="${orders}" scope="request" />
    </c:when>
    <c:when test="${state == 'cart'}">
        <sql:query var="orders">
            SELECT order_id, item_name, amount, price
            FROM orders, items
            WHERE order_state = 'ordered' AND items.item_id = orders.item_id AND orders.user_id = ?
            ORDER BY ordered_at;
            <sql:param value="${user_id}" />
        </sql:query>
        <c:set var="orders" value="${orders}" scope="request" />

        <sql:query var="total_price">
            SELECT sum(amount * price) AS total_price
            FROM orders, items
            WHERE order_state = 'ordered' AND items.item_id = orders.item_id AND orders.user_id = ?;
            <sql:param value="${user_id}" />
        </sql:query>
        <c:set var="total_price" value="${total_price}" scope="request" />
    </c:when>
    <c:when test="${state == 'header'}">
        <sql:query var="order_num">
            SELECT COUNT(*) AS order_num
            FROM orders
            WHERE user_id = ? AND order_state = 'ordered';
            <sql:param value="${user_id}" />
        </sql:query>
        <c:set var="order_num" value="${order_num}" scope="request" />
    </c:when>

</c:choose>