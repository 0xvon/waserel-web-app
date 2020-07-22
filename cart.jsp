<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" session="true" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="id" value="${param.id}" />
<c:set var="state" value="${param.state}" />

<!DOCTYPE html>
<html lang="ja">
<jsp:include page="./components/head.jsp" flush="true" />

<sql:setDataSource driver="org.h2.Driver" url="jdbc:h2:sdev" />
<sql:query var="orders">
    SELECT order_id, item_name, amount, price
    FROM orders, items
    WHERE order_state = 'ordered' AND items.item_id = orders.item_id
    ORDER BY ordered_at;
</sql:query>

<body>
    <jsp:include page="./components/header.jsp" flush="true" />
    <jsp:include page="./components/pagetitle.jsp?title=YOUR CART" flush="true" />
    <c:choose>
        <c:when test="${state == 'DELETE_SUCCESS'}">
            <jsp:include page="./components/snackbar.jsp?type=success&message=succeed+to+delete" flush="true" />
        </c:when>
        <c:when test="${state == 'DELETE_FAILED'}">
            <jsp:include page="./components/snackbar.jsp?type=failed&message=failed+to+delete" flush="true" />
        </c:when>
    </c:choose>

    <c:if test="${!empty orders.rows}">
        <div class="cart">
            <table class="table">
                <thead>
                    <tr>
                        <th>商品名</th>
                        <th>量</th>
                        <th>値段</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orders.rows}">
                        <tr>
                            <td>${order.item_name}</td>
                            <td>${order.amount}</td>
                            <td>￥${order.amount * order.price}</td>
                            <td>
                                <jsp:include page="./components/actionbutton.jsp?type=delete&orderId=${order.order_id}"
                                    flush="true" />
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="cart-sum">
                <div class="sum-desc">
                    <p>合計</p>
                </div>
                <div class="sum">￥xxxxxx</div>
            </div>
            <div class="confirm-button">
                <a href="/waserel/confirmation.jsp">
                    <button class="button is-rounded" type="submit">confirm</button>
                </a>
            </div>
        </div>
    </c:if>
</body>

</html>