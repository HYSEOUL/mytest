/**
 * 
 */
function goUrl(url) {
	console.log("Param : " + list);
	location = list;
}

// 수정, 삭제에 사용될 함수
// my.kosta188?cmd=XX&num=??
function goConfirmUrl(url, num) {
	// yes가 선택하면 동작
	if (confirm("삭제 ?")) {
		console.log("Param : " + list);
		location = url + "&num=" + num;
	}
}