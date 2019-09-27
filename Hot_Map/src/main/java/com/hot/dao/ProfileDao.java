package com.hot.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProfileDao {
	@Autowired
	SqlSessionTemplate ss;
	
	public Map<String, Object> profileOne(String mem_id) {
		return ss.selectOne("profile.profileOne", mem_id);
	}

}
