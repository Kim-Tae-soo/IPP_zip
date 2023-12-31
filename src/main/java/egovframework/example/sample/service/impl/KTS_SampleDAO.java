/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.example.sample.service.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;

import org.springframework.stereotype.Repository;
import egovframework.example.sample.service.KTS_SampleDefaultVO;
import egovframework.example.sample.service.KTS_SampleVO;

/**
 * @Class Name : SampleDAO.java
 * @Description : Sample DAO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Repository("sampleDAO")
public class KTS_SampleDAO extends EgovAbstractDAO {

	/**
	 * 글을 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	public String insertSample(KTS_SampleVO vo) throws Exception {
		return (String) insert("sampleDAO.insertSample", vo);
	}

	/**
	 * 글을 수정한다.
	 * @param vo - 수정할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	public void updateSample(KTS_SampleVO vo) throws Exception {
		update("sampleDAO.updateSample", vo);
	}

	/**
	 * 글을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	public void deleteSample(KTS_SampleVO vo) throws Exception {
		delete("sampleDAO.deleteSample", vo);
	}

	/**
	 * 글을 조회한다.
	 * @param vo - 조회할 정보가 담긴 SampleVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	public KTS_SampleVO selectSample(KTS_SampleVO vo) throws Exception {
		return (KTS_SampleVO) select("sampleDAO.selectSample", vo);
	}

	/**
	 * 글 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<?> selectSampleList(KTS_SampleDefaultVO searchVO) throws Exception {
		return list("sampleDAO.selectSampleList", searchVO);
	}

	/**
	 * 글 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return 글 총 갯수
	 * @exception
	 */
	public int selectSampleListTotCnt(KTS_SampleDefaultVO searchVO) {
		return (Integer) select("sampleDAO.selectSampleListTotCnt", searchVO);
	}
	
	/**
	 * 회원가입
	 * **/
	public class MemberDAO {
	    private static final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver"; // 오라클 JDBC 드라이버
	    private static final String DB_URL = "jdbc:oracle:thin:@192.168.50.68:1521:orcl"; // 데이터베이스 URL
	    private static final String DB_USER = "system"; // 데이터베이스 사용자명
	    private static final String DB_PASSWORD = "120898"; // 데이터베이스 비밀번호

	    // JDBC 관련 객체
	    private Connection conn = null;
	    private PreparedStatement pstmt = null;
	    private ResultSet rs = null;

	    public MemberDAO() {
	        try {
	            // JDBC 드라이버 로딩
	            Class.forName(JDBC_DRIVER);

	            // 데이터베이스 연결
	            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    // 사용자명(Username) 중복 체크
	    public boolean isUsernameDuplicate(String username) {
	        String sql = "SELECT COUNT(*) FROM members WHERE USERNAME = ?";

	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, username);
	            rs = pstmt.executeQuery();

	            if (rs.next()) {
	                int count = rs.getInt(1);
	                return count > 0;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            closeResources();
	        }

	        return false;
	    }

	    // 자원 해제
	    private void closeResources() {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}

}
