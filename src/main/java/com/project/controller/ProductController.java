package com.project.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.product.vo.EnrollVO;
import com.project.product.vo.IntegratedContentVO;
import com.project.product.vo.MultiContentVO;
import com.project.product.vo.MultiQnAVO;
import com.project.product.vo.PaymentVO;
import com.project.product.vo.ProductResultVO;
import com.project.product.vo.ProductVO;
import com.project.user.vo.UserVO;
import com.project.util.SearchKeyword;
import com.project.util.SessionKeyCode;
import com.project.product.service.ProductService;

@Controller
@RequestMapping("/Product")
public class ProductController {

	@Autowired
	ProductService productService;

	public static final String uploadFolder = "/home/ubuntu/upload/board";


	@RequestMapping("ProductWrite")
	public String creatorBoard() {
		//강좌 등록 화면
		return "/Product/ProductWrite";
	}


	@RequestMapping("ProductRegist")
	public String ProductRegist(ProductVO productVO,
			MultiContentVO multicontentVO, MultiQnAVO multiqnaVO,
			@RequestParam("thumb") MultipartFile thumb,
			@RequestParam("ContentImg") List<MultipartFile> list,
			HttpServletRequest request
			) {

		System.out.println(productVO.getStartDate());
		System.out.println(productVO.getEndDate());
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute(SessionKeyCode.userKey);
		productVO.setUno(userVO.getUno());
		productVO.setCreator(userVO.getName());
		
		
		  String titleSearch = productVO.getTitle().replace(" ", "");
		      String creatorSearch = productVO.getCreator().replace(" ", "");
		      String introSearch = productVO.getIntro().replace(" ", "");
		      
		      productVO.setTitleSearch(titleSearch);
		      productVO.setCreatorSearch(creatorSearch);
		      productVO.setIntroSearch(introSearch);

		//, @RequestParam("thumbnail") MultipartFile thumb 
		//, @RequestParam("ContentImg") List<MultipartFile> list
		//여기서 할려는게 upload폴더 안에 "강좌 번호(pno)로 하위 폴더를 만들어서" 글에 포함된 이미지를 저장하는것입니다
		//근데 글을 쓸 당시에는 강좌번호(pno)가 없으므로 폴더를 만들 수도 없어요
		//그래서 productService.ProductGetNextPno()를 호출을 하는데 이것은
		//DB에서 현재 가장 높은 강좌번호를 얻는 메소드입니다. 강좌 등록시에는 여기다가 1을 더해서 글번호로 삼고 폴더를 만들어 이미지를 저장합니다.
		int NextPno = 0;
		try {
			NextPno = productService.ProductGetNextPno();
		} catch(Exception e) {
			e.printStackTrace();
		}
		String NextPnoFolder = String.valueOf(NextPno+1);

		//File newFolder = new File("D:\\course\\spring\\upload\\" + (NextPno+1));   
		File newFolder = new File(uploadFolder + NextPnoFolder);   
		newFolder.mkdir();


		try {
			String fileRealName = thumb.getOriginalFilename(); //실제파일명

			File ThumbNailFolder = new File(uploadFolder + NextPnoFolder + "\\thumbnail");
			ThumbNailFolder.mkdir();

			File saveFile = new File(uploadFolder + NextPnoFolder + "\\thumbnail\\" + fileRealName );
			thumb.transferTo(saveFile); //실제 파일을 저장해주는 메서드 filewriter작업을 손쉽게 해주는 스프링 메서드

			productVO.setThumbnail(uploadFolder + NextPnoFolder + "\\thumbnail\\" + fileRealName);

			System.out.println("thumb : "  + productVO.getThumbnail());

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		Calendar cal = Calendar.getInstance();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date startDate = null;
		Date endDate = null;
		int week = 0;
		try {
			startDate = sdf.parse(productVO.getStartDate());
			endDate = sdf.parse(productVO.getEndDate());
			cal.setTime(startDate);

			while(startDate.compareTo(endDate) < 0) {
				System.out.println(cal.getTime());
				cal.add(Calendar.DATE, 7);
				week++;
				if(cal.getTime().compareTo(endDate) > 0) {
					break;
				}
			}
			String term = String.valueOf(week);
			System.out.println(term + "주");
			productVO.setTerm(term);

		} catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(startDate.compareTo(endDate));

		try {

			File ContentImgFolder = new File(uploadFolder + NextPnoFolder + "\\contentImg");
			ContentImgFolder.mkdir();

			for(int i = 0; i < list.size(); i++) {

				System.out.println("i : " + i);
				System.out.println("list size : " + list.size());
				String fileRealName = list.get(i).getOriginalFilename(); //파일실제이름
				String fileExtension = fileRealName.substring( fileRealName.lastIndexOf(".") , fileRealName.length() );


				fileRealName = String.valueOf(i+1);
				fileRealName += fileExtension;

				File saveFile = new File(uploadFolder + NextPnoFolder + "\\contentImg\\" + fileRealName);
				list.get(i).transferTo(saveFile); //실제 파일을 저장


				multicontentVO.getContentList().get(i).setContentImgBox(uploadFolder + NextPnoFolder + "\\contentImg\\" + fileRealName);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		for(int i = 0; i < multiqnaVO.getQnAList().size(); i++) {
			System.out.println(multiqnaVO.getQnAList().get(i));
		}
		IntegratedContentVO integratedVO = new IntegratedContentVO(productVO, multicontentVO, multiqnaVO);

		System.out.println("썸네일이 왜 null이죠???");
		System.out.println("thumbnail : " + productVO.getThumbnail());
		System.out.println("썸네일이 왜 null이죠???");



		int result = productService.ProductRegist(integratedVO);


		return "redirect:/Creator/MyCreatorPage";
	}

	@RequestMapping("ProductDetail")
	public String ProductDetail(HttpServletRequest request, Model model, HttpSession session) {

		int pno = Integer.parseInt(request.getParameter("product"));

		try {
			UserVO userVO = (UserVO)session.getAttribute(SessionKeyCode.userKey);
			int uno = userVO.getUno();

			model.addAttribute("IsStudent",false);

			EnrollVO enrollVO = new EnrollVO(pno, uno);
			int result = productService.IsStudent(enrollVO);
			if(result > 0) {
				model.addAttribute("IsStudent",true);
			} else {
				model.addAttribute("IsStudent",false);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}

		ProductResultVO productResultVO = productService.getProductInfo(pno);

		String contentStr = productResultVO.getContents();
		String[] contentList = contentStr.split("&&bhc&&");

		for(int i = 0; i<contentList.length; i++) {
			System.out.println(contentList[i]);
		}

		ArrayList<String> contentImgList = new ArrayList<String>();
		ArrayList<String> contentTextList = new ArrayList<String>();
		for(int i = 0; i < contentList.length-1; i++) {
			contentImgList.add(contentList[i]);

			i++;
			contentTextList.add(contentList[i]);
		}

		String QnAStr = productResultVO.getQnA();
		String[] QnAList = QnAStr.split("&&bhc_qna&&");

		ArrayList<String> qnaQList = new ArrayList<String>();
		ArrayList<String> qnaAList = new ArrayList<String>();
		for(int i = 0; i < QnAList.length-1; i++) {
			qnaQList.add(QnAList[i]);
			i++;
			qnaAList.add(QnAList[i]);
		}

		HashMap<String,String> map = new HashMap<String, String>();
		for(int i = 0; i < qnaQList.size(); i++) {
			map.put(qnaQList.get(i), qnaAList.get(i));
		}

		model.addAttribute("productVO",productResultVO);
		model.addAttribute("contentImgList",contentImgList.size());
		model.addAttribute("contentTextList",contentTextList);
		model.addAttribute("map",map);
		model.addAttribute("qnaQList",qnaQList);
		model.addAttribute("qnaAList",qnaAList);
		//model.addAttribute("ImgList",ImgList);

		try {
			UserVO userVO = (UserVO)session.getAttribute(SessionKeyCode.userKey);
			int uno = userVO.getUno();

			EnrollVO enrollVO = new EnrollVO(pno, uno);

			int isInterest = productService.IsInterst(enrollVO);
			model.addAttribute("Interest",false);

			if(isInterest >= 1) {
				model.addAttribute("Interest",true);
			} else {
				model.addAttribute("Interest",false);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}



		ArrayList<ProductResultVO> sameProductList =  (ArrayList<ProductResultVO>)productService.getSameProductList(productResultVO);

		System.out.println(sameProductList.toString());
		model.addAttribute("sameProductList",sameProductList);

		return "/Product/ProductDetail";
	}



	@RequestMapping("ProductModify")
	public String ProductModify(HttpServletRequest request, Model model) {
		//강좌 수정 화면
		int pno = Integer.valueOf(request.getParameter("pno"));

		ProductResultVO productResultVO = productService.getProductInfo(pno);




		String contentStr = productResultVO.getContents();
		String[] contentList = contentStr.split("&&bhc&&");

		for(int i = 0; i<contentList.length; i++) {
			System.out.println(contentList[i]);
		}

		ArrayList<String> contentImgList = new ArrayList<String>();
		ArrayList<String> contentTextList = new ArrayList<String>();
		for(int i = 0; i < contentList.length-1; i++) {
			contentImgList.add(contentList[i]);

			i++;
			contentTextList.add(contentList[i]);
		}


		String QnAStr = productResultVO.getQnA();
		String[] QnAList = QnAStr.split("&&bhc_qna&&");

		ArrayList<String> qnaQList = new ArrayList<String>();
		ArrayList<String> qnaAList = new ArrayList<String>();
		for(int i = 0; i < QnAList.length-1; i++) {
			qnaQList.add(QnAList[i]);
			i++;
			qnaAList.add(QnAList[i]);
		}

		HashMap<String,String> map = new HashMap<String, String>();
		for(int i = 0; i < qnaQList.size(); i++) {
			map.put(qnaQList.get(i), qnaAList.get(i));
		}


		model.addAttribute("productResultVO",productResultVO);
		model.addAttribute("contentImgList",contentImgList.size());
		model.addAttribute("contentTextList",contentTextList);
		model.addAttribute("map",map);
		model.addAttribute("mapSize",map.size());




		return "/Product/ProductModify";
	}



	@RequestMapping("ProductModify2")
	public String ProductModify2(ProductVO productVO,
			MultiContentVO multicontentVO, MultiQnAVO multiqnaVO,
			@RequestParam("thumb") MultipartFile thumb,
			@RequestParam("ContentImg") List<MultipartFile> list

			) {
		//      System.out.println(productVO.getStartDate());
		//      System.out.println(productVO.getEndDate());
		//
		//
		//      //, @RequestParam("thumbnail") MultipartFile thumb 
		//      //, @RequestParam("ContentImg") List<MultipartFile> list
		//      //여기서 할려는게 upload폴더 안에 "강좌 번호(pno)로 하위 폴더를 만들어서" 글에 포함된 이미지를 저장하는것입니다
		//      //근데 글을 쓸 당시에는 강좌번호(pno)가 없으므로 폴더를 만들 수도 없어요
		//      //그래서 productService.ProductGetNextPno()를 호출을 하는데 이것은
		//      //DB에서 현재 가장 높은 강좌번호를 얻는 메소드입니다. 강좌 등록시에는 여기다가 1을 더해서 글번호로 삼고 폴더를 만들어 이미지를 저장합니다.
		//      int NextPno = 0;
		//      try {
		//         NextPno = productService.ProductGetNextPno();
		//      } catch(Exception e) {
		//         e.printStackTrace();
		//      }
		//      String NextPnoFolder = String.valueOf(NextPno+1);
		//
		//      //File newFolder = new File("D:\\course\\spring\\upload\\" + (NextPno+1));   
		File newFolder = new File(uploadFolder + productVO.getPno());   
		//      newFolder.mkdir();



		try {
			String fileRealName = thumb.getOriginalFilename(); //실제파일명

			File saveFile = new File(newFolder + "\\thumbnail\\" + fileRealName );
			thumb.transferTo(saveFile); //실제 파일을 저장해주는 메서드 filewriter작업을 손쉽게 해주는 스프링 메서드

			productVO.setThumbnail(newFolder + "\\thumbnail\\" + fileRealName);

			System.out.println("thumb : "  + productVO.getThumbnail());

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}




		Calendar cal = Calendar.getInstance();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date startDate = null;
		Date endDate = null;
		int week = 0;
		try {
			startDate = sdf.parse(productVO.getStartDate());
			endDate = sdf.parse(productVO.getEndDate());
			cal.setTime(startDate);

			while(startDate.compareTo(endDate) < 0) {
				System.out.println(cal.getTime());
				cal.add(Calendar.DATE, 7);
				week++;
				if(cal.getTime().compareTo(endDate) > 0) {
					break;
				}
			}
			String term = String.valueOf(week);
			System.out.println(term + "주");
			productVO.setTerm(term);

		} catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(startDate.compareTo(endDate));


		try {


			for(int i = 0; i < list.size(); i++) {

				System.out.println("i : " + i);
				System.out.println("list size : " + list.size());
				String fileRealName = list.get(i).getOriginalFilename(); //파일실제이름
				String fileExtension = fileRealName.substring( fileRealName.lastIndexOf(".") , fileRealName.length() );


				fileRealName = String.valueOf(i+1);
				fileRealName += fileExtension;

				File saveFile = new File(newFolder + "\\contentImg\\" + fileRealName);
				list.get(i).transferTo(saveFile); //실제 파일을 저장


				multicontentVO.getContentList().get(i).setContentImgBox(newFolder + "\\contentImg\\" + fileRealName);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		for(int i = 0; i < multiqnaVO.getQnAList().size(); i++) {
			System.out.println(multiqnaVO.getQnAList().get(i));
		}
		IntegratedContentVO integratedVO = new IntegratedContentVO(productVO, multicontentVO, multiqnaVO);

		System.out.println("thumbnail : " + productVO.getThumbnail());


		int result = productService.ProductModify(integratedVO);



		return "/Product/ProductWrite";
	}



	@RequestMapping("CreateInterest")
	public String CreateInterest(HttpServletRequest request, HttpSession session, RedirectAttributes redirectAttr) {

		int pno = Integer.valueOf(request.getParameter("pno"));

		UserVO userVO = (UserVO)session.getAttribute(SessionKeyCode.userKey);
		int uno = userVO.getUno();

		//여긴 관심등록이긴 한데  "관심" 테이블이랑  "강좌등록" 테이블 컬럼구조가 완전히 같아서 그냥 EnrollVO 재사용 하겠습니다
		EnrollVO enrollVO = new EnrollVO(pno, uno);

		productService.CreateInterest(enrollVO);

		int isInterest = productService.IsInterst(enrollVO);
		redirectAttr.addFlashAttribute("Interest", false);

		if(isInterest >= 1) {
			redirectAttr.addFlashAttribute("Interest", true);
		} else {
			redirectAttr.addFlashAttribute("Interest", false);
		}


		return "redirect:/Product/ProductDetail?product=" + pno;
	}



	@RequestMapping("DeleteInterest")
	public String DeleteInterest(HttpServletRequest request, HttpSession session, RedirectAttributes redirectAttr) {

		int pno = Integer.valueOf(request.getParameter("pno"));

		UserVO userVO = (UserVO)session.getAttribute(SessionKeyCode.userKey);
		int uno = userVO.getUno();

		//EnrollVO 재사용 하겠습니다
		EnrollVO enrollVO = new EnrollVO(pno, uno);

		productService.DeleteInterest(enrollVO);

		int isInterest = productService.IsInterst(enrollVO);
		System.out.println("isInterest : " + isInterest);
		System.out.println("isInterest : " + isInterest);

		redirectAttr.addFlashAttribute("Interest", false);

		if(isInterest >= 1) {

			redirectAttr.addFlashAttribute("Interest", true);
		} else {

			redirectAttr.addFlashAttribute("Interest", false);
		}

		return "redirect:/Product/ProductDetail?product=" + pno;
	}









	//   //강의 등록                     //권한 필터 필요
	//   @RequestMapping("enrollProduct")   //중간 절차없이 신청누르면 바로 신청됨 (추후 수정 필요)
	//   public String enrollProduct(HttpServletRequest request,HttpSession session) {
	//
	//      UserVO userVO = (UserVO)session.getAttribute(SessionKeyCode.userKey);
	//      int uno = userVO.getUno();
	//      
	//      

	//      if(session.getAttribute("email")==null || session.getAttribute("k_email")!=null) {
	//         email = (String)session.getAttribute("k_email");
	//
	//      } else if (session.getAttribute("email")!=null || session.getAttribute("k_email")==null) {
	//         email = (String)session.getAttribute("email");
	//
	//      } else if (session.getAttribute("email")==null || session.getAttribute("k_email")==null) {
	//         System.out.println("권한 체크나 해라");
	//         return "/";
	//      }
	//
	//      int pno = Integer.valueOf(request.getParameter("pno"));
	//      EnrollVO enrollVO = new EnrollVO(pno, email);
	//      int result = productService.EnrollProduct(enrollVO);
	//      System.out.println("enrollProduct result: " + result);
	//      return "/Product/CreatorBoardTestResult?product=" + pno;
	//   }





	//
	//   @RequestMapping("ProductPayment") 
	//   public String ProductPayment(HttpServletRequest request, Model model) {
	//
	//      int pno = Integer.valueOf(request.getParameter("pno"));
	//
	//      model.addAttribute("pno",pno);
	//
	//      return "/Product/ProductPayment";
	//   }


	@RequestMapping("PaymentProcedure")  
	public String PaymentComplete(HttpServletRequest request, Model model, HttpServletResponse response, HttpSession session) {

		System.out.println("결제결제결제");
		System.out.println("결제결제결제");
		System.out.println("결제결제결제");
		System.out.println("결제결제결제");
		System.out.println("결제결제결제");
		System.out.println("결제결제결제");
		System.out.println("결제결제결제");
		System.out.println("결제결제결제");
		System.out.println("결제결제결제");
		System.out.println("결제결제결제");
		
		int pno = Integer.valueOf(request.getParameter("pno"));


		UserVO userVO = (UserVO)session.getAttribute(SessionKeyCode.userKey);
		int uno = userVO.getUno();

		int amount = Integer.valueOf(request.getParameter("amount"));
		String cardGrantNum = request.getParameter("cardGrantNum");

		if(amount > 1) {

			PaymentVO paymentVO = new PaymentVO();

			paymentVO.setPno(pno);
			paymentVO.setUno(uno);
			paymentVO.setAmount(amount);
			paymentVO.setCardGrantNum(cardGrantNum);
			
			
			System.out.println("pno : " + pno);
			System.out.println("pno : " + pno);
			System.out.println("pno : " + pno);
			System.out.println("pno : " + pno);
			System.out.println("pno : " + pno);
			System.out.println("uno : " + uno);
			System.out.println("uno : " + uno);
			System.out.println("uno : " + uno);
			System.out.println("uno : " + uno);
			System.out.println("uno : " + uno);

			int result = productService.PaymentRegist(paymentVO);

			EnrollVO enrollVO = new EnrollVO(pno, uno);
			
			
			int result2 = productService.EnrollProduct(enrollVO);
			
			System.out.println("payment result : " + result);
			System.out.println("payment result : " + result);
			System.out.println("payment result : " + result);
			System.out.println("payment result : " + result);
			System.out.println("payment result : " + result);
			System.out.println("payment result2 : " + result2);
			System.out.println("payment result2 : " + result2);
			System.out.println("payment result2 : " + result2);
			System.out.println("payment result2 : " + result2);
			System.out.println("payment result2 : " + result2);


			return "/Product/ProductDetail?pno="+pno;
		}
		else {
			return "/Product/PaymentFailed";
		}


	}
	
	 @RequestMapping("/SearchProducts")
	   public String searchProducts() {
	      return "/Product/SearchProducts";
	   }
	   
	   @GetMapping("/SearchProductsResult")
	   public String searchProductsResult(HttpServletRequest request, SearchKeyword searchKeyword, Model model) {
		   
	      
		  ArrayList<ProductResultVO> list = (ArrayList<ProductResultVO>) productService.searchProduct(searchKeyword);
	      model.addAttribute("searchKeyword", searchKeyword);
	      model.addAttribute("searchResultList", list);	
	      return "/Product/SearchProducts";
	   }






}