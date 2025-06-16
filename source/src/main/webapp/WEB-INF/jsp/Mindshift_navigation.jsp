<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<nav class="nav">
   <ul class="menu2">
      <li><a href="">ホーム</a></li>
      <li ><a href="">各種説明</a></li>
      <li ><a href="">感情登録</a></li>
      <li><button id="record" class="menu-button_li" name="record">登録一覧</button></li>
      <li class="menu-item-has-submenu"><a href="">アカウント</a>
      <ul>
          <li><button id="logout" class="menu-button" name="logout">ログアウト</button></li>
          <li><button id="account_del" class="menu-button" name="account_del">アカウント削除</button></li>
      </ul>
      </li>
                     
   </ul>
   </nav>