<!DOCTYPE html>
<html>
<head>
    <title>Журнал</title>
</head>
<body>
<h4>Подробнее Оценки</h4>
<b>id:</b>${mark.id}<br>
<b>Предмет:</b>${mark.subject}<br>
<b>Ученик:</b>${mark.student}<br>
<b>Учитель:</b>${mark.user.name} ${mark.user.surname}<br><br>
<b>Оценка:</b>${mark.value}<br>

<h3> Добавить оценку</h3>
<form action="/mark/delete/${mark.id}" method="post">
    <input type="submit" value="Удалить"/>
</form>


</body>
</html>