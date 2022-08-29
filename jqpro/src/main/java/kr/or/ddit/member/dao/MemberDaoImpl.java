package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

// mapper접근 - SqlMapClient
// dao클래스 객체 생성 - 리턴 - service에서 사용한다

public class MemberDaoImpl implements IMemberDao{
	private SqlMapClient client;
	private static IMemberDao dao;
	
	private MemberDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IMemberDao getInstance() {
		if(dao == null) dao = new MemberDaoImpl();
		
		return dao;
	}
	
	@Override
	public List<MemberVO> selectAll(){
		
		List<MemberVO> queryForList = null;
		try {
			queryForList = client.queryForList("member.selectAll");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return queryForList;
	}

	@Override
	public String idCheck(String id) {
		String idvalue = null;
		try {
			idvalue = (String) client.queryForObject("member.idCheck",id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return idvalue;
	}

	@Override
	public List<ZipVO> zipList(String zip) {
		List<ZipVO> list = null;
		try {
			list = client.queryForList("zip.zipList", zip);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public String insertMember(MemberVO memberVo) {
		String mem_id = null;
		try {
			mem_id = (String) client.insert("member.insertMember", memberVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mem_id;
	}
	
}
