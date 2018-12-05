/**
 * 
 */

function goUrl(url){
	location=url;
}

// 수정, 삭제에 사용될 함수
// my.kosta188?cmd=XX&num=??
function goConfirmUrl(url, num){
	if(confirm("Delete ? ")){
		location = url + "&num=" + num;
	}
}