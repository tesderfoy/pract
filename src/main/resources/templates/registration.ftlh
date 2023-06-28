<!DOCTYPE html>
<html>
<head>
  <title>BUYSELL</title>
</head>
<body>
<h1>BUYSELL</h1><hr>
<h4>Регистрация</h4>
<form action="/registration" method="post">
  Имя: <input type="text" name="name"><br><br>
  Фамилия: <input type="text" name="surname"><br><br>
  Эл. почта: <input type="email" name="email"><br><br>
  Предмет: <input type="text" name="subject"><br><br>
  Пароль: <input type="password" name="password"><br><br>
  <input type="hidden" name="_csrf" value="${_csrf.token}">
  <input type="submit" value="Зарегистрировать"/>
</form>
<#if errorMessage??>
    <h2 style="color: red">${errorMessage}</h2>
</#if>
</body>
</html>