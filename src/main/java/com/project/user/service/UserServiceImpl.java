package com.project.user.service;


import java.util.HashMap;
import java.util.Map;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.product.vo.EnrollVO;
import com.project.user.vo.UserVO;

@Service("UserService")
public class UserServiceImpl implements UserService{

	@Autowired
	private SqlSession sqlsession;

	@Override
	public int join(UserVO vo) {
		//return userDAO.join(vo);
		return sqlsession.insert("com.project.user.mapper.join",vo);
	}

	@Override
	public int kakaoJoin(UserVO vo) {
		return sqlsession.insert("com.project.user.mapper.kakaoJoin",vo);
	}

	@Override
	public UserVO checkUserEmailAndPw(String email, String pw) {
		//return userDAO.login(vo);
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("pw", pw);
		System.out.println(map);
		return sqlsession.selectOne("com.project.user.mapper.checkUserEmailAndPw",map);
	}

	@Override
	public UserVO getInfo(String email) {
		//return userDAO.getInfo(email);
		return sqlsession.selectOne("com.project.user.mapper.getInfo",email);
	}


	@Override
	public int update(UserVO vo) {

		return sqlsession.update("com.project.user.mapper.update",vo);
	}

	@Override
	public int idCheck(UserVO vo) {
		//return userDAO.idCheck(vo);
		return sqlsession.selectOne("com.project.user.mapper.idCheck",vo);
	}

	@Override
	public int pwCheck(UserVO vo) {
		return sqlsession.selectOne("com.project.user.mapper.pwCheck",vo);
	}

	@Override
	public int delete(String email) {

		return sqlsession.delete("com.project.user.mapper.delete", email);
	}

	@Override
	public int permissionChange(int pno) {
		return sqlsession.update("com.project.user.mapper.permissionChange", pno);
	}

	@Override
	public int emailCheck(String email) {
		return sqlsession.selectOne("com.project.user.mapper.emailCheck",email);
	}

	@Override
	public int updatePw(UserVO vo) {
		return sqlsession.update("com.project.user.mapper.updatePw", vo);
	}

	@Override
	public int getEnrollment(EnrollVO enrollVO) {
		return sqlsession.selectOne("com.project.user.mapper.getEnrollment",enrollVO);
	}


	//	@Override
	//	public void approvalUser(UserVO vo) {
	////		response.setContentType("text/html;charset=utf-8");
	////		PrintWriter out = response.getWriter();
	//		if (userDAO.approvalUser(vo)== 0) { // 이메일 인증에 실패하였을 경우
	////			out.println("<script>");
	////			out.println("alert('잘못된 접근입니다.');");
	////			out.println("history.go(-1);");
	////			out.println("</script>");
	////			out.close();
	//			System.out.println("실패");
	//		} else { // 이메일 인증을 성공하였을 경우
	////			out.println("<script>");
	////			out.println("alert('인증이 완료되었습니다. 로그인 후 이용하세요.');");
	////			out.println("location.href='../index.jsp';");
	////			out.println("</script>");
	////			out.close();
	//			userDAO.approvalUser(vo);
	//			System.out.println("성공");
	//		}
	//		
	//	}



	//	@Override
	//	public String createKey() {
	//		String key = "";
	//		Random rd = new Random();
	//
	//		for (int i = 0; i < 8; i++) {
	//			key += rd.nextInt(10);
	//		}
	//		return key;
	//	}

}









