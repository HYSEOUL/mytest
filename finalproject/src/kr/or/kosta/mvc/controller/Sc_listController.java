package kr.or.kosta.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dto.Sc_listDTO;
import dto.Sc_listVO;
import kr.or.kosta.mvc.dao.Sc_listDAO;

@Controller
public class Sc_listController {

   @Autowired
   private Sc_listDAO sc_listdao;
   
   @RequestMapping("/sc_list_1")
   public String sc_list_1(Model m, String ms_id) {
      List<Sc_listDTO> scvo = sc_listdao.sc_list_1(ms_id);
      m.addAttribute("scvo", scvo);
      return "sc_list_list";
   }
}