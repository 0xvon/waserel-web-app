<%@page language="java" contentType="text/html" pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="itemId" value="${param.itemId}" />
<c:set var="itemName" value="${param.itemName}" />
<c:set var="itemStock" value="${param.itemStock}" />
<c:set var="itemImage" value="${param.itemImage}" />

<a class="item" href="/waserel/item.jsp?id=${itemId}">
    <div class="item-img">
        <img src="assets/${itemImage}.png" alt="product">
    </div>
    <div class="item-info">
        <div class="item-name">
            <p>${itemName}</p>
        </div>
        <div class="item-stock">
            <p>
                在庫数${itemStock}
            </p>
        </div>
    </div>
</a>