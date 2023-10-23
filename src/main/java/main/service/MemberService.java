package main.service;

import java.util.List;

public interface MemberService {
	/*
	 * 회원등록 처리 (MemberSave Service) 
	 */
	public String insertMember(MemberVO vo) throws Exception;
	
	public int selectMemberIdCheck(String userid) throws Exception;
	
	public List<?> selectPostList(String dong) throws Exception;
	
}
