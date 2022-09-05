package com.cmb.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cmd.domain.BookVO;
import com.cmd.domain.BookViewVO;
import com.cmd.domain.CategoryVO;
import com.cmd.service.UserService;
import com.cmd.utils.UploadFileUtils;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/user/*")
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	UserService userService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	// 사용 화면
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public void getIndex() throws Exception {
		logger.info("get index");
	}
	
	// Register
	@RequestMapping(value = "/book/register", method = RequestMethod.GET)
	public void getBookRegister(Model model) throws Exception {
		logger.info("get book register");
		
		List<CategoryVO> category = null;// CatagoryVO 형태의 List형 변수 category 선언
		category = userService.category();// DB에 저장된 카테고리를 가져와서 category에 저장
		model.addAttribute("category", JSONArray.fromObject(category)); // 변수 category를 제이슨(json)타입으로 변환하여 category 세션에 부여
	}
	
	// Register
	@RequestMapping(value = "/book/register", method = RequestMethod.POST)
	public String postBookRegister(BookVO vo, MultipartFile file) throws Exception {
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";  // 이미지를 업로드할 폴더를 설정 = /uploadPath/imgUpload 
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);  // 위의 폴더를 기준으로 연월일 폴더를 생성
		String fileName = null;  // 기본 경로와 별개로 작성되는 경로 + 파일이름
		
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 파일 인풋박스에 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)
		 
			fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			
			// bkImg에 원본 파일 경로 + 파일명 저장
			vo.setBkImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			// bkThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
			vo.setBkThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
			
		} else { // 첨부 파일이 없다면
			fileName = File.separator + "images" + File.separator + "none.png";
			
			vo.setBkImg(fileName);
			vo.setBkThumbImg(fileName);
		}
		
		userService.register(vo);
		
		return "redirect:/user/book/list";
	}
	
	// List
	@RequestMapping(value = "/book/list", method = RequestMethod.GET)
	public void getBookList(Model model) throws Exception {
		logger.info("get book list");
		
		List<BookViewVO> list = userService.booklist();
		
		model.addAttribute("list", list); // 변수 list를 list 세션에 부여
	}
	
	// 조회
	@RequestMapping(value = "/book/view", method=RequestMethod.GET)
	public void getBookview(@RequestParam("n") int bkNum, Model model) throws Exception{
		logger.info("get book view");
	
		BookViewVO books = userService.bookView(bkNum);
		
		model.addAttribute("books", books);
	}
	
	// 상품 수정
	@RequestMapping(value = "/book/modify", method = RequestMethod.GET)
	public void getBookModify(@RequestParam("n") int bkNum, Model model) throws Exception {
		logger.info("get book modify");
		
		BookViewVO books=userService.bookView(bkNum);
		model.addAttribute("books", books);
		
		List<CategoryVO> category = null;
		category = userService.category();
		model.addAttribute("category", JSONArray.fromObject(category));
		
	}
	
	// 상품 수정
	@RequestMapping(value = "/book/modify", method = RequestMethod.POST)
	public String postBookModify(BookVO vo, MultipartFile file, HttpServletRequest req) throws Exception {
		logger.info("post book modify");
		
		// 새로운 파일이 등록되었는지 확인
		 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		  // 기존 파일을 삭제
		  new File(uploadPath + req.getParameter("bkImg")).delete();
		  new File(uploadPath + req.getParameter("bkThumbImg")).delete();
		  
		  // 새로 첨부한 파일을 등록
		  String imgUploadPath = uploadPath + File.separator + "imgUpload";
		  String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		  String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		  
		  vo.setBkImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		  vo.setBkThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		  
		 } else {  // 새로운 파일이 등록되지 않았다면
		  // 기존 이미지를 그대로 사용
		  vo.setBkImg(req.getParameter("bkImg"));
		  vo.setBkThumbImg(req.getParameter("bkThumbImg"));
		  
		 }
		
		userService.bookModify(vo);
		
		return "redirect:/user/book/list";
	}
	
	// 상품 삭제 
	@RequestMapping(value = "/book/delete", method = RequestMethod.POST)
	public String postBookDelete(@RequestParam("n") int bkNum) throws Exception {
		logger.info("post book delete");
		
		userService.bookDelete(bkNum);
		
		return "redirect:/user/book/list";
	}
	
	// ck 에디터에서 파일 업로드
	@RequestMapping(value = "/book/ckUpload", method = RequestMethod.POST)
	public void postCKEditorImgUpload(HttpServletRequest req,
	          HttpServletResponse res,
	          @RequestParam MultipartFile upload) throws Exception {
	 logger.info("post CKEditor img upload");
	 
	 // 랜덤 문자 생성
	 UUID uid = UUID.randomUUID();
	 
	 OutputStream out = null;
	 PrintWriter printWriter = null;
	   
	 // 인코딩
	 res.setCharacterEncoding("utf-8");
	 res.setContentType("text/html;charset=utf-8");
	 
	 try {
	  
	  String fileName = upload.getOriginalFilename();  // 파일 이름 가져오기
	  byte[] bytes = upload.getBytes(); // 이미지 포함 모든 데이터는 바이트
	  
	  // 업로드 경로
	  String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;
	  
	  out = new FileOutputStream(new File(ckUploadPath));
	  out.write(bytes);
	  out.flush();  // out에 저장된 데이터를 전송하고 초기화
	  
	  String callback = req.getParameter("CKEditorFuncNum");
	  printWriter = res.getWriter();
	  String fileUrl = "/ckUpload/" + uid + "_" + fileName;  // 작성화면
	  
	  // 업로드시 메시지 출력
	  printWriter.println("<script type='text/javascript'>"
	     + "window.parent.CKEDITOR.tools.callFunction("
	     + callback+",'"+ fileUrl+"','이미지를 업로드하였습니다.')"
	     +"</script>");
	  
	  printWriter.flush();
	  
	 } catch (IOException e) { e.printStackTrace();
	 } finally {
	  try {
	   if(out != null) { out.close(); }
	   if(printWriter != null) { printWriter.close(); }
	  } catch(IOException e) { e.printStackTrace(); }
	 }
	 
	 return; 
	}
		
	
	// 국내/외국 리스트

		 @RequestMapping(value = "/book/mainlist", method = RequestMethod.GET)
		 public void getList(@RequestParam("c") int cateCode,
				 			 @RequestParam("l") int level, Model model) throws Exception {
		  logger.info("get list");
		  
		  List<BookViewVO> list = null;
		  list = userService.list(cateCode, level);
		 
		  model.addAttribute("list", list);
		  
		 }
	}
	

