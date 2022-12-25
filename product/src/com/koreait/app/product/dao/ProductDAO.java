package com.koreait.app.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.app.product.vo.ProductVO;
import com.koreait.mybatis.config.MyBatisConfig;

public class ProductDAO {
   SqlSessionFactory sqlSessionFactory = MyBatisConfig.getSqlsessionFactory();
   SqlSession sqlSession;

   public ProductDAO() {
      sqlSession = sqlSessionFactory.openSession(true);
   }
   
   public void insert(ProductVO productVO) {
      sqlSession.insert("product.insert", productVO);
   }
   
   public List<ProductVO> select () {
//	   return: 돌려준다 sqlSession: 쿼리문 실행 시키기위한 준비물 .selectList: 준비물 안에 selectList메소드를 사용하는데 여러개를 가져온다. ("product.select"): selectList의 매개변수로  namespace가 product인 mapper에 .select: select라는 Id의 쿼리를 실행 시킨다.
//	   쿼리문 실행 시키기위한 준비물(sqlSession)로 준비물 안에 selectList메소드를 사용해서 namespace가 product인 mapper에서 id가 select인 쿼리문을 실행 시켜서 나온 값을 돌려준다.
	   return sqlSession.selectList("product.select");
   }
   
   public void delete(int productNumber) {
	   sqlSession.delete("product.delete",productNumber);
   }
   
   public void update(ProductVO productVO) {
	   sqlSession.update("product.update", productVO);
   }
}