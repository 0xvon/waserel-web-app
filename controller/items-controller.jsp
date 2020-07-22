<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" session="true" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="state" value="${param.state}" />
<sql:setDataSource driver="org.h2.Driver" url="jdbc:h2:sdev" />

<c:choose>
    <c:when test="${state == 'index'}">
        <sql:query var="items">
            SELECT item_id, item_name, image_url, stock_num
            FROM items;
        </sql:query>
    </c:when>
    <c:when test="${state == 'detail'}">
        <sql:setDataSource driver="org.h2.Driver" url="jdbc:h2:sdev" />
        <sql:query var="items">
            SELECT item_name, image_url, stock_num, item_code, price, description
            FROM items
            WHERE item_id = ?;
            <sql:param value="${param.id}" />
        </sql:query>
        <c:set var="item" value="${items.rows[0]}" />
    </c:when>
</c:choose>