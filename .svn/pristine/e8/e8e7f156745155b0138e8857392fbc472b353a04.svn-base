package egovframework.example.sample.service.impl;


import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.DeptVO;

@Repository("deptDAO")
public class DeptDAO  extends EgovAbstractDAO {

	public String InsertDept(DeptVO vo) {
		return (String) insert("deptDAO.InsertDept",vo);
	}

	public List<?> SelectDeptList(DeptVO vo) {
		return list("deptDAO.SelectDeptList",vo);
	}

	public DeptVO selectDeptDetail(int deptno) {
		return (DeptVO) select("deptDAO.selectDetail",deptno);
	}

	public int deleteDept(int deptno) {
		return (int) delete("deptDAO.deleteDept",deptno);
	}

	public int updateDept(DeptVO vo) {
		return update("deptDAO.updateDept",vo);
	}

}
