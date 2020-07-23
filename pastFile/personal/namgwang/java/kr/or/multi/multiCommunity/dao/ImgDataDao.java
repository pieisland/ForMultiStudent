package kr.or.multi.multiCommunity.dao;

import static kr.or.multi.multiCommunity.dao.ImgDataDaoSqls.*;
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

import kr.or.multi.multiCommunity.dto.ImgData;

@Repository
public class ImgDataDao {
	private NamedParameterJdbcTemplate jdbc;
	private SimpleJdbcInsert insertAction;
	
	private RowMapper<ImgData> rowMapper = BeanPropertyRowMapper.newInstance(ImgData.class);
	
	public ImgDataDao(DataSource dataSource) {
		this.jdbc = new NamedParameterJdbcTemplate(dataSource);
		this.insertAction = new SimpleJdbcInsert(dataSource)
	                .withTableName("imgdata");
	}
	
	//MT 신청 이미지 업데이트.
	public int update(ImgData imgdata) {
		SqlParameterSource params = new BeanPropertySqlParameterSource(imgdata);
		return jdbc.update(UPDATE_MT_INFO_IMG, params);
	}
	
	//..이걸 쓰나요?
	public List<ImgData> selectAll(){
		return jdbc.query(SELECT_ALL, Collections.emptyMap(), rowMapper);
	}
	
	//이미지 이름 얻기.
	public ImgData getImgName(String imgid) {
		try {
			Map<String,?> params = Collections.singletonMap("imgId", imgid);
					
			return jdbc.queryForObject(SELECT_IMG_NAME_BY_IMG_ID, params, rowMapper);
		}catch(EmptyResultDataAccessException e) {
			return null;
		}
	}
}
