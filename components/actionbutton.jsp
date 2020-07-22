<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" session="true" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="actionType" value="${param.type}" />


<c:choose>
    <c:when test="${actionType == 'add'}">
        <button class="actionButton" type="button" onclick="addCount()">＋</button>
    </c:when>
    <c:when test="${actionType == 'subtract'}">
        <button class="actionButton" type="button" onclick="subtractCount()">ー</button>
    </c:when>
    <c:when test="${actionType == 'delete'}">
        <c:set var="order_id" value="${param.orderId}" />
        <a href="/waserel/controller/cart-controller.jsp?type=delete&order_id=${order_id}">
            <button class="actionButton" type="button">✕</button>
        </a>
    </c:when>
</c:choose>