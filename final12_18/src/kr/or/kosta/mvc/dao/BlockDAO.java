package kr.or.kosta.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.BlockVO;

@Repository
public class BlockDAO {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	public void createBlock(BlockVO bvo) {
		ss.insert("block.create",bvo);
	}
	
	public List<BlockVO> selectListBlock(){
		return ss.selectList("block.selectList");
	}
	
	public BlockVO selectOneBlock(int b_num) {
		return ss.selectOne("block.selectOne", b_num);
	}
	
	public void deleteBlock(int b_num) {
		ss.delete("block.delete", b_num);
	}
}
