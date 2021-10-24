<?php
if(!isset($_SESSION['login']))
{
    $hidden = true;
}



?>

<form action="index.php?page=1" method="post">
        <header>
            <h1>Добро пожаловать!</h1>
        </header>
        <section>
           <input type="textarea" name="message">
        </section> 
        <footer>
            <a href="index.php?page=2">
                Авторизоваться
            </a>
            <button type="submit" name="send" <?=($hidden == true) ? 'disabled' : ''?>>
                Отправить
            </button>
            <button type="reset">
                Отмена
            </button>
        </footer>
    </form>
<?
    $query = "SELECT DISTINCT date, CONCAT(`user`.`name`, `user`.`surname`) as fio, message 
FROM `user` 
JOIN `usermessage` ON `user`.`id` = `usermessage`.`id_user` 
JOIN `messages` ON `messages`.`id` = `usermessage`.`id_message`";
$result = mysqli_query($connection, $query);
echo "<table>
<tr>
            <th>Дата</th>
            <th>Пользователь</th>
            <th>Сообщение</th>
        </tr>";
while($row = mysqli_fetch_assoc($result))
{
    echo "<tr>";
    echo "<td>".$row['date']."</td>";
    echo "<td>".$row['fio']."</td>";
    echo "<td>".$row['message']."</td>";
    echo "</tr>";
}
echo "</table>";
?>

