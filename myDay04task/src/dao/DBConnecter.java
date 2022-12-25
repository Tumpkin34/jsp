package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnecter {

	public static Connection getConnection() {
		Connection connection = null;
		try {
//			연결에 필요한 정보
			String url = "jdbc:mysql://localhost:3306/customer";
			String username = "root";
			String password = "1234";

//			메모리에 드라이버 할당
			Class.forName("com.mysql.cj.jdbc.Driver");

//			정보를 입력하여 연결 객체 가져오기
			connection = DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return connection;
	}

}
