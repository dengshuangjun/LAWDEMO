package com.yc.law.service.impl;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.law.entity.LawContent;
import com.yc.law.service.SchoolNewsService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class SchoolNewsServiceImplTest2 {


	@Autowired
	private SchoolNewsService schoolNewsService;
	
	
	@Test
	public void testFindSchoolNewsByPages() {
		List<LawContent> result = schoolNewsService.findSchoolNewsByPages(1009, 1, 6);
		assertEquals(result.size(),0);
	}

}
