package egovframework.example.sample.service;

import java.util.List;

public interface DeptService {
	
	public String InsertDept(DeptVO vo) throws Exception; // 부서등록
	public List<?> SelectDeptList(DeptVO vo) throws Exception; //부서조회
	public DeptVO selectDeptDetail(int deptno) throws Exception; //부서상세조회
	public int deleteDept(int deptno) throws Exception; // 부서삭제
	public int updateDept(DeptVO vo) throws Exception; //부서수정
}
