package kr.or.ddit.zip.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import kr.or.ddit.member.vo.ZipVO;

public class ZipDaoImpl implements IZipDao {
	private SqlMapClient client;
	private static IZipDao dao;
	
	private ZipDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IZipDao getInstance() {
		if(dao == null) dao = new ZipDaoImpl();
		return dao;
	}

	@Override
	public List<String> selectSido() {
		List<String> list = null;
		try {
			list = client.queryForList("zip.selectSido");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<String> selectGugun(String sido) {
		List<String> list = null;
		try {
			list = client.queryForList("zip.selectGugun", sido);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<String> selectDong(Map<String, String> map) {
		List<String> list = null;
		try {
			list = client.queryForList("zip.selectDong", map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ZipVO> selectAll(Map<String, String> map) {
		List<ZipVO> list = null;
		try {
			list = client.queryForList("zip.selectAll",map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
