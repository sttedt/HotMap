package com.hot.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hot.dao.ProfileDao;
@Service
public class ProfileService {
@Autowired
ProfileDao pd;
	public Map<String, Object> profile(String mem_id) {
		return pd.profileOne(mem_id);
	}

}
