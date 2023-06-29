<!DOCTYPE html>
<html>
<head>
    <title>Электронный журнал</title>
</head>
<body>
<h1>Электронный журнал</h1>
<hr>
<#if user.email??>
<h3>Имя пользователя: ${user.surname} ${user.name}
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Выйти"/>
    </form>
</h3>
    <#if user.isAdmin()>
        <a href="/admin">Панель администратора</a>
    </#if>
    <#else>
    <a href="/login">Войти</a></h1>
</#if>
<hr>
<#if user.email??>
    <h3> Добавить оценку</h3>
    <form action="/mark/create" method="post">
        Ученик: <input type="text" name="student"/><br><br>
        Оценка: <input type="text" name="value"/><br><br>
        Оценка: <input type="text" name="data"/><br><br>
        <input type="hidden" name="_csrf" value=${_csrf.token}>
        <input type="submit" value="Добавить"/>
    </form>
    <hr>
<h3>Оценки</h3>
<form action="/" method="get">
    Поиск по имени ученика: <input type="text" name="student"><br>
    <input type="submit" value="Поиск">
</form>
<table border="1">
        <tr>
            <th>Ученик</th>
            <th>Предмет</th>
            <th>Оценка</th>
            <th>Дата</th>
            <th>Учитель</th>
            <th>Удалить</th>
        </tr>
        <#list marks as mark>
            <tr>
                <th>${mark.student}</th>
                <th>${mark.user.subject}</th>
                <th>${mark.value}</th>
                <th>${mark.data}</th>
                <th>${mark.user.surname} ${mark.user.name}</th>
                <th><form action="/mark/delete/${mark.id}" method="post">
                        <input type="submit" value="Удалить"/>
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                    </form>
                </th>
            </tr>
        </#list>
    </table>
</#if>
</body>
</html>