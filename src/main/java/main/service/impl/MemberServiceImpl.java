package main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.service.MemberService;
import main.service.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	/* MemberDAO aa = new MemberDAO(); */
	
	@Resource(name="memberDAO")
	public MemberDAO memberDAO;
	
	@Override // 다향성(오버라이딩, 오버로딩)
	/*
	 * 오버로딩 : 같은 클래스 내부에서 같은 이름으로 메소드를 만드는 방법
	 * 오버라이딩 :  상속관계에서 부모클래스를 재구성하는 방법
	 */
	public String insertMember(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.insertMember(vo);
	}

	@Override
	public int selectMemberIdCheck(String userid) throws Exception {
		return memberDAO.selectMemberIdCheck(userid);
	}

	@Override
	public List<?> selectPostList(String dong) throws Exception {
		return memberDAO.selectPostList(dong);
	}

	@Override
	public int selectMemberCount(MemberVO vo) throws Exception {
		return memberDAO.selectMemberCount(vo);
	}

}
