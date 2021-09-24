package day5.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import day3.dto.Customer;
import day5.mybatis.SqlSessionBean;

public class MybatisDao {
	private static MybatisDao dao = new MybatisDao();
	private MybatisDao() {;}
	public static MybatisDao getInstance() {
		return dao;
	}
	
	//1.새로운 코딩 : 가장 중요한것은 SqlSession 객체를 생성해야합니다.-> 메소드에서. 
	//  SqlSessionFactory 객체 가져오기
	SqlSessionFactory sqlFactory = SqlSessionBean.getSessionFactory();
	
	public List<Customer> selectAll(){
		List<Customer> list = null;
	//2. SqlSession 객체 생성하여 sql 실행하기.
		SqlSession mapper = sqlFactory.openSession();
		list = mapper.selectList("selectAll");   //"selectAllo" mapper 파일의 id값과 일치해야 합니다.
					//		ㄴ 이 메소드는 리턴타입이 List<Object>, select 조회결과가 n개 row 일때
		mapper.close();
		return list;
	}
	
	public Customer select(int idx) {
		Customer cus = null;
		SqlSession mapper = sqlFactory.openSession();
		cus = mapper.selectOne("selectOne", idx); 	//두번째 인자는 sql 실행에 필요한 파라미터입니다.
					//		ㄴ 이 메소드는 리턴타입이 Object, select 조회결과가 1개의 row 일때.
		mapper.close();
		return cus;
	}
	
	public int insert(Customer cus) {
	//	SqlSession mapper = sqlFactory.openSession(true);		//auto commit을 true, 기본값 false
		SqlSession mapper = sqlFactory.openSession();
		mapper.insert("insert", cus);		//auto commit?	n값 확인? 정상 insert 이면 1
		//파라미터의 cus의 idx 프로퍼티에 자동증가 컬럼값 저장?
		mapper.commit();
		mapper.close();
		return cus.getIdx();
	}
	
	public int delete(int idx) {
		SqlSession mapper = sqlFactory.openSession();
		int n = mapper.delete("delete",idx);
		mapper.commit();
		mapper.close();
		return n;
	}
	
	public int update(Customer cus) {
		SqlSession mapper = sqlFactory.openSession();
		int n = mapper.update("update",cus);
		mapper.commit();
		mapper.close();
		return n;
	}
	//결론 insert, delete, update 메소드는 return값이 있습니다. -> 실행한 결과 행의 갯수
	
}
