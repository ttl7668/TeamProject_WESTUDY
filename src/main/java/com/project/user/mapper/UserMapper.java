package com.project.user.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.project.user.vo.UserVO;

@Mapper
public interface UserMapper {
	public int join(UserVO vo);
	public int kakaoJoin(UserVO vo);
	public UserVO checkUserIdAndPw(String email, String pw);
	public UserVO getInfo(String email);
	public int idCheck(UserVO vo);
//	public int pwCheck(UserVO vo);
//	public int delete(UserVO vo);
//	public int updatePw(UserVO vo);
//	public void sendEmail(UserVO vo,String div);
//	public void findPw(UserVO vo,HttpServletResponse response)throws Exception;
}
