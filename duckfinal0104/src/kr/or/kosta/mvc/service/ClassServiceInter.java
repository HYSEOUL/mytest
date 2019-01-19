package kr.or.kosta.mvc.service;

public interface ClassServiceInter {

	public void deleteClass(int num) throws Exception; 	// 강의 삭제 시 댓글도 함께 사라지는 추상 메서드
}
