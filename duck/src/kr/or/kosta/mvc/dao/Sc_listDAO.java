package kr.or.kosta.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Sc_listDTO;


@Repository
public class Sc_listDAO {
   
   @Autowired
   private SqlSessionTemplate ss;
   

   public List<Sc_listDTO> sc_list_1(String ms_id){
      List<Sc_listDTO> list =ss.selectList("sc_listMapper.sc_list_1", ms_id);
      return list;
      
   }

}