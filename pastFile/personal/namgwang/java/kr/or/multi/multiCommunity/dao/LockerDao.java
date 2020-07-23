package kr.or.multi.multiCommunity.dao;

import javax.sql.DataSource;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import kr.or.multi.multiCommunity.dto.Locker;

import static kr.or.multi.multiCommunity.dao.LockerDaoSqls.*;

@Repository
public class LockerDao {
	 private NamedParameterJdbcTemplate jdbc;
	 private SimpleJdbcInsert insertAction;

	 private RowMapper<Locker> rowMapper = BeanPropertyRowMapper.newInstance(Locker.class);
	 
	 public LockerDao(DataSource dataSource) {
		this.jdbc = new NamedParameterJdbcTemplate(dataSource);
		this.insertAction = new SimpleJdbcInsert(dataSource)
	                .withTableName("locker");
	}
	 
	//사물함 신청 정보 저장.
	public int insert(Locker locker) {
		SqlParameterSource params = new BeanPropertySqlParameterSource(locker);
		return insertAction.execute(params);
	}	
	
	//사물함 신청 정보 모두 가져오기.
	public List<Locker> selectAll(){
		return jdbc.query(SELECT_ALL, Collections.emptyMap(), rowMapper);
	}
	
	//200411
	//사물함 번호로 사물함 신청 정보 삭제하기.
	public int deleteById(Integer lockerid) {
		Map<String,?> params = Collections.singletonMap("lockerId", lockerid);
		return jdbc.update(DELETE_BY_LOCKER_ID, params);
	}
}
