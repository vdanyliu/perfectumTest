<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Comments</title>

	<style type="text/css">
	p.footer {
		text-align: right;
		font-size: 11px;
		border-top: 1px solid #D0D0D0;
		line-height: 32px;
		padding: 0 10px 0 10px;
		margin: 20px 0 0 0;
	}
	</style>
</head>
<body>

<div class="comment-form">
	<p>Введите ваш коментаирий</p>
	<input id="u_login" type="text" placeholder="ФИО/никнейм">
	<input id="u_mail" type="email" placeholder="Емайл"><br>
	<input id="u_text" type="text" placeholder="Текст комментария"><br>
	<button id="submit">Отправить</button>
</div>
<hr>

<div class="comments-div">
	<div id="comments" class="comments">

	</div>
	<div class="pagination">
		<button id="pre" hidden>Pre</button>
		<button id="next" hidden>Next</button>
	</div>
</div>



<p class="footer">Page rendered in <strong>{elapsed_time}</strong> seconds. <?php echo  (ENVIRONMENT === 'development') ?  'CodeIgniter Version <strong>' . CI_VERSION . '</strong>' : '' ?></p>
</body>
</html>
<script src="/application/js/main.js"></script>