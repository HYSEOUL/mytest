package kr.or.kosta.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.PushAlarmLoggerDTO;

@Repository
public class PushAlarmDao implements PushAlarmInter {

	@Autowired
	private SqlSessionTemplate ss;
	
	@Override
	public void addPushAlarmLogging(PushAlarmLoggerDTO vo) {
		ss.insert("pushalarm.logger_in", vo);
	}

}
