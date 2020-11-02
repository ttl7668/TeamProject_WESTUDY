package com.project.controller;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.creator.service.CreatorService;
import com.project.creator.vo.EnrollBoardPubVO;
import com.project.creator.vo.EnrollBoardVO;
import com.project.product.service.ProductService;
import com.project.product.vo.EnrollVO;
import com.project.product.vo.ProductResultVO;
import com.project.product.vo.ProductVO;
import com.project.user.service.UserService;
import com.project.user.vo.UserVO;
import com.project.util.FilePath;
import com.project.util.FileUtil;
import com.project.util.SessionKeyCode;

@Controller
@RequestMapping("/Creator")
public class CreatorController {
	
	@Autowired
	CreatorService creatorService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	UserService userService; 
	
	private FileUtil fileUtil = new FileUtil();
	
	@RequestMapping("/MyCreatorPage")
	public String creatorMyPage(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute(SessionKeyCode.userKey);
		int uno = userVO.getUno();
		
//		creatorService.getUserProductList(userVO.getUno());
		ArrayList<ProductVO> userProductList = (ArrayList<ProductVO>) creatorService.getUserProductList(uno);
		
		
		model.addAttribute("userProductList", userProductList);
		return "/Creator/MyCreatorPage";
	}
	
	@GetMapping("/EnrollBoard")
	public String enrollBoard(@RequestParam("pno") String pno, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute(SessionKeyCode.userKey);
		int uno = userVO.getUno();
		
		
		EnrollVO enrollVO = new EnrollVO(Integer.valueOf(pno),uno);
//		System.out.println(pno + "  " + uno);
		
		
		
		int isStudent = productService.IsStudent(enrollVO);
		int isCreator = creatorService.IsCreator(enrollVO);
		
		if(isStudent == 1 && isCreator == 0) {
			return "redirect:/Creator/EnrollBoardStudent?pno=" + pno;
		}
		else if(isCreator == 1) {
			return "redirect:/Creator/EnrollBoardCreator?pno=" + pno;
		} else {
			return "redirect:/";
		}
	}
	
	
	@GetMapping("/EnrollBoardStudent") //강좌 게시판(접근 권한: 수강생, 크리에이터)
	public String enrollBoardStudent(@RequestParam("pno") String pno, Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute(SessionKeyCode.userKey);
		int uno = userVO.getUno();
		
		
		
		
		EnrollVO enrollVO = new EnrollVO(Integer.valueOf(pno),uno);
//		System.out.println(pno + "  " + uno);
		
		
		
		int isStudent = productService.IsStudent(enrollVO);
		int isCreator = creatorService.IsCreator(enrollVO);
		

		System.out.println("isStudent : " + isStudent);
		System.out.println("isCreator : " + isCreator);
		
		if(isStudent == 0 && isCreator == 0) {
			if(isStudent == 0) {
				
			}
			if(isCreator == 0) {

			}
			return "redirect:/";
		} else {
			ArrayList<EnrollBoardVO> enrollStudentList = (ArrayList<EnrollBoardVO>)creatorService.getEnrollStudentList(pno);
			System.out.println("enrollStudentList : " + enrollStudentList);
			model.addAttribute("pno", pno);
			model.addAttribute("enrollStudentList", enrollStudentList);
			return "/Creator/EnrollBoardStudent";
		}
		
	}
	
	
	
	
	@GetMapping("/EnrollBoardCreator") //강좌 게시판(접근 권한: 수강생, 크리에이터)
	public String enrollBoardCreator(@RequestParam("pno") String pno, Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute(SessionKeyCode.userKey);
		int uno = userVO.getUno();
		
		
		EnrollVO enrollVO = new EnrollVO(Integer.valueOf(pno),uno);
//		System.out.println(pno + "  " + uno);
		
		
		
		int isStudent = productService.IsStudent(enrollVO);
		int isCreator = creatorService.IsCreator(enrollVO);
		

		System.out.println("isStudent : " + isStudent);
		System.out.println("isCreator : " + isCreator);
		
		if(isCreator == 0) {
			
				System.out.println("크리에이터 아님");
				System.out.println("크리에이터 아님");
				System.out.println("크리에이터 아님");
				System.out.println("크리에이터 아님");
				return "redirect:/";
		} else {
			ArrayList<EnrollBoardVO> enrollList = (ArrayList<EnrollBoardVO>)creatorService.getEnrollList(pno);
			System.out.println("enrollList : " + enrollList);
			model.addAttribute("pno", pno);
			model.addAttribute("enrollList", enrollList);
			return "/Creator/EnrollBoardCreator";
		}
		
	}
	
	
	@GetMapping("/EnrollPubSet")
	public String EnrollPubSet(HttpServletRequest request,@RequestParam("pno") String pno, @RequestParam("selectedString") String selectedString) {
	
		
		String[] selectedEnoString = selectedString.split("@@");
		
		
		
		
		int[] selectedEno = new int[selectedEnoString.length];
		
		
		System.out.println(selectedEnoString.length);
		System.out.println(selectedEno.length);
		
		for(int i = 0; i < selectedEnoString.length; i++) {
			selectedEno[i] = Integer.valueOf(selectedEnoString[i]);
		}
		
		
		creatorService.pubSetAllFalse();
		
		for(int i = 0; i < selectedEnoString.length; i++) {
			
			EnrollBoardPubVO enrollBoardPubVO = new EnrollBoardPubVO(Integer.valueOf(pno), selectedEno[i]);
			creatorService.pubSet(enrollBoardPubVO);
		}
				
		return "redirect:/Creator/EnrollBoard?pno=" + pno;
	}
	
	
	@GetMapping("/EnrollDetail") //강좌 게시판 자세히 보기(접근권한: 수강생, 크리에이터)
	public String enrollDetail(String eno, String pno, Model model) {
		EnrollBoardVO enrollBoardVO = creatorService.getEnrollDetailBoard(eno, pno);
		model.addAttribute("enrollBoardVO", enrollBoardVO);
		return "/Creator/EnrollDetail";
	}
	
	@GetMapping("/EnrollBoardDelete")
	public String enrollBoardDelete(@RequestParam("eno") String eno,@RequestParam("pno") String pno) {
		int pno1=Integer.parseInt(pno);
		int eno1=Integer.parseInt(eno);

		EnrollBoardPubVO enrollBoardPubVO = new EnrollBoardPubVO(pno1, eno1);
		creatorService.EnrollDelete(enrollBoardPubVO);
		
		return "redirect:/Creator/EnrollBoard?pno="+pno;
	}

	
	
	@GetMapping("/EnrollWrite") //강좌 글쓰기 화면(접근권한: 크리에이터)
	public String enrollWrite(String pno, Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute(SessionKeyCode.userKey);
		
		String writer = userVO.getName();
		
		model.addAttribute("pno", pno);
		model.addAttribute("writer", writer);
		return "/Creator/EnrollWrite";
	}
	
	@RequestMapping("/EnrollBoardRegist") //강좌 업로드  > DB에 가서 EnrollWrite에서 가져온 폼을insert함 (접근권한: 크리에이터)
	public String enrollBoardRegist(EnrollBoardVO enrollBoardVO, 
			  						@RequestParam("contentImg") List<MultipartFile> contentImgList,
			  						HttpServletRequest request,
			  						HttpSession session) {
		
		UserVO userVO = (UserVO) session.getAttribute(SessionKeyCode.userKey);
		int uno = userVO.getUno();
		String writer = userVO.getName();
		
		enrollBoardVO.setUno(uno);
		enrollBoardVO.setWriter(writer);
		
		int pno = Integer.valueOf(request.getParameter("pno"));
		int eno = creatorService.getMaxEno() + 1;
		fileUtil.fileListUpload(contentImgList, FilePath.boardPath, eno);
		creatorService.insertEnrollBoard(enrollBoardVO);
		return "redirect:/Creator/EnrollBoard?pno="+pno;
	}
	
	@RequestMapping("/EnrollBoardModify") // 강좌 수정페이지(접근권한: 크리에이터)
	public String enrollBoardModify(String eno, String pno, Model model) {
		EnrollBoardVO enrollBoardVO = creatorService.getEnrollDetailBoard(eno, pno);
		model.addAttribute("enrollBoardVO", enrollBoardVO);
		return "/Creator/EnrollModify";
	}
	
	//TODO: 수정폼에서 input 속성 잘 생각하기...
	@RequestMapping("/EnrollBoardModifyUpdate")
	public String enrollBoardModifyUpdate(EnrollBoardVO enrollBoardVO) {
		int eno = enrollBoardVO.getEno();
		int pno = enrollBoardVO.getPno();
		
		EnrollBoardPubVO enrollBoardPubVO = new EnrollBoardPubVO(pno, eno);
		creatorService.enrollBoardModify(enrollBoardPubVO);

		return "redirect:/Creator/EnrollDetail?pno=" + pno + "$eno=" + eno;
	}
	
	
	@RequestMapping("/EnrollBoardImg")
	public @ResponseBody byte[] getEnrollBoardImg(String eno, String fileName) throws IOException{
//		InputStream in = getClass().getResourceAsStream(creatorFolderPath + "\\" + eno + "\\" + fileName);
		System.out.println(fileName);
		String imgPath = FilePath.boardPath + "\\" + eno + "\\" + fileName; 
		InputStream imgFile = new BufferedInputStream(new FileInputStream(imgPath));
		return IOUtils.toByteArray(imgFile);
	}
	
	
}
