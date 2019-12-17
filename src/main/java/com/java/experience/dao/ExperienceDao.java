package com.java.experience.dao;

import java.util.List;

import com.java.exfile.dto.ExFileDto;
import com.java.experience.dto.ExperienceDto;
import com.java.exreview.dto.ExReviewDto;
import com.java.host.dto.HostDto;

public interface ExperienceDao {

	public int subImgUpload(ExFileDto exFileDto);

	public int memberCode(String email);

	public int exHostRegister(ExperienceDto experienceDto);

	public int mainImgUpload(ExFileDto exFileDto);

	public int exCode();

	public List<HostDto> hostChkList(int memberCode);

	public int getReviewCnt();

	public List<ExReviewDto> getExReviewList(int startRow, int endRow);

	public int writeReview(ExReviewDto exReviewDto);

}
