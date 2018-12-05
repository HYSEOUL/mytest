<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div id="content">
	<form method="post" action="usermemberjoin" id="memF">
		<fieldset>
			<legend>회원가입 폼</legend>
			<p><label>아이디</label>
			<input type="text" name="id" id="id">
			&nbsp;
			<input type="button" id="idChkBtn" value="중복확인">
			</p>
			<p id="target"></p>
			<p>
			<label>비밀번호</label>
			<input type="password" name="pwd" id="pwd">
			</p>
			<p>
			<label>이름</label>
			<input type="text" name="name" id="name">
			</p>
			<p>
			<label>생년월일(6자리)</label>
			<input type="text" name="birth" id="birth">
			</p>
			<p>
			<label>성별</label>
			<input type="text" name="gender" id="gender">
			</p>
			<p>
			<label>이메일</label>
			<input type="text" name="email" id="email">
			</p>
			<p>
			<label>전화번호</label>
			<input type="text" name="phone" id="phone">
			</p>
			<p>
			<label>우편번호</label>
			<input type="text" name="post" id="post">
			<input type="button" id="postBtn"
			value="우편번호 찾기" >
			</p>
			<p>
			<label>주소</label>
			<input type="text" id="addr1" name="addr1">
			</p>
			<p>
			<label>상세 주소</label>
			<input type="text" id="addr2" name="addr2">
			</p>
			<p>
			<input type="submit" value="회원가입">
			</p>
		</fieldset>
	</form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	$(function(){
		$('#postBtn').click(function(){
			 execDaumPostcode();
		});
		// 회원 아이디 중복확인!
		$('#idChkBtn').click(function(){
			$.ajax({
				url:"idcheck?id="+$('#id').val(),
				success:function(data){
					if(data == 0){
						$('#target').show().css("color","blue").text("사용가능");
					}else{
						$('#target').show().css("color","red").text("사용중");
					}
					
				}		
				
			});
		});
		
		
		function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('post').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addr2').focus();
            }
        }).open();
    }
	});
   
</script>