package com.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.product.service.ProductService;
import com.project.product.vo.ProductResultVO;
import com.project.util.Email;
import com.project.user.service.UserService;
import com.project.user.vo.UserVO;
import com.project.util.SessionKeyCode;
import com.project.util.UserSha256;

/**
 * 
 * @author 김이슬, 변호찬
 *
 */
@Controller
@RequestMapping("/User")
public class UserController {

	@Autowired
	UserService userService;

	@Autowired
	ProductService productService;


	@Autowired
	JavaMailSender mailSender;

	@RequestMapping("/UserLogin")
	public String UserLogin() {
		return "/User/UserLogin";
	}

	@RequestMapping("CreatorJoin")
	public String CreatorJoin() {
		return "/User/CreatorJoin";
	}

	@RequestMapping("LoginForm")
	public String UserLoginForm(@RequestParam("email") String email,
			@RequestParam("pw") String pw, 
			HttpServletRequest request) {

		//TODO:암호화 구현된거! 지우지마시오!
		
			
		
//		      vo.setPw(UserSha256.encrypt(vo.getPw()));
//		      String inputPw = vo.getPw();
//		      String inputEncryptedPw = UserSha256.encrypt(inputPw);
//		      vo.setPw(inputEncryptedPw);
		            
//		      System.out.println("로그인에서 친 비밀번호 암호화 : " + inputEncryptedPw);

		UserVO userVO = userService.checkUserEmailAndPw(email, pw);

		System.out.println(userVO);

		if(userVO == null) {
			request.setAttribute("msg","로그인실패");
			return "redirect:/User/UserLogin";
		} else {
			userVO.setPw(null);
			HttpSession session = request.getSession();
			session.setAttribute(SessionKeyCode.userKey, userVO);
			session.setAttribute("userVO", userVO);
			System.out.println(session.getAttribute(SessionKeyCode.userKey));
			System.out.println(session.getAttribute("userVO"));

			//         System.out.println("세션값 : " + session.getAttribute("name"));

			return "redirect:/";
		}

	}

	//TODO: 뭔갈 햇음
	@RequestMapping("KakaoLogin")
	public String KakaoLogin(HttpServletRequest request,HttpServletResponse response, Model model) {

		String k_name = request.getParameter("name");
		String k_email = request.getParameter("email");

		System.out.println(k_name);
		System.out.println(k_email);

		//단순히 가입되어 있는지 확인하기 위한 용도의 임시 vo
		UserVO vo = new UserVO();
		vo.setEmail(k_email);
		vo.setName(k_name);

		// 이 이메일로 회원등록이 되어있는지 확인한 뒤
		// 있으면 그냥 냅두고 없다면 회원으로 등록. 
		// insert할때 이메일(기본키), 이름, joinType을 kakao로 설정
		int result = userService.idCheck(vo);
		System.out.println("kakao result : " + result);

		if(result == 0) {
			PrintWriter printwriter;
			try {
				response.setContentType("text/html;charset=UTF-8");
				printwriter = response.getWriter();
				printwriter.write("<script>alert('카카오 유저 회원가입 절차를 진행합니다.');</script>"); 
				printwriter.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
//			request.setAttribute("msg", "카카오 유저 회원가입 절차를 진행합ㄴ다.");
//			response.setContentType("text/html; charset=UTF-8");
			model.addAttribute("k_name",k_name);
			model.addAttribute("k_email",k_email);
			model.addAttribute("joinType","kakao");
			return "/User/UserJoin";
		}

		else {
			HttpSession session = request.getSession();
			UserVO userVO = userService.getInfo(k_email);
			session.setAttribute(SessionKeyCode.userKey, userVO);
			
//			session.setAttribute("k_email", k_email);
//			session.setAttribute("k_name", k_name);
			return "redirect:/";
		}

	}


	@RequestMapping("/Logout")
	public String UserLogout(HttpSession session) {
		session.invalidate(); //TODO: 로그인 정보 세션만 지우세요.
		return "redirect:/";
	}

	@ResponseBody
	@PostMapping("/emailCheck")
	public int UserIdCheck(@RequestBody UserVO vo) {      //오류잇는지 확인
		int result = userService.idCheck(vo);
		System.out.println("중복여부 : " + result);
		return result;
	}

	@RequestMapping("/UserJoin")
	public String UserJoin() {
		return "/User/UserJoin";
	}

	//vo 부분 가독성있게 userVO를 적어주세요
	@RequestMapping("/JoinForm")
	public String UserJoinForm(UserVO vo, RedirectAttributes RA, @RequestParam("joinType") String joinType) {

		//      // 암호 확인
		//      System.out.println("암호화전:" + vo.getPw());
		//      // 비밀번호 암호화 (sha256
		//      String encryPassword = UserSha256.encrypt(vo.getPw());//1.받아온값을 암호화
		//      vo.setPw(encryPassword);//2.저장
		//      System.out.println("암호화후:" + vo.getPw());
		
		if(joinType.equals("")) {
			int result2 = userService.join(vo);//3.저장된 객체 그대로 db로 보냄
			
			if(result2 == 1) {
				RA.addFlashAttribute("msg","회원가입을 축하합니다");
			} else {
				RA.addFlashAttribute("msg","회원가입에 실패했습니다");
			}
		} else {
			int result2 = userService.kakaoJoin(vo);
			
			if(result2 == 1) {
				RA.addFlashAttribute("msg","회원가입을 축하합니다");
			} else {
				RA.addFlashAttribute("msg","회원가입에 실패했습니다");
			}
		}

		//회원가입 메서드
		//      System.out.println("controller");
		//      System.out.println(vo.getEmail());
		//      System.out.println(vo.getAddress1());
		//      System.out.println(vo.getAddress2());
		//      System.out.println("controller");
		//      System.out.println("result2 : " + result2);

		

		return "redirect:/User/UserLogin";
	}


	@RequestMapping("/Mypage")
	public String UserMypage(HttpServletRequest request,Model model) {

		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute(SessionKeyCode.userKey);

		ArrayList<ProductResultVO> myPageProductList = (ArrayList<ProductResultVO>)productService.getMyPageProductList(userVO.getUno());

		System.out.println("내가 신청한 강좌");
		System.out.println(myPageProductList.toString());
		System.out.println("내가 신청한 강좌");
		
		
		
		model.addAttribute("myPageProductList",myPageProductList);

		return "/User/UserMypage";
	}

	@RequestMapping("/UserUpdate")
	public String UserUpdate(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute(SessionKeyCode.userKey);
		System.out.println(userVO);
		model.addAttribute("UserVO", userVO);

		return "/User/UserUpdate";
	}

	@PostMapping("UpdateForm")
	public String UpdateForm(UserVO vo,HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute(SessionKeyCode.userKey);

		if(userVO!=null) {
			userService.update(vo);
			request.setAttribute("msg", "수정 되었습니다.");
		}else {
			request.setAttribute("msg", "수정에 실패했습니다.");
		}

		return "redirect:/User/Mypage";
	}

	@ResponseBody
	@PostMapping("/pwCheck")
	public int pwCheck(@RequestBody UserVO vo) {      
		int result = userService.pwCheck(vo);
		System.out.println("일치여부 : " + result);
		return result;
	}

	//TODO: 이름 delete > UserDelete로 직관적으로 바꿨는데 못찾겠어요ㅠ
	@PostMapping("/UserDelete")
	public String UserDelete(UserVO userVO,HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO MyuserVO = (UserVO) session.getAttribute(SessionKeyCode.userKey);
		UserVO resultVO = userService.checkUserEmailAndPw(MyuserVO.getEmail(), userVO.getPw());
		if(resultVO != null) {
			userService.delete(MyuserVO.getEmail());
		}else {
			session.removeAttribute(SessionKeyCode.userKey);
			request.setAttribute("msg", "탈퇴에 실패했습니다.");
			return "redirect:/User/UserUpdate";
		}

		return "redirect:/User/UserLogin";
	}

	@PostMapping("/PermissionChange")
	public String permissionChange(@RequestParam("email") String email, 
			HttpServletRequest request) {
		UserVO userVO = (UserVO) request.getSession().getAttribute(SessionKeyCode.userKey);
		if(userVO.getPermission().equals("creator")) {
			return "redirect:/Creator/MyCreatorPage"; //TODO: 이거 상의해야함
		}
		if(userVO.getEmail().equals(email)) {
			userService.permissionChange(userVO.getUno());
			return "redirect:/Creator/MyCreatorPage";
		} else {
			return "redirect:/User/CreatorJoin";
		}
	}


	@RequestMapping("/UserModifyPw")
	public String  userModifyPw() {
		return "/User/UserModifyPw";
	}

	@RequestMapping("send.do") // 확인 (메일발송) 버튼을 누르면 맵핑되는 메소드
	public String send(@ModelAttribute Email Email,Model model,HttpServletRequest request) {

		if(userService.emailCheck(Email.getReceiveMail())==0) {
			model.addAttribute("message", "존재하지않는 이메일입니다."); 
			return "/User/UserModifyPw";
		}

		MimeMessage msg = mailSender.createMimeMessage();


		try {

			msg.addRecipient(RecipientType.TO, new InternetAddress(Email.getReceiveMail()));

			msg.addFrom(new InternetAddress[] { new InternetAddress(Email.getSenderMail(), Email.getSenderName()) });

			MimeMessageHelper helper 
			= new MimeMessageHelper(msg, true,"utf-8");
			helper.setSubject("인증메일입니다.");
			helper.setText("<html><body>"
					+ "<div align='center' style='border:1px solid black; font-family:verdana'>"
					+ "<h3 style='color: blue;'>"
					+ Email.getReceiveMail() + "님</h3>"
					+ "<p>아래링크를 눌러 새로운 비밀번호를 설정하세요."
					//+  "<a href='"+request.getRequestURL() +"/UpdatePw'>링크이동</a></p></div>", true);
					+  "<a href='"+request.getRequestURL() +"/UpdatePw?email=" + Email.getReceiveMail() +"'>링크이동</a></p></div>", true);
			//+  "<a href='"+request.getRequestURL() + "/UpdatePw?email=" + email.getReceiveMail() + "&pwCode=" + pwCode + "'>링크이동</a></p></div>", true);

			// 이메일 보내기
			mailSender.send(msg);
			//            userService.sendMail(email);// email (메일관련 정보)를 sendMail에 저장함


		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "이메일 발송 실패."); 
			return "/User/UserModifyPw";
		}

		model.addAttribute("message", "이메일 발송 성공."); 
		return "/User/UserModifyPw"; 

	}

	@GetMapping("/send.do/UpdatePw")
	public String  UpdatePw(@RequestParam("email") String email,Model model,UserVO vo) {
		model.addAttribute("Email", email);

		return "/User/UpdatePw";
	}

	@RequestMapping("/send.do/UpdatePwForm")
	public String UpdatePwForm(UserVO vo) {
		try {
			userService.updatePw(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/User/UserLogin";
	}




}