package kr.or.kosta.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dto.S_mileageVO;
import dto.Sc_listVO;
import dto.Study_listVO;
import kr.or.kosta.mvc.dao.ClassDao;
import kr.or.kosta.mvc.dao.Ms_mileageDAO;
import kr.or.kosta.mvc.dao.Study_listDAO;

@Transactional(rollbackFor=Exception.class,readOnly=true)
@Service
public class BuyPointService {
   
   @Autowired
   private ClassDao cDao;
   
   @Autowired
   private Study_listDAO sDao;
   
   @Autowired
   private Ms_mileageDAO msDao;
   
   // 장바구니에서 강좌구매
   public void classBuyPoint(int sc_num,int sc_buy,int c_price,int my_point,String ms_id) throws Exception{
      System.out.println("클래스 구매 서비스단 입성");
            
      if(my_point >= c_price) {
         S_mileageVO smvo = new S_mileageVO();
         smvo.setMs_id(ms_id);
         smvo.setMath_point(c_price);
         msDao.s_classBuyUpdate(smvo);
         
         Sc_listVO scvo = new Sc_listVO();
         scvo.setSc_num(sc_num);
         scvo.setSc_buy(sc_buy);
         cDao.updateClassList(scvo);
      }else {
         System.out.println("너는 돈이 엇어 안녕~~~~~~~강좌~~~~~~``");
      }      
   }
   
   // 장바구니에서 스터디 구매
   public void studyBuyPoint(int sl_num,int sl_buy,int s_price,int my_point,String ms_id) throws Exception{
      System.out.println("스터디 구매 서비스단 입성");
      
      if(my_point >= s_price) {
         S_mileageVO smvo = new S_mileageVO();
         smvo.setMs_id(ms_id);
         smvo.setMath_point(s_price);
         msDao.s_classBuyUpdate(smvo);
         
         Study_listVO slvo = new Study_listVO();
         slvo.setSl_num(sl_num);
         slvo.setSl_buy(sl_buy);
         sDao.updateStudyList(slvo);
      }else {
         System.out.println("넌 돈이 없어서 스터디를 구매하지 못해");
      }
   }
   
   public void classOnebuyPoint(String ms_id,int my_point,int sc_buy,String c_title,int c_price) {
      System.out.println("상세에서 강좌 규매 서비스단 입성");
      
      if(my_point >= c_price) {
         S_mileageVO smvo = new S_mileageVO();
         smvo.setMs_id(ms_id);
         smvo.setMath_point(c_price);
         msDao.s_classBuyUpdate(smvo);
         
         Sc_listVO scvo = new Sc_listVO();
         scvo.setC_title(c_title);
         scvo.setMs_id(ms_id);
         scvo.setSc_buy(sc_buy);
         cDao.insertClassList(scvo);
      }else {
         System.out.println("넌 돈이 없어서 강좌를 들을수 없어!!!!!!!!!!");
      }
   }

}