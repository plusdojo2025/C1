<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<header class="header">
	<!--ヘッダー部をまとめるためのタグ -->

	<section>
		<p class="access">
			最終アクセス日時：<span id="time"></span>
		</p>
	</section>
	<div id="logo">
		<img src="${pageContext.request.contextPath}/image/logo_slogan.png"
			alt="LOGO" width="169" height="160">
	</div>
</header>