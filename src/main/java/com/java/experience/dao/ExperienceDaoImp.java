package com.java.experience.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.exfile.dto.ExFileDto;
import com.java.experience.dto.ExperienceDto;
import com.java.exreview.dto.ExReviewDto;
import com.java.exreview.dto.ExReviewListDto;
import com.java.host.dto.HostDto;
import com.java.member.dto.MemberDto;

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

	@Override public List<ExReviewListDto> getExReviewList(int startRow, int endRow, int memberCode){ 
		Map<String, Integer> hMap = new HashMap<String, Integer>();
		hMap.put("startRow", startRow); 
		hMap.put("endRow", endRow);
		hMap.put("memberCode", memberCode);
	  
		return sqlSessionTemplate.selectList("dao.ExperienceMapper.reviewList",hMap);
	  }
	 
	@Override
	public int reserveCode(int memberCode) {
		return sqlSessionTemplate.selectOne("dao.ExperienceMapper.exReserveCode", memberCode);
	}
	@Override
	public int writeReview(ExReviewDto exReviewDto) {
		return sqlSessionTemplate.insert("dao.ExperienceMapper.writeReview", exReviewDto);
	}
	@Override
	public ExReviewDto exReviewUpdate(int memberCode) {
		return sqlSessionTemplate.selectOne("dao.ExperienceMapper.exReviewUpdate", memberCode);
	}
	@Override
	public int exReviewUpdateOk(ExReviewDto exReviewDto) {
		return sqlSessionTemplate.update("dao.ExperienceMapper.exReviewUpdateOk", exReviewDto);
	}
	@Override
	public int exReviewDelete(int exReserveCode) {
		return sqlSessionTemplate.delete("dao.ExperienceMapper.exReviewDelete", exReserveCode);
	}
	@Override
	public ExperienceDto exPage(int exCode) {
		return sqlSessionTemplate.selectOne("dao.ExperienceMapper.exPage", exCode);
	}
	@Override
	public List<ExFileDto> exPageImg(int exCode) {
		return sqlSessionTemplate.selectList("dao.ExperienceMapper.exPageImg", exCode);
	}
	@Override
	public MemberDto exHostInfo(int memberCode) {
		return sqlSessionTemplate.selectOne("dao.ExperienceMapper.exHostInfo", memberCode);
	}
}
