<?php

class Js_model extends CI_Model {

	public function __construct()
	{
		parent::__construct();
		$this->load->database();
	}

	function sanitizee(&$str) {
		$str = trim($str);
		$str = htmlspecialchars($str);
		$str = preg_replace("/=/", "=\"\"", $str);
		$str = preg_replace("/&quot;/", "&quot;\"", $str);
		$tags = "/&lt;(\/|)(\w*)(\ |)(\w*)([\\\=]*)(?|(\")\"&quot;\"|)(?|(.*)?&quot;(\")|)([\ ]?)(\/|)&gt;/i";
		$replacement = "<$1$2$3$4$5$6$7$8$9$10>";
		$str = preg_replace($tags, $replacement, $str);
		$str = preg_replace("/=\"\"/", "=", $str);
	}

	private function getCommentsFromSql($page, $count) {
		$arr = array(
			$count * 1,
			$page * $count,
		);
		$sql = $this->db->query("SELECT * FROM comments ORDER BY create_date DESC LIMIT ? OFFSET ?", $arr);
		return $sql;
	}

	public function getCommentsByPage() {
		$page = $_POST['page'];
		$count = $_POST['postCount'];
		$commentsArr = $this->getCommentsFromSql($page, $count);
		ob_start();
		if ($commentsArr->result()) {
			foreach ($commentsArr->result() as $value) {
				echo "
				<div class='comment'>
					<div class='user'>
						".$value->nickname.$value->create_date."
					</div>
					<div class='userComment'>
						".$value->text_body."
					</div>
				</div>
				<hr>
			";
			}
			echo '<br>';
		}
		$htmlText = ob_get_clean();
		$json = array(
			'htmlText' => $htmlText
		);
		echo json_encode( $json );
	}

	private function getLoginFromEmail($email) {
		$newLogin = current(explode('@', $email));
		return $newLogin;
	}

	public function addNewComment() {
		foreach ($_POST as $value)
			$this->sanitizee($value);
		$login = $_POST['login'];
		$email = $_POST['email'];
		$text = $_POST['text'];
		if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
			return 0;
		}
		if (!$login)
			$login = $this->getLoginFromEmail($email);
		$arr = array($login, $email, $text);
		$result = $this->db->query('INSERT INTO comments ( nickname, email, text_body) VALUES (?, ?, ?)', $arr);
		var_dump($result);
		return 0;
	}
}