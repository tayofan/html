package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

//dao에 접근 - dao객체가 필요
//service객체생성 리턴 - controller가 사용

public class MemberServiceImpl implements IMemberService {
	private IMemberDao dao;
	private static IMemberService service;
	
	private MemberServiceImpl() {
		dao = MemberDaoImpl.getInstance();
	}
	
	public static IMemberService getInstance() {
		if(service == null) service = new MemberServiceImpl();
		return service;
	}
	
	@Override
	public List<MemberVO> selectAll() {
		return dao.selectAll();
	}

	@Override
	public String idCheck(String id) {
		return dao.idCheck(id);
	}

	@Override
	public List<ZipVO> zipList(String zip) {
		return dao.zipList(zip);
	}

	@Override
	public String insertMember(MemberVO memberVo) {
		return dao.insertMember(memberVo);
	}

}
