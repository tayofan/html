package kr.or.ddit.zip.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.member.vo.ZipVO;

public interface IZipDao {
	public List<String> selectSido();
	public List<String> selectGugun(String sido);
	public List<String> selectDong(Map<String, String>map);
	public List<ZipVO> selectAll(Map<String, String>map);
}
