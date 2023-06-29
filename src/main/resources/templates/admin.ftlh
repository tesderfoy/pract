<!DOCTYPE html>
<html>
<head>
    <title>Журнал</title>
</head>
<body>
<h1>Электронный журнал</h1>
<hr>
<h3>Панель администратора</h3>
<a href="/registration">Добавить пользователя</a>
<hr>

<table border="1">
      <tr>
          <th>Email</th>
          <th>Имя</th>
          <th>Фамилия</th>
          <th>Предмет</th>
          <th>Активность</th>
          <th>Роль</th>
          <th>Бан</th>
          <th>Редактирование</th>
      </tr>
<#list  users as user>
    <tr>
        <th>${user.email}</th>
        <th>${user.name}</th>
        <th>${user.surname}</th>
        <th>${user.subject}</th>
        <th><#if user.active>true<#else>false</#if></th>
        <th><#list user.roles as role>${role}<#sep>, </#list></th>
        <th><form action="/admin/user/ban/${user.id}" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <input type="submit" value="Бан">
            </form> </th>
        <th><a href="/admin/user/edit/${user.id}">Редактирование</a> </th>
    </tr>

    <#else>
    <h3>Пользователей нет</h3>
</#list>
</table>
<hr>

</body>
</html>