package com.special.app;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.mybatis.config.MyBatisConfig;
import com.special.app.vo.NameVO;

public class NameDAO {
	SqlSessionFactory sqlSessionFactory = MyBatisConfig.getSqlsessionFactory(); 
	//컨피그파일에서 이팩토리를 만들고 이 팩토리가 매퍼 네임으로 이런걸 찾게 해준다.
	SqlSession sqlSession;

	public NameDAO() {
	      sqlSession = sqlSessionFactory.openSession(true);
	   }

	public void insert(NameVO nameVO) {
	      sqlSession.insert("Name.insert", nameVO); //sql세션에 insert가 있어서 쓴다.매퍼 Name안에 insert실행해줘
	   }
	public NameVO select() {
		return sqlSession.selectOne("Name.select");
	}
	
}
