<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" session="true" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="state" value="${param.state}" />

<%

String user_id = (String)session.getAttribute("user_id");

if (user_id == null) {
    response.sendRedirect("/waserel/login.jsp");
}

%>

<!DOCTYPE html>
<html lang="ja">
<jsp:include page="./components/head.jsp" flush="true" />
<jsp:include page="./controller/items-controller.jsp?state=index" flush="true" />



<body>
    <jsp:include page="./components/header.jsp" flush="true" />
    <jsp:include page="./components/pagetitle.jsp?title=ITEM" flush="true" />
    <c:choose>
        <c:when test="${state == 'LOGIN_SUCCESS'}">
            <jsp:include page="./components/snackbar.jsp?type=success&message=succeed+to+login" flush="true" />
        </c:when>
        <c:when test="${state == 'BUY_SUCCESS'}">
            <jsp:include page="./components/snackbar.jsp?type=success&message=succeed+to+buy" flush="true" />
        </c:when>
        <c:when test="${state == 'ADD_CART_SUCCESS'}">
            <jsp:include page="./components/snackbar.jsp?type=success&message=succeed+to+add+cart" flush="true" />
        </c:when>
    </c:choose>

    <div class="items">
        <c:forEach var="item" items="${items.rows}">
            <jsp:include
                page="./components/item.jsp?itemId=${item.item_id}&itemName=${item.item_name}&itemStock=${item.stock_num}&itemImage=${item.image_url}"
                flush="true" />
        </c:forEach>
    </div>
</body>

</html>