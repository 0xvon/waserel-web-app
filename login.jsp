<%@page language="java" contentType="text/html" pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ja">
<jsp:include page="./components/head.jsp" flush="true" />
<body>
    <jsp:include page="./components/header.jsp" flush="true" />
    <jsp:include page="./components/pagetitle.jsp?title=LOGIN" flush="true" />
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
                <button class="button is-rounded" type="submit">Submit</button>
            </div>
        </div>
    </form>
</body>
</html>