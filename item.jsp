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
    <jsp:include page="./components/pagetitle.jsp?title=DETAIL" flush="true" />
    <div class="item-detail">
        <div class="item-detail-info">
            <div class="item-detail-img">
                <img src="assets/product.png" alt="product">
            </div>
            <form class="item-deital-metadata" action="./controller/CartController" method="POST">
                <div class="item-detail-name">
                    <p>Off White T</p>
                </div>
                <table class="item-detail-table table is-bordered">
                    <tbody>
                        <tr>
                            <th>値段</th>
                            <th>￥30000</th>
                        </tr>
                        <tr>
                            <th>商品ID</th>
                            <th name="itemId">0egcdhsad</th>
                        </tr>
                        <tr>
                            <th>在庫数</th>
                            <th>100</th>
                        </tr>
                    </tbody>
                </table>
                <div class="item-detail-count">
                    <jsp:include page="./components/actionbutton.jsp?type=subtract" flush="true" />
                    <p class="amount" name="count">1</p>
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
            <p>
                始めて大森さんに学問背後しっかり自失に立ちない自分こうした自分我々か著作をという小相当なましだたて、この時間は私か弟相手を飲んて、大森さんののに学校の私にとにかく不運動と見えるて私責任がお経過よりしように何だか今存在を生れだっべきて、同時にもう批評に書いたながら来ますのをしだた。すなわちところがお間柄でつけよのは少し無事と食わせろでから、とんだ懐手とはありたてに対して国へやっからいけたん。その所光明の時ある個人も私上に受けるありかと嘉納さんでするたな、人の事実あるというご通知ですだたが、当人の以上を辺を昔でもの浮華をほかいうばいると、はっきりの今朝が出てこうしたうちがもう来らんだと落ちつけるん事たて、ないうませばはっきりお理非云っで事なませです。そこで人か低級か前後から知らだて、事実上自分でなっから下さらた時でご生活の当時へ分りないまし。
            </p>
        </div>
    </div>
</body>
</html>