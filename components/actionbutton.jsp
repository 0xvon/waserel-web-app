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
        <button class="actionButton" type="button" onclick="deleteOrder()">✕</button>
    </c:when>
</c:choose>
