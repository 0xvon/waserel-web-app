<%@page language="java" contentType="text/html" pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="state" value="${param.state}" />

<!DOCTYPE html>
<html lang="ja">
<jsp:include page="./components/head.jsp" flush="true" />

<body>
    <jsp:include page="./components/header.jsp?state=login" flush="true" />
    <jsp:include page="./components/pagetitle.jsp?title=LOGIN" flush="true" />
    <c:choose>
        <c:when test="${state == 'NOT_FOUND'}">
            <jsp:include page="./components/snackbar.jsp?type=failed&message=there is no email address" flush="true" />
        </c:when>
        <c:when test="${state == 'HAS_NULL'}">
            <jsp:include page="./components/snackbar.jsp?type=failed&message=please fill in the blank" flush="true" />
        </c:when>
        <c:when test="${state == 'ADD_CART_SUCCESS'}">
            <jsp:include page="./components/snackbar.jsp?type=success&message=succeed+to+add+cart" flush="true" />
        </c:when>
    </c:choose>

    <form class="login" action="controller/login-controller.jsp" method="POST">
        <div class="field">
            <label class="label">email</label>
            <div class="control">
                <input class="input is-rounded" name="email" type="text" placeholder="example@gmail.com">
            </div>
        </div>
        <div class="field">
            <label class="label">password</label>
            <div class="control">
                <input class="input is-rounded" name="password" type="text" placeholder="p@ssword">
            </div>
        </div>

        <div class="field">
            <div class="control">
                <button class="button is-rounded" type="submit">login</button>
            </div>
        </div>
    </form>
</body>

</html>