package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.koreait.mybatis.config.MyBatisConfig;

import vo.UserVO;

public class UserDAO {
	public static final int DELETED_USER_CODE = -1;// 탈퇴
	public static final int RESTORED_USER_CODE = 0;// 일반
	public static final int DUPLICATED_ID_CODE = 1;// 중복
	public static final int ENABLED_ID_CODE = 2;// 활성화

	public Connection connection; // 연결 객체
	public PreparedStatement preparedStatement;// 쿼리문 객체
	public ResultSet resultSet;// 결과 테이블 객체

	/**
	 * 
	 * @param userId
	 * @return RESTORED_USER_CODE = 0;<br>
	 *         DELETED_USER_CODE = 1;<br>
	 *         DUPLICATED_ID_CODE = 2;<br>
	 *         ENABLED_ID_CODE = 3;<br>
	 */

	public SqlSession sqlSession;

	public UserDAO() {
		sqlSession = MyBatisConfig.getSqlsessionFactory().openSession(true);
	}

//   아이디 중복검사   
	public int checkId(String userId) {// 아이디 받아옴
		return sqlSession.selectOne("User.checkId", userId) == null ? 1 : sqlSession.selectOne("User.checkId", userId);
	}

//   회원가입
	public int insert(UserVO userVO) {// 회원가입에 필요한 정보 받음
		System.out.println("안녕");
		return sqlSession.insert("User.insert",userVO);
	}

//	public boolean insert(UserVO userVO) {// 회원가입에 필요한 정보 받음
//		if (!check(userVO.getUserPhoneNumber())) {// 넘겨준 번호로 3개이상 가입되어있다면 false회원가입불가니까 if실행 시키기 위해 !
//			return false;// 회원가입 불가능
//		}
////	 	받아온 VO객체의 각 값을 테이블에 저장하는 쿼리문
//		String query = "insert into tbl_user "
//				+ "(userId, userPassword, userName, userAge, userPhoneNumber, userBirth) " + "values(?, ?, ?, ?, ?, ?)";
//
//		try {
////			연결 객체 가져오기
//			connection = DBConnecter.getConnection();
////			쿼리문 전달
//			preparedStatement = connection.prepareStatement(query);
////			각 ? 채움
//			preparedStatement.setString(1, userVO.getUserId());
//			preparedStatement.setString(2, userVO.getUserPassword());
//			preparedStatement.setString(3, userVO.getUserName());
//			preparedStatement.setInt(4, userVO.getUserAge());
//			preparedStatement.setString(5, userVO.getUserPhoneNumber());
//			preparedStatement.setString(6, userVO.getUserBirth());
////			가져올 결과가 없으니까 Update
//			preparedStatement.executeUpdate();
//
//		} catch (SQLException e) {
//			System.out.println(e);
//			System.out.println("insert()에서 쿼리문 오류");
//
//		} finally {
//			try {
//				if (preparedStatement != null) {
//					preparedStatement.close();
//				}
//				if (connection != null) {
//					connection.close();
//				}
//			} catch (SQLException e) {
//				throw new RuntimeException(e.getMessage());
//			}
//		}
//		return true;// 회원가입에 성공했으면true
//	}

//   로그인
	public int login(String userId, String userPassword) {
//		받아온 아이디와 비밀번호가 같은 로우의 userNumber와 userStatus가져옴
		String query = "select userNumber, userStatus from tbl_user where userId = ? and userPassword =?";

		int userNumber = 0;// 조회된 userNumber담을 변수

		try {
			connection = DBConnecter.getConnection();// 연결 객체
			preparedStatement = connection.prepareStatement(query);// 쿼리문 전달
//			? 채움
			preparedStatement.setString(1, userId);
			preparedStatement.setString(2, userPassword);

//			조회된 테이블 저장
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {// 조회된 테이블의 첫번째 로우로 포커스하고
				userNumber = resultSet.getInt("userNumber");// 포커스된 로우의 userNumber컬럼 가져오고 저장

				if (resultSet.getInt(2) == DELETED_USER_CODE) {// 포커스된 로우의 userStatus가 DELETED_USER_CODE 즉 -1 이라면
					userNumber = DELETED_USER_CODE;// 탈퇴한 아이디에 해당하는 수 저장
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("login() 쿼리문 오류");
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
				}
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return userNumber;// 위에 조건들에서 저장된 userNumber
	}

//   아이디 찾기
	public ArrayList<UserVO> findId(String userPhoneNumber) {

//		받아온 핸드폰 번호정보가 있는 로우의 userNumber,userId userPhoneNumber 컬럼 조회
		String query = "select userNumber, userId, userPhoneNumber from tbl_user where userPhoneNumber = ?";
//		동일한 핸드폰번호로 3개의 가입정보가 있을 수 있기에 그정보 담을 ArrayList선언
		ArrayList<UserVO> users = new ArrayList<UserVO>();

		try {
			connection = DBConnecter.getConnection();// 연결 객체 가져오기
			preparedStatement = connection.prepareStatement(query);// 쿼리문 전달
			preparedStatement.setString(1, userPhoneNumber);// ? 채움
			resultSet = preparedStatement.executeQuery();// 조회된 값 저장

			while (resultSet.next()) {// 검색된 테이블이 여러개일 수 있기에 반복문
				UserVO userVO = new UserVO();// 밑의 정보들 저장할 객체 선언
				userVO.setUserNumber(Integer.valueOf(resultSet.getString(1)));// 조회된 userNumber로 초기화
				userVO.setUserId(resultSet.getString(2));// 조회된 userId로 초기화
				userVO.setUserPhoneNumber(resultSet.getString(3));// 조회된 userPhoneNumber로 초기화

				users.add(userVO);// 각 초기화된 객체 ArrayList에 저장
			}

		} catch (SQLException e) {
			System.out.println("findId() 쿼리문 오류");
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
				}
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return users;// 각 정보의 주소가 담긴 ArrayList넘김
	}

//   회원 정보 전체 수정
	public void update(UserVO userVO) {
//		userNumber가 있는 로우에 초기화된 회원정보가 담긴 VO객체로 각 컬럼의 값을 수정하는 쿼리문
		String query = "update tbl_user " + "set userName=?, userPassword=?, userPhoneNumber=?, userAge=?, userBirth=? "
				+ "WHERE userNumber = ?";

		try {
			connection = DBConnecter.getConnection();// 연결 객체 가져오기
			preparedStatement = connection.prepareStatement(query);// 쿼리문 전달
//			?채움
			preparedStatement.setString(1, userVO.getUserName());
			preparedStatement.setString(2, userVO.getUserPassword());
			preparedStatement.setString(3, userVO.getUserPhoneNumber());
			preparedStatement.setInt(4, userVO.getUserAge());
			preparedStatement.setString(5, userVO.getUserBirth());
			preparedStatement.setInt(6, userVO.getUserNumber());
//			조회할게 아니기 때문에 Update
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			System.out.println("update() 쿼리 오류");
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}

//   회원 전체 정보 조회
	public UserVO selectUser(int userNumber) {
//		받아온 userNumber가 같은 로우의 정보들 조회하는 쿼리문
		String query = "select userNumber, userId, userPassword, userName, userAge, userPhoneNumber, userStatus, userBirth from tbl_user "
				+ "where userNumber=?";

		int i = 0;
		UserVO userVO = new UserVO();// VO객체 생성
		try {
			connection = DBConnecter.getConnection();// 연결 객체 가져오기
			preparedStatement = connection.prepareStatement(query);// 쿼리문 전달
			preparedStatement.setInt(1, userNumber);// ? 채움
			resultSet = preparedStatement.executeQuery();// 조회된 것 저장

			if (resultSet.next()) {// 결과는 없거나 하나있거나 임
//				VO에 조회된 값들 저장
				userVO.setUserNumber(resultSet.getInt(++i));
				userVO.setUserId((resultSet.getString(++i)));
				userVO.setUserPassword(resultSet.getString(++i));
				userVO.setUserName(resultSet.getString(++i));
				userVO.setUserAge(resultSet.getInt(++i));
				userVO.setUserPhoneNumber(resultSet.getString(++i));
				userVO.setUserStatus(resultSet.getInt(++i));
				userVO.setUserBirth(resultSet.getString(++i));
			}
		} catch (SQLException e) {
			System.out.println("updateUser() 쿼리문 오류");
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
				}
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return userVO;// 초기화된 값이 들어있는 객체 리턴
	}

//   회원탈퇴
	public void delete(int userNumber) {
//		받아온 userNumber가 있는 로우의 userStatus를 변경 하는 쿼리문
		String query = "update tbl_user set userStatus=? where userNumber= ?";

		try {
			connection = DBConnecter.getConnection();// 연결 객체 가져오기
			preparedStatement = connection.prepareStatement(query);// 쿼리문 전달

			preparedStatement.setInt(1, DELETED_USER_CODE);// 탈퇴한 계정에 해당하는 정수로 값 변경
			preparedStatement.setInt(2, userNumber);// ? 채움
			preparedStatement.executeUpdate();// 조회된것도 아니기에 Update

		} catch (SQLException e) {
			System.out.println("delete() 쿼리문 오류");
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}

//   회원탈퇴 복구
	public void restore(int userNumber) {
//		받아온 userNumber가 포함된 로우의 userStatus 변경하는 쿼리문
		String query = "update tbl_user set userStatus=? where userNumber = ?";

		try {
			connection = DBConnecter.getConnection();// 연결 객체 가져오기
			preparedStatement = connection.prepareStatement(query);// 쿼리문 전달

			preparedStatement.setInt(1, RESTORED_USER_CODE);// 일반계정에 해당하는 정수로 변경(restored를 복구로 해석하니까 생긴 문제)
			preparedStatement.setInt(2, userNumber);// ? 채움
			preparedStatement.executeUpdate();// 단순 업데이트이기 때문에 Update

		} catch (SQLException e) {
			System.out.println("restore() 쿼리문 오류");
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}

	private boolean check(String userPhoneNumber) {
		boolean check = false;// 같은 번호로 3개이상 일때 false
//		받아온 핸드폰번호로 몇개의 아이디가 가입되어있는지 조회하는 쿼리문
		String query = "select count(userPhoneNumber) result from tbl_user where userPhoneNumber = ?";

		try {
			connection = DBConnecter.getConnection();// 연결 객체 가져오기
			preparedStatement = connection.prepareStatement(query);// 쿼리문 전달
			preparedStatement.setString(1, userPhoneNumber);// ?채우기
			resultSet = preparedStatement.executeQuery();// SELECT니까 Query 결과 테이블에 담음

			if (resultSet.next()) {
				check = resultSet.getInt("result") < 3;// 같은 핸드폰 번호로 2개이하로 가입되어있다면 true
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("login() 쿼리문 오류");
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
				}
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}

		return check;// 위에 조건에 따라 리턴
	}

//   핸드폰번호로 가입한 전체 회원 정보 조회
	public ArrayList<UserVO> findUsersByUserPhoneNumber(String userPhoneNumber) {
//		받아온 핸드폰번호가 있는 로우의 정보들 조회
		String query = "select userNumber, userId, userName, userAge, userPhoneNumber, userBirth, userStatus from tbl_user "
				+ "where userPhoneNumber = ?";
//		하나의 번호로 3개까지 만들 수 있기에 그거 다 저장할 ArrayList선언
		ArrayList<UserVO> users = new ArrayList<UserVO>();
		try {
			connection = DBConnecter.getConnection();// 연결 객체 가져오기
			preparedStatement = connection.prepareStatement(query);// 쿼리문 전달
			preparedStatement.setString(1, userPhoneNumber);// ? 채움
			resultSet = preparedStatement.executeQuery();// 조회결과 저장

			while (resultSet.next()) {
//				VO객체 생성
				UserVO userVO = new UserVO();
//				조회결과로 VO객체에 초기화
				userVO.setUserNumber(resultSet.getInt(1));
				userVO.setUserId(resultSet.getString(2));
				userVO.setUserName(resultSet.getString(3));
				userVO.setUserAge(resultSet.getInt(4));
				userVO.setUserPhoneNumber(resultSet.getString(5));
				userVO.setUserBirth(resultSet.getString(6));
				userVO.setUserStatus(resultSet.getInt(7));
//				ArrayList에 저장
				users.add(userVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
				}
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}

		return users;// 찾은 로우의 컬럼이 저장된 ArrayList넘겨줌
	}
}
