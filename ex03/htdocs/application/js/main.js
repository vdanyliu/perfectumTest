window.onload = pageController;

function pageController() {
	let page = 0;
	let count = 5;
	let comments = document.getElementById('comments');
	initComments();

	let nextBottom = document.getElementById("next");
	let preBottom = document.getElementById("pre");
	let submitBottom = document.getElementById('submit');
	nextBottom.addEventListener("click", function () {
		page += 1;
		initComments();
	});

	preBottom.addEventListener("click", function () {
		if (page !== 0) {
			page -= 1;
			initComments();
		}
	});

	submitBottom.addEventListener("click", function () {
		let login = document.getElementById('u_login');
		let email = document.getElementById('u_mail');
		let text = document.getElementById('u_text');
		console.log(login);
		 if (!email.value || !text.value) {
			 alert("поля Мейл и Текст должны быть заполнены");
			 return 0;
		 }
		 if (!validateEmail(email.value)) {
		 	alert("mail must be 'example@exampl.examle'");
		 	return 0;
		 }
		let data = new FormData();
		data.append('addNewComment', 1);
		data.append('login', login.value);
		data.append('email',email.value);
		data.append('text', text.value);
		let xhr = new XMLHttpRequest();
		xhr.open('POST', 'index.php/js');
		xhr.onload = function () {
			initComments();
		};
		xhr.send(data);

		function validateEmail(email) {
			let re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
			return re.test(String(email).toLowerCase());
		}
	});

	function initComments() {
		let data = new FormData();
		data.append('getCommentsByPage', 1);
		data.append('page', page);
		data.append('postCount', count);
		let xhr = new XMLHttpRequest();
		xhr.open('POST', 'index.php/js');
		xhr.onload = function () {
			let json = JSON.parse(this.response);
			if (json.htmlText) {
				comments.innerHTML = json.htmlText;
				if (comments.innerHTML) {
					nextBottom.hidden = false;
					preBottom.hidden = false;
				}
			}
			else {
				page = page > 0 ? page - 1 : 0 ;
			}
		};
		xhr.send(data);
	}
}