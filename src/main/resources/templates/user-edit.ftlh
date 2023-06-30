<!DOCTYPE html>
<html>
<head>
    <title>Электронный журнал</title>
</head>
<body>
<h1>Электронный журнал</h1><hr>
<h3>Редактирование пользователя ${user.email}</h3>
<form action="/admin/user/edit" method="post">
    <#list roles as role>
<div>
    <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
</div>
    </#list>
    <input type="hidden" name="userId" value="${user.id}">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button type="submit">Сохранить</button>
</form>
<br>
<form action="/admin/user/delete/${user.id}" method="post">
    <input type="submit" value="Удалить"/>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
</form>
</body>
</html>