package kr.or.multi.multiCommunity.dao;

import static kr.or.multi.multiCommunity.dao.AdminDaoSqls.*;

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

import org.springframework.dao.EmptyResultDataAccessException;

import kr.or.multi.multiCommunity.dto.Admin;
import kr.or.multi.multiCommunity.dto.Locker;
import java.sql.Timestamp;

@Repository
public class AdminDao {
	private NamedParameterJdbcTemplate jdbc;
	private SimpleJdbcInsert insertAction;
	
	private RowMapper<Admin> rowMapper = BeanPropertyRowMapper.newInstance(Admin.class);

	//이게 꼭 있어야 데이터베이스 사용 가능.
	 public AdminDao(DataSource dataSource) {
		this.jdbc = new NamedParameterJdbcTemplate(dataSource);
		this.insertAction = new SimpleJdbcInsert(dataSource)
	                .withTableName("admin");
	}

	//관리자가 관리하는 정보 업데이트.
	public int update(Admin admin) {
		SqlParameterSource params = new BeanPropertySqlParameterSource(admin);
		return jdbc.update(UPDATE, params);
	}

	//따라했어여.. https://www.edwith.org/boostcourse-web/lecture/20661/
	//아마.. MT 상세정보나 사물함 신청 날짜 정보 가져오는 걸로 기억해요. 이름을 이렇게 지어두니까 알아먹기 힘들잖아..
	public Admin getAdminInfo(String area) {
		try {
			Map<String,?> params = Collections.singletonMap("area", area);
			return jdbc.queryForObject(SELECT_ALL, params, rowMapper);
		}catch(EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	//안해도 됨.
	public int updateDatetime(String area, Timestamp t1, Timestamp t2) {
		return 1;
	}
}
