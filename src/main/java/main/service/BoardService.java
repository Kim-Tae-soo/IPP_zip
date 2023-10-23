package main.service;

import java.util.List;

public interface BoardService {
	/*
	 * 일반게시판 저장처리
	 */
	public String insertNBoard(BoardVO vo) throws Exception;
	
	/*
	 * 일반게시판 화면목록
	 */
	public List<?> selectNBoardList(BoardVO vo) throws Exception;
	/*
	 * SQL : SELECT COUNT(*) total FROM nboard;
	 * Total 개수 얻기
	 */
	public int selectNboardTotal(BoardVO vo) throws Exception;
	/*
	 * 상세화면 처리
	 */
	public BoardVO selectNBoardDetail(int unq) throws Exception;
	/*
	 * 조회수 증가 관련 서비스
	 */
	public int updateNBoardHist(int unq) throws Exception;
	/*
	 * 수정 처리
	 */
	public int updateNBoard(BoardVO vo) throws Exception;
	/*
	 *암호확인 
	 */
	public int selectNBoardPass(BoardVO vo) throws Exception;
	/*
	 *삭제
	 */
	public int deleteNBoard(BoardVO vo) throws Exception;
	
}
