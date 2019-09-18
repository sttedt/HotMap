package com.hot.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {

	@Autowired 
	SqlSessionTemplate sessionTemplate;
	
	public int joinInsert(Map<String, Object> map) {
		return sessionTemplate.insert("member.joinInsert", map);
		
	}
	
	public int joinSelect(Map<String, Object> map) {
		return sessionTemplate.selectOne("member.joinSelect", map);
		
	}
}
