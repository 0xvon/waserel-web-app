<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" session="true" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="id" value="${param.id}" />

<!DOCTYPE html>
<html lang="ja">
<jsp:include page="./components/head.jsp" flush="true" />

<script>
    function addCount() {
        var count = Number(document.getElementsByClassName("amount")[0].textContent);
        if (count < 100) {
            count = count + 1;
            document.getElementsByClassName("amount")[0].textContent = count;
        }
    }
    function subtractCount() {
        var count = Number(document.getElementsByClassName("amount")[0].textContent);
        if (count > 1) {
            count = count - 1;
            document.getElementsByClassName("amount")[0].textContent = count;
        }
    }
</script>

<body>
    <jsp:include page="./components/header.jsp" flush="true" />
    <jsp:include page="./components/pagetitle.jsp?title=YOUR CART" flush="true" />

    <div class="cart">
        <table class="table">
            <thead>
                <tr>
                    <th>商品名</th>
                    <th>サイズ</th>
                    <th>量</th>
                    <th>値段</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Off-White T</td>
                    <td>M</td>
                    <td>1</td>
                    <td>300000</td>
                    <td><jsp:include page="./components/actionbutton.jsp?type=delete" flush="true" /></td>
                </tr>
                <tr>
                    <td>Off-White T</td>
                    <td>M</td>
                    <td>1</td>
                    <td>300000</td>
                    <td><jsp:include page="./components/actionbutton.jsp?type=delete" flush="true" /></td>
                </tr>
                <tr>
                    <td>Off-White T</td>
                    <td>M</td>
                    <td>1</td>
                    <td>300000</td>
                    <td><jsp:include page="./components/actionbutton.jsp?type=delete" flush="true" /></td>
                </tr>
            </tbody>
        </table>
        <div class="cart-sum">
            <div class="sum-desc"><p>合計</p></div>
            <div class="sum">￥1500000</div>
        </div>
        <div class="confirm-button">
            <button class="button is-rounded" type="submit">confirm</button>
        </div>

    </div> 
    
</body>
</html>