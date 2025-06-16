<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<nav class="nav">
  <ul class="menu2">
    <li><a href="MindShift-home">ホーム</a></li>
    <li><a href="">各種説明</a></li>
    <li><a href="">感情登録</a></li>

    <!-- 登録一覧へのPOSTリクエスト -->
    <li>
      <form action="" method="post">
        <button type="submit" class="menu-button_li" name="record">登録一覧</button>
      </form>
    </li>

    <li class="menu-item-has-submenu">
      <a href="#">アカウント</a>
      <ul>
        <!-- ログアウト -->
        <li>
          <form action="MindShift-home" method="post">
            <button type="submit" class="menu-button" name="logout" id="logout">ログアウト</button>
          </form>
        </li>
        <!-- アカウント削除 -->
        <li>
          <form action="MindShift-home" method="post">
            <button type="submit" class="menu-button" name="account_del" id="account_del">アカウント削除</button>
          </form>
        </li>
      </ul>
    </li>
  </ul>
</nav>
