-- Создание базы таблиц и связей

CREATE DATABASE chatbase;
CREATE TABLE `chatbase`.`tbl_user` (`id` INT(11) NOT NULL AUTO_INCREMENT , `login` VARCHAR(255) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;
CREATE TABLE `chatbase`.`tbl_dialog` ( `dialog_id` INT(11) NOT NULL AUTO_INCREMENT , `user_id_one` INT(11) NOT NULL , `user_id_two` INT(11) NOT NULL , `dialog_create` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP , `dialog_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP , PRIMARY KEY (`dialog_id`)) ENGINE = InnoDB;
CREATE TABLE `chatbase`.`tbl_message` ( `chat_messages_id` INT(11) NOT NULL AUTO_INCREMENT , `fk_dialog_id` INT(11) NOT NULL , `fk_sender_id` INT(11) NOT NULL , `text_body` TEXT NOT NULL , `massage_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP , PRIMARY KEY (`chat_messages_id`)) ENGINE = InnoDB;
use chatbase;
ALTER TABLE `tbl_user` ADD INDEX( `id`);
ALTER TABLE `tbl_dialog` ADD INDEX( `dialog_id`);
ALTER TABLE `tbl_dialog` ADD FOREIGN KEY (`user_id_one`) REFERENCES `tbl_user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_dialog` ADD FOREIGN KEY (`user_id_two`) REFERENCES `tbl_user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_message` ADD FOREIGN KEY (`fk_dialog_id`) REFERENCES `tbl_dialog`(`dialog_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_message` ADD FOREIGN KEY (`fk_sender_id`) REFERENCES `tbl_user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;


--  Добавляем юзеров

INSERT INTO `tbl_user` (`id`, `login`) VALUES (NULL, 'vasya'), (NULL, 'petya'), (NULL, 'masha');


-- Создаем диалоги

INSERT INTO `tbl_dialog` (`dialog_id`, `user_id_one`, `user_id_two`) VALUES (NULL, '1', '2'), (NULL, '1', '3');


-- Создаем сообщения

INSERT INTO `tbl_message` (`chat_messages_id`, `fk_dialog_id`, `fk_sender_id`, `text_body`) VALUES (NULL, '1', '1', 'qq1'), (NULL, '1', '2', 'qq2'), (NULL, '1', '1', 'qq3'), (NULL, '2', '1', 'qq4'), (NULL, '2', '3', 'qq5'), (NULL, '2', '3', 'qq6'), (NULL, '1', '2', 'qq7'), (NULL, '1', '1', 'qq10'), (NULL, '2', '1', 'qq1'), (NULL, '1', '1', 'qq22')


-- запрос при отправке сообщения от Человека 1 Человеку 2 (от человека id 1 в чат fk_dialog_id)

INSERT INTO `tbl_message` (`chat_messages_id`, `fk_dialog_id`, `fk_sender_id`, `text_body`) VALUES (NULL, '1', '1', 'qq');
UPDATE tbl_dialog SET dialog_update = CURRENT_TIMESTAMP WHERE dialog_id = 1


-- запрос на получение истории переписки между Ч1 и Ч2 (id = 1, id = 2)

SELECT tbl_user.login, tbl_message.text_body, tbl_message.massage_date
FROM tbl_dialog
JOIN tbl_message ON tbl_dialog.dialog_id = tbl_message.fk_dialog_id
JOIN tbl_user ON tbl_message.fk_sender_id = tbl_user.id
WHERE user_id_one = 1 AND user_id_two = 2 OR user_id_one = 2 AND user_id_two = 1
ORDER BY tbl_message.massage_date DESC;

-- запрос на получение списка всех диалогов, в которых участвует Ч1, с сортировкой по последнему полученному сообщению (аналог как список чатов в любом мессенджере) и с отображением участников диалога
-- p.s. На этом моменте я понял, что стоило бы создавать бд учитывая что чаты могут быть групповыми
SELECT tbl_user.login, tbl_dialog.dialog_id, tbl_dialog.user_id_one, tbl_dialog.user_id_two
FROM tbl_dialog
JOIN tbl_user ON tbl_dialog.user_id_one = tbl_user.id
WHERE user_id_one = 1 OR user_id_two = 1
ORDER BY tbl_dialog.dialog_update DESC

-- запрос на удаление одного сообщения в истории переписки (id сообщения 9 )

DELETE FROM `tbl_message` WHERE `tbl_message`.`chat_messages_id` = 9

-- запрос на удаление всей истории переписки с пользователем

DELETE FROM `tbl_dialog` WHERE `tbl_dialog`.`dialog_id` = 2

-- от себя
-- запрос на удаление пользователя
DELETE FROM `tbl_user` WHERE `tbl_user`.`id` = 2

