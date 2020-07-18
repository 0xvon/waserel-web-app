<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" session="true" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%

String email = (String)session.getAttribute("email");
String password = (String)session.getAttribute("password");

if (email == null || password == null) {
    response.sendRedirect("/waserel/login.jsp");
}

%>

<!DOCTYPE html>
<html lang="ja">
<jsp:include page="./components/head.jsp" flush="true" />
<body>
    <jsp:include page="./components/header.jsp" flush="true" />
    <jsp:include page="./components/pagetitle.jsp?title=ITEM" flush="true" />
    <div class="items">
        <jsp:include page="./components/item.jsp?itemId=1&itemName=OffWhite+T+Shirt&itemStock=1000&itemImage=product" flush="true" />
        <jsp:include page="./components/item.jsp?itemId=1&itemName=OffWhite+T+Shirt&itemStock=1000&itemImage=product" flush="true" />
        <jsp:include page="./components/item.jsp?itemId=1&itemName=OffWhite+T+Shirt&itemStock=1000&itemImage=product" flush="true" />
        <jsp:include page="./components/item.jsp?itemId=1&itemName=OffWhite+T+Shirt&itemStock=1000&itemImage=product" flush="true" />
        <jsp:include page="./components/item.jsp?itemId=1&itemName=OffWhite+T+Shirt&itemStock=1000&itemImage=product" flush="true" />
        <jsp:include page="./components/item.jsp?itemId=1&itemName=OffWhite+T+Shirt&itemStock=1000&itemImage=product" flush="true" />
    </div>
</body>
</html>