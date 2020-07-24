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

<body>
    <jsp:include page="./components/header.jsp" flush="true" />
    <jsp:include page="./components/pagetitle.jsp?title=CONFIRMATION" flush="true" />

    <c:choose>
        <c:when test="${state == 'HAS_NULL'}">
            <jsp:include page="./components/snackbar.jsp?type=failed&message=fill in the blank" flush="true" />
        </c:when>
        <c:when test="${state == 'BUY_FAILED'}">
            <jsp:include page="./components/snackbar.jsp?type=failed&message=failed+to+buy" flush="true" />
        </c:when>
    </c:choose>

    <form class="confirmation" action="controller/confirmation-controller.jsp" method="POST">
        <div class="field">
            <label class="label">name</label>
            <div class="control">
                <input class="input is-rounded" name="identity" type="text" placeholder="山田 太郎">
            </div>
        </div>
        <div class="field">
            <label class="label">address</label>
            <div class="control">
                <input class="input is-rounded" name="address" type="text" placeholder="東京都新宿区大久保1-1-1">
            </div>
        </div>
        <div class="field">
            <label class="label">payment</label>
            <div class="control select-button">
                <div class="select is-large">
                    <select name="payment">
                        <option selected value="credit_card">クレジットカード</option>
                        <option value="transfer">コンビニ振込</option>
                        <option value="apple_pay">Apple Pay</option>
                    </select>
                </div>
                <span class="icon is-large is-left">
                    <i class="fas fa-globe"></i>
                </span>
            </div>
        </div>

        <div class="field">
            <div class="control">
                <button class="button is-rounded" type="submit">GO</button>
            </div>
        </div>
    </form>

</body>

</html>