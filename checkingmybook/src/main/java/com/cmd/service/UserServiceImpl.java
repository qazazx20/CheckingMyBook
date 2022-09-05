package com.cmd.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cmd.domain.BookVO;
import com.cmd.domain.BookViewVO;
import com.cmd.domain.CategoryVO;
import com.cmd.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserDAO dao;
	
	// 카테고리
	@Override
	public List<CategoryVO> category() throws Exception {
		return dao.category();
	}

	// Add
	@Override
	public void register(BookVO vo) throws Exception {
		dao.register(vo);
	}
	
	// List
	@Override
	public List<BookViewVO> booklist() throws Exception {
		System.out.println("서비스");
		return dao.booklist();
	}
	
	// 조회 + 카테고리 조인
	@Override
	public BookViewVO bookView(int bkNum) throws Exception{
		return dao.bookView(bkNum);
	}
	
	// 상품 수정
	@Override
	public void bookModify(BookVO vo) throws Exception {
		dao.bookModify(vo);
	}
	
	// 상품 삭제
	@Override
	public void bookDelete(int bkNum) throws Exception {
		dao.bookDelete(bkNum);
	}
	
	// 카테고리별 리스트
	@Override
	public List<BookViewVO> list(int cateCode, int level) throws Exception {

		int cateCodeRef = 0;
		
		if(level == 1) { // 1차 분류
			
			cateCodeRef = cateCode;
			return dao.list(cateCode, cateCodeRef);
			
		} else { // 2차 분류
			
			return dao.list(cateCode);
		}
	}

}
