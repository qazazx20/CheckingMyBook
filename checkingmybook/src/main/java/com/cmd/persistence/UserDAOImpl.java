package com.cmd.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cmd.domain.BookVO;
import com.cmd.domain.BookViewVO;
import com.cmd.domain.CategoryVO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Inject
	private SqlSession sql;
	
	// mapper
	private static String namespace = "com.cmd.mappers.userMapper";
	
	// 카테고리
	@Override
	public List<CategoryVO> category() throws Exception {
		return sql.selectList(namespace + ".category");
	}
	
	// Register
	@Override
	public void register(BookVO vo) throws Exception {
		sql.insert(namespace + ".register", vo);
	}
	
	// List
	@Override
	public List<BookViewVO> booklist() throws Exception {
		return sql.selectList(namespace + ".booklist");
	}
	
	// 조회 + 카테고리 조인
	@Override
	public BookViewVO bookView(int bkNum) throws Exception {
		return sql.selectOne(namespace + ".bookView", bkNum);
	}
	
	// 상품 수정
	@Override
	public void bookModify(BookVO vo) throws Exception {
		sql.update(namespace + ".bookModify", vo);
	}
	
	// 상품 삭제
	@Override
	public void bookDelete(int bkNum) throws Exception {
		sql.delete(namespace + ".bookDelete", bkNum);
	}
	
	// 카테고리 대분류
	@Override
	public List<BookViewVO> list(int cateCode, int cateCodeRef) throws Exception {
	 
	 HashMap<String, Object> map = new HashMap<String, Object>();
	 
	 map.put("cateCode", cateCode);
	 map.put("cateCodeRef", cateCodeRef);
	 
	 return sql.selectList(namespace + ".mainlist_1", map);
	}

	// 카테고리 중분류
	@Override
	public List<BookViewVO> list(int cateCode) throws Exception {
	 
	 return sql.selectList(namespace + ".mainlist_2", cateCode);
	
	}

}
