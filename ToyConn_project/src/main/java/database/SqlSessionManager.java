package database;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {

	static SqlSessionFactory factory = null;
	
	static {
		try {
			String resource = "database/mybatis-config.xml";
			InputStream stream = Resources.getResourceAsStream(resource);
			factory = new SqlSessionFactoryBuilder().build(stream);
			System.out.println(factory);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static SqlSessionFactory getSqlSession() {
		return factory;
	}
}
