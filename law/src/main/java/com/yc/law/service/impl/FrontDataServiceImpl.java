package com.yc.law.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.law.entity.BasicContentPage;
import com.yc.law.mapper.FrontDataMapper;
import com.yc.law.service.FrontDataService;

@Service("frontDataService")
public class FrontDataServiceImpl implements FrontDataService {
	
	@Autowired
	private FrontDataMapper frontDataMapper;
	
	@Override
	public BasicContentPage getArtDataByPage(Integer pageSize, Integer pageNum,
			Integer partid, Integer usid) {
		return frontDataMapper.getArtDataByPage(pageSize,pageNum,partid,usid);
		
	}

}
