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
<sql:query var="items">
    SELECT item_name, image_url, stock_num, item_code, price, description
    FROM items
    WHERE item_id = ?;
    <sql:param value="${id}" />
</sql:query>
<c:set var="item" value="${items.rows[0]}" />

<script>
    function addCount() {
        var count = Number(document.getElementsByClassName("amount")[0].value);
        var stock = Number(document.getElementsByClassName("stock_num")[0].textContent);
        console.log(stock)
        if (count < stock) {
            count = count + 1;
            document.getElementsByClassName("amount")[0].value = count;
        }
    }
    function subtractCount() {
        var count = Number(document.getElementsByClassName("amount")[0].value);
        if (count > 1) {
            count = count - 1;
            document.getElementsByClassName("amount")[0].value = count;
        }
    }
</script>

<body>
    <jsp:include page="./components/header.jsp" flush="true" />
    <jsp:include page="./components/pagetitle.jsp?title=DETAIL" flush="true" />
    <div class="item-detail">
        <div class="item-detail-info">
            <div class="item-detail-img">
                <img src="${item.image_url}" alt="product">
            </div>
            <form class="item-deital-metadata" action="./controller/cart-controller.jsp?type=add&id=${id}"
                method="POST">
                <div class="item-detail-name">
                    <p>${item.item_name}</p>
                </div>
                <table class="item-detail-table table is-bordered">
                    <tbody>
                        <tr>
                            <th>値段</th>
                            <th>￥${item.price}</th>
                        </tr>
                        <tr>
                            <th>商品ID</th>
                            <th>${item.item_code}</th>
                        </tr>
                        <tr>
                            <th>在庫数</th>
                            <th class="stock_num">${item.stock_num}</th>
                        </tr>
                    </tbody>
                </table>
                <div class="item-detail-count">
                    <jsp:include page="./components/actionbutton.jsp?type=subtract" flush="true" />
                    <input type="text" class="amount" name="count" value="1"></input>
                    <jsp:include page="./components/actionbutton.jsp?type=add" flush="true" />
                </div>
                <div class="field">
                    <div class="control">
                        <button class="button is-rounded" type="submit">add cart</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="item-detail-description">
            <p>${item.description}</p>
        </div>
    </div>
</body>

</html>