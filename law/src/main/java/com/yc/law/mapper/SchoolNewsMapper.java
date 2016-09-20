package com.yc.law.mapper;

import java.util.List;

import com.yc.law.entity.LawContent;

public interface SchoolNewsMapper {

	int getSchoolNewsTotal(int partId);

	List<LawContent> findSchoolNewsByPages(int partId, int pageNum, int pageSize);

}
