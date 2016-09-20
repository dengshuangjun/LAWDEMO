package com.yc.law.service;

import java.util.List;

import com.yc.law.entity.LawContent;

public interface SchoolNewsService {

	int getSchoolNewsTotal(int partId);

	List<LawContent> findSchoolNewsByPages(int partId, int pageNum,
			int pageSize);

}
