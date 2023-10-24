package main.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.BoardService;
import main.service.BoardVO;

@Controller
public class BoardController {
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@RequestMapping("/boardWrite.do")
	public String boardWrite() {
		
		return "board/boardWrite";
	}
	
	@RequestMapping("/boardWriteSave.do")
	@ResponseBody
	public String insertNBoard(BoardVO vo) throws Exception {
		
		String result = boardService.insertNBoard(vo);
		String msg = "";
		if(result == null) msg ="ok";
		else msg = "fail";
		
		return msg;
		
	}
	
	@RequestMapping("/boardList.do")
	public String selectNBoardList(BoardVO vo, ModelMap model) throws Exception {
		
		int unit = 10;
		
		//총 게시글 수
		int total = boardService.selectNboardTotal(vo);
		
		int totalPage = (int) Math.ceil((double)total/unit);
		
		// startIndex : (1-1) * 10 + 1 -> 1
		// startIndex : (2-1) * 10 + 1 -> 11
		
		int viewPage = vo.getViewPage();
		
		if(viewPage > totalPage || viewPage < 1) {
			viewPage = 1;
		}
		
		int startIndex = (viewPage-1) * unit + 1;
		int endIndex = startIndex + (unit-1);
		
		/*
		 * int p1 = total - 0; 
		 * int p2 = total -10; 
		 * int p3 = total -20; 
		 * int p4 = total
		 * -30;
		 */
		
		int startRowNo = total - (viewPage-1)* unit;
		
		vo.setStartIndex(startIndex);
		vo.setEndIndex(endIndex);
		
		
		List<?> list = boardService.selectNBoardList(vo);
		System.out.println("list : " + list);
		
		model.addAttribute("rowNumber",startRowNo);
		model.addAttribute("total",total);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("resultList", list);
		return "board/boardList";
	}
	
	@RequestMapping("/boardDetail.do")
	public String selectNBoardDetail(BoardVO vo, ModelMap model) throws Exception{
		
		
		/*
		 * 조회수
		 * */
		boardService.updateNBoardHist(vo.getUnq());
		
		/*
		 * 상세보기
		 * */
		BoardVO boardVO = boardService.selectNBoardDetail(vo.getUnq());
		
		String content = boardVO.getContent();
		boardVO.setContent( content.replace("\n", "<br>")); 
		
		model.addAttribute("boardVO",boardVO);
		
		return "board/boardDetail";
	}
	
	@RequestMapping("/boardModifyWrite.do")
	public String selectNBoardModifyWrite(BoardVO vo, ModelMap model) throws Exception{
		
		BoardVO boardVO = boardService.selectNBoardDetail(vo.getUnq());
		model.addAttribute("boardVO",boardVO);
		
		return "board/boardModifyWrite";
	}
	
	@RequestMapping("/boardModifySave.do")
	@ResponseBody
	public String updateNBoard(BoardVO vo) throws Exception{		
		
		int result = 0;	
		
		int count = boardService.selectNBoardPass(vo); // 패스워드 성공시 -1  실패시 - error
		if (count == 1 ) {
			result = boardService.updateNBoard(vo); // 패스워드 성공시 -1  실패시 - error
		} else {
			result = -1;
		}
		return result+"";
	}
	@RequestMapping("/passWrite.do")
	public String passWrite(int unq, ModelMap model) {
		
		model.addAttribute("unq",unq);
		return "board/passWrite";
	}
	@RequestMapping("/boardDelete.do")
	@ResponseBody
	public String deleteBoard(BoardVO vo) throws Exception{
	
		int result = 0;
		
		/*
		 *암호 일치 검사 
		 */
		
		int count = boardService.selectNBoardPass(vo);
		
		if (count == 1) {
		 result = boardService.deleteNBoard(vo);
		} else if (count == 0){
			result = -1;
		}
		return result+"";
	}
	
}
