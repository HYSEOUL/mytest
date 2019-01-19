/**
 * resources/js/
 * 
 */
// 전역변수 xhr을 선언
var xhr = null;
function getXmlHttpRequest() {
	if (window.XMLHttpRequest) {
		xhr = new XMLHttpRequest();
		console.log("modern browsers XHR:");
	} else {
		xhr = new ActiveXObject("Microsoft.XMLHTTP");
		console.log("old IE XHR:");
	}
}
function sendRequest(url, param, callback, method) {
	getXmlHttpRequest();
	// method의 값이 GET,POST로 넘오 올때
	// 소문자로 변경해서 조건에 따른 분류
	method = (method.toLowerCase() === 'get') ? 'GET' : 'POST';
	param = (param === null || param === '') ? null : param;
	// get방식일 때 url과 param을 조합
	if (method === 'GET' && param !== null) {
		url = url + "?" + param;
	}
	// 콜백함수를 지정
	xhr.onreadystatechange = callback;
	// true : 비동기식
	xhr.open(method, url, true);
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xhr.send(method === 'POST' ? param : null);
}
