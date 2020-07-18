<%@page language="java" contentType="text/html" pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="state" value="${param.state}" />

<%
String isCartExist = (String)session.getAttribute("isCartExist");
%>

<div class="header">
    <nav class="navbar" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
            <a href="/waserel/" class="navtar-item">
                <img src="assets/WASEREL.png" alt="icon" width=112 height="28">
            </a>
            <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false"
                data-target="navbarBasicExample">
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
            </a>
        </div>
        <div id="navbarBasicExample" class="navbar-menu">
            <c:if test="${state != 'login'}" >
                <div class="navbar-end">
                    <div class="navbar-item">
                        <a href="/waserel/history.jsp">
                            <img src="assets/history.png" alt="sales history" height="28">
                        </a>
                    </div>
                    <!-- <div class="navbar-item">
                        <a href="#">
                            <img src="assets/mypage.png" alt="mypage" height="28">
                        </a>
                    </div> -->
                    <div class="navbar-item">
                        <a href="/waserel/cart.jsp">
                            <img src="assets/cart.png" alt="cart" height="28">
                        </a>
                    </div>
                </div>
            </c:if>
        </div>
        <c:if test="${isCartExist != null}">
            <div class="badge"></div>
        </c:if>
    </nav>
</div>