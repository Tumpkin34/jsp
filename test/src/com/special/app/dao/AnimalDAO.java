package com.special.app.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.mybatis.config.MyBatisConfig;
import com.special.app.vo.AnimalVO;
import com.special.app.vo.Criteria;
import com.special.app.vo.SearchDTO;

public class AnimalDAO {
	SqlSessionFactory sqlSessionFactory = MyBatisConfig.getSqlsessionFactory();
	SqlSession sqlSession;

	public AnimalDAO() {
		sqlSession = sqlSessionFactory.openSession(true);
	}
	
	public List<AnimalVO> findAllOrderBy(String type) {
		return sqlSession.selectList("Animal.findAllOrderBy", type);
	}
	
	public List<AnimalVO> findAllSearchBy(SearchDTO searchDTO) {
		return sqlSession.selectList("Animal.findAllSearchBy", searchDTO);
	}
	
	public List<AnimalVO> findAll(Criteria criteria) {
		return sqlSession.selectList("Animal.findAll", criteria);
	}
}





