package com.yc.law.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.law.entity.LawContent;
import com.yc.law.mapper.SchoolNewsMapper;
import com.yc.law.mapper.WaveNewsMapper;
import com.yc.law.service.SchoolNewsService;

@Service("schoolNewsService")
public class SchoolNewsServiceImpl implements SchoolNewsService{
	
	@Autowired
	private SchoolNewsMapper schoolNewsMapper;

	@Override
	public int getSchoolNewsTotal(int partId) {
		return schoolNewsMapper.getSchoolNewsTotal(partId);
	}

	@Override
	public List<LawContent> findSchoolNewsByPages(int partId, int pageNum,
			int pageSize) {
		return schoolNewsMapper.findSchoolNewsByPages(partId,pageNum,pageSize);
	}

}
