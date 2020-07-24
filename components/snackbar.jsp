<%@page language="java" contentType="text/html" pageEncoding="UTF-8" session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="message" value="${param.message}" />
<c:set var="type" value="${param.type}" />

<c:choose>
    <c:when test="${type == 'success'}">
        <div id="demo-snackbar-example" class="mdl-js-snackbar mdl-snackbar success-snackbar">
            <div class="mdl-snackbar__text"></div>
            <button class="mdl-snackbar__action" type="button"></button>
        </div>
    </c:when>
    <c:when test="${type == 'failed'}">
        <div id="demo-snackbar-example" class="mdl-js-snackbar mdl-snackbar failed-snackbar">
            <div class="mdl-snackbar__text"></div>
            <button class="mdl-snackbar__action" type="button"></button>
        </div>
    </c:when>
</c:choose>

<script>
    window.onload = function () {
        'use strict';
        console.log('hell');
        var snackbarContainer = document.querySelector('#demo-snackbar-example');
        var showSnackbarButton = document.querySelector('#demo-show-snackbar');
        var handler = function (event) {
            showSnackbarButton.style.backgroundColor = '';
        };
        var data = {
            message: '${message}',
            timeout: 2000
        };
        snackbarContainer.MaterialSnackbar.showSnackbar(data);
    };
</script>