package kr.or.multi.multiCommunity.dao;

import static kr.or.multi.multiCommunity.dao.MTDaoSqls.*;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import kr.or.multi.multiCommunity.dto.MT;
import kr.or.multi.multiCommunity.dto.Student;

@Repository
public class MTDao {
	 private NamedParameterJdbcTemplate jdbc;
	 private SimpleJdbcInsert insertAction;

	 private RowMapper<MT> rowMapper = BeanPropertyRowMapper.newInstance(MT.class);	 
	 
	 public MTDao(DataSource dataSource) {
		this.jdbc = new NamedParameterJdbcTemplate(dataSource);
		this.insertAction = new SimpleJdbcInsert(dataSource)
	                .withTableName("mt");
	}
	 
	//mt 신청 정보를 데이터베이스에 넣기.
	public int insert(MT mt) {
		SqlParameterSource params = new BeanPropertySqlParameterSource(mt);
		return insertAction.execute(params);
	}	
	
	//데이터베이스에서 모든 MT 정보를 가져오기
	public List<MT> selectAll(){
		return jdbc.query(SELECT_ALL, Collections.emptyMap(), rowMapper);
	}
	
	//200415
	//지금은 primary key를 폰 번호로 해둬서 이렇게 했지만 나중에 mt id로 바꾼다면 변경해야 함.
	public int deleteByPhoneNumber(String phoneNumber) {
		Map<String,?> params = Collections.singletonMap("phoneNumber", phoneNumber);
		return jdbc.update(DELETE_BY_PHONE_NUMBER, params);
	}
}
