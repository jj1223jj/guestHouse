package com.java.experience.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.exfile.dto.ExFileDto;
import com.java.experience.dto.ExperienceDto;
import com.java.exreview.dto.ExReviewDto;
import com.java.host.dto.HostDto;

@Component
public class ExperienceDaoImp implements ExperienceDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int subImgUpload(ExFileDto exFileDto) {
		
		return sqlSessionTemplate.insert("dao.ExperienceMapper.subImgUpload", exFileDto);
	}
	@Override
	public int memberCode(String email) {
		return sqlSessionTemplate.selectOne("dao.ExperienceMapper.memberCode", email);
	}
	@Override
	public int exHostRegister(ExperienceDto experienceDto) {
		return sqlSessionTemplate.insert("dao.ExperienceMapper.exHostRegister", experienceDto);
	}
	@Override
	public int mainImgUpload(ExFileDto exFileDto) {
		return sqlSessionTemplate.insert("dao.ExperienceMapper.exMainImgUpload",exFileDto);
	}
	@Override
	public int exCode() {
		return sqlSessionTemplate.selectOne("dao.ExperienceMapper.exCode");
	}
	
	@Override
	public List<HostDto> hostChkList(int memberCode) {
		return sqlSessionTemplate.selectList("dao.ExperienceMapper.hostChkList",memberCode);
	}
	@Override
	public int getReviewCnt() {
		return sqlSessionTemplate.selectOne("dao.ExperienceMapper.reviewCnt");
	}
	@Override
	public List<ExReviewDto> getExReviewList(int startRow, int endRow) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.ExperienceMapper.reviewList");
	}
	@Override
	public int writeReview(ExReviewDto exReviewDto) {
		return sqlSessionTemplate.insert("dao.ExperienceMapper.writeReview");
	}
}
