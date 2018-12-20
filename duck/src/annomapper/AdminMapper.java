package annomapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import dto.ClassVO;

@Mapper
public interface AdminMapper {
	
	@Select("select * from class where c_num=1")
	public ClassVO getClassList();

}
