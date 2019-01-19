package annomapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import dto.ClassVO;

@Mapper
public interface AdminMapper {
	
	@Select("select c_num, c_title, c_name, \r\n" + 
			"to_char(c_date1,'yyyy-mm-dd') c_date1, \r\n" + 
			"to_char(c_date2,'yyyy-mm-dd') c_date2, c_pnum, \r\n" + 
			"c_loc1, c_loc2, c_img, c_comment, c_category, c_price, c_count, c_point from class")
	public List<ClassVO> getClassList();

}
