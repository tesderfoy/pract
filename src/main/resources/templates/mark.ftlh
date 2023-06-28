<!DOCTYPE html>
<html>
<head>
    <title>Журнал</title>
</head>
<body>
<h1>Электронный журнал</h1><hr>
<#if user.email??>
<h3>Имя пользователя: ${user.email} </h3>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Выйти"/>

<#else>
    <a href="/login">Войти</a></h1><hr>
</#if>


</form>
<h1>Оценки</h1>
<form action="/" method="get">
    Поиск по имени учителя: <input type="text" name="title"><br>
    <input type="submit" value="Поиск">
</form>

<#list marks as mark>

<div>
    <p> Предмет ${mark.subject}
        Ученик: ${mark.student}
        Учитель: ${mark.teacher}
        Оценка: ${mark.value} | <a href="/mark/${mark.id}">Подробне...</a> </p>
</div>
</#list>
<#if user.email??>
<h3> Добавить оценку</h3>
<form action="/mark/create" method="post">
    Предмет: <input type="text" name="subject"/><br><br>
    Ученик: <input type="text" name="student"/><br><br>
    Учитель: <input type="text" name="teacher"/><br><br>
    Оценка: <input type="text" name="value"/><br><br>
    <input type="hidden" name="_csrf" value=${_csrf.token}>
<input type="submit" value="Добавить"/>
</form>
</#if>
</body>
</html>