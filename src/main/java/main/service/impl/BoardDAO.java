package main.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import main.service.BoardVO;

@Repository("boardDAO")
public class BoardDAO extends EgovAbstractDAO{

	public String insertNBoard(BoardVO vo) {
		return (String) insert("boardDAO.insertNBoard",vo);
	}

	public List<?> selectNBoardList(BoardVO vo) {
		return list("boardDAO.selectNBoardList",vo);
	}

	public int selectNboardTotal(BoardVO vo) {
		return (int) select("boardDAO.selectNBoardTotal",vo);
	}

	public BoardVO selectNBoardDetail(int unq) {
		return (BoardVO) select("boarDAO.selectNBoardDetail",unq);
	}

	public int updateNBoardHist(int unq) {
		return update("boarDAO.updateNBoardHist",unq);
	}

	public int updateNBoard(BoardVO vo) {
		return update("boardDAO.updateNBoard",vo);
	}

	public int selectNBoardPass(BoardVO vo) {
		return (int) select("boardDAO.selectNBoardPass",vo);
	}

	public int deleteNBoard(BoardVO vo) {
		return delete("BoardDAO.deleteNBoard",vo);
	}
	
}
