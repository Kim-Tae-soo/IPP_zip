package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.CodeService;
import egovframework.example.sample.service.CodeVO;

@Controller
public class CodeController {
	
	/*리소스 처리*/
	@Resource(name="codeService")
	private CodeService codeService;
	
	/*코드관리 작성화면*/
	@RequestMapping(value="/codeWrite.do")
	public String codeWrite() {
		return "code/codeWrite";
	}
	
	/*코드 저장*/
	@RequestMapping(value="/codeWriteSave.do")
	public String insertCode(CodeVO vo) throws Exception {
		
		//null 값으로 return 
		String result = codeService.insertCodes(vo);
		
		
		if (result == null) {
			System.out.println("저장 성공");
		} else {
			System.out.println("저장 실패");
		}
		//UPDATE , DELETE -->0
		return "redirect:codeList.do";
	}
	
	/*코드 리스트*/
	@RequestMapping(value="/codeList.do")
	public String selectCodeList(CodeVO vo, ModelMap model) throws Exception {
		
		int total = codeService.selectCodesCount(vo);
		
		List<?> list = codeService.selectCodeList(vo);
		System.out.println("list =====>" + list);
		
		model.addAttribute("resultTotal",total);
		model.addAttribute("resultList",list);
		
		return "code/codeList";
	}
	
	/*코드 삭제*/
	@RequestMapping(value="/codeDelete.do")
	public String deleteCode(int code) throws Exception {
		
		int result = codeService.deleteCodes(code);
		
		return "redirect:codeList.do";
	}
	
	/*코드 수정 화면*/
	@RequestMapping(value="/codeModifyWrite.do")
	public String selectCodesDetail(int code, ModelMap model) throws Exception{
		
		CodeVO vo = codeService.selectCodesDetail(code);
		model.addAttribute("vo",vo);
		
		return "code/codeModifyWrite";
	}
	
	/*수정된 코드게시판 업데이트*/
	@RequestMapping(value="/codeModifySave.do")
	public String updateCodes(CodeVO vo) throws Exception{
		
		int result = codeService.updateCodes(vo);
		
		return "redirect:codeList.do";
	}
}
