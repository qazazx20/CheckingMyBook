package com.cmd.persistence;

import java.util.List;

import com.cmd.domain.BookVO;
import com.cmd.domain.BookViewVO;
import com.cmd.domain.CategoryVO;

public interface UserDAO {
	
	// 카테고리
	public List<CategoryVO> category() throws Exception;

	// Register
	public void register(BookVO vo) throws Exception;
	
	// List
	public List<BookViewVO> booklist() throws Exception;
	
	// 조회 + 카테고리 조인
	public BookViewVO bookView(int bkNum) throws Exception;
	
	// 상품 수정
	public void bookModify(BookVO vo) throws Exception;
	
	// 상품 삭제
	public void bookDelete(int bkNum) throws Exception;
	
	// 카테고리 대분류
	public List<BookViewVO> list(int cateCode, int cateCodeRef) throws Exception;
			
	// 카테고리 중분류
	public List<BookViewVO> list(int cateCode) throws Exception;
		
	}



