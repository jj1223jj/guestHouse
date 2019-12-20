package com.java.experience.dao;

import java.util.List;

import com.java.exfile.dto.ExFileDto;
import com.java.experience.dto.ExperienceDto;
import com.java.exreview.dto.ExReviewDto;
import com.java.exreview.dto.ExReviewListDto;
import com.java.host.dto.HostDto;
import com.java.member.dto.MemberDto;

public interface ExperienceDao {

	public int subImgUpload(ExFileDto exFileDto);

	public int memberCode(String email);

	public int exHostRegister(ExperienceDto experienceDto);

	public int mainImgUpload(ExFileDto exFileDto);

	public int exCode();

	public List<HostDto> hostChkList(int memberCode);

	public int getReviewCnt();

	public List<ExReviewListDto> getExReviewList(int startRow, int endRow, int memberCode); 

	public int reserveCode(int memberCode);

	public int writeReview(ExReviewDto exReviewDto);

	public ExReviewDto exReviewUpdate(int memberCode);

	public int exReviewUpdateOk(ExReviewDto exReviewDto);

	public int exReviewDelete(int exReserveCode);

	public ExperienceDto exPage(int exCode);

	public List<ExFileDto> exPageImg(int exCode);

	public MemberDto exHostInfo(int memberCode);




}
