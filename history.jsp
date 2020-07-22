<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" session="true" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="id" value="${param.id}" />

<!DOCTYPE html>
<html lang="ja">
<jsp:include page="./components/head.jsp" flush="true" />

<sql:setDataSource driver="org.h2.Driver" url="jdbc:h2:sdev" />
<sql:query var="orders">
    SELECT order_id, item_name, amount, price, ordered_at
    FROM orders, items
    WHERE order_state = 'delivered' AND items.item_id = orders.item_id
    ORDER BY ordered_at;
</sql:query>

<body>
    <jsp:include page="./components/header.jsp" flush="true" />
    <jsp:include page="./components/pagetitle.jsp?title=HISTORY" flush="true" />

    <div class="history">
        <table class="table">
            <thead>
                <tr>
                    <th>日時</th>
                    <th>商品名</th>
                    <th>量</th>
                    <th>値段</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${orders.rows}">
                    <tr>
                        <td>
                            <fmt:formatDate type="time" value="${order.ordered_at}" pattern="yyyy/MM/dd" />
                        </td>
                        <td>${order.item_name}</td>
                        <td>${order.amount}</td>
                        <td>￥${order.amount * order.price}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</body>

</html>