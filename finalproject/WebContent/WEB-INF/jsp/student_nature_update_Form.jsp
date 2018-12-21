<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div id="content">
	<form method="post" action="natureModify" id="natureModify">
		<fieldset>
			<legend>학생 성향 및 분야 입력 폼</legend>
			<div>
			<p>
				<label>1) 자기 성향</label>
			</p>
			<p>
			<input type="text" name="sn_my" id="sn_my" value="${snvo.sn_my}">
			</p>
			</div>
			<div>
			<p>
				<label>2) 상대방 매칭 성향</label>
			</p>
			<p>
				<input type="text" name="sn_you" id="sn_you" value="${snvo.sn_you}">
			</p>
			</div>
			<div>
			<p>
				<label>3) 학습 서비스 분야</label>
			</p>
			<p>
				<input type="text" name="sn_category" id="sn_category" value="${snvo.sn_category}">
			</p>
			</div>
			<p>
			<input type="submit" value="성향수정">
			</p>
		</fieldset>
	</form>
	<form method="post" action="natureDelete">
		<p>
			<input type="submit" id="delete" value="성향삭제">
		</p>
	</form>
</div>