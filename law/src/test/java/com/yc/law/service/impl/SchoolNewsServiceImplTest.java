package com.yc.law.service.impl;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.law.service.BackUserService;
import com.yc.law.service.SchoolNewsService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class SchoolNewsServiceImplTest {
	
	@Autowired
	private SchoolNewsService schoolNewsService;

	@Test
	public void testGetSchoolNewsTotal() {
		int result = schoolNewsService.getSchoolNewsTotal(1009);
		assertEquals(result,0);
	}

}
