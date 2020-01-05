package com.java.experience.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.aop.HomeAspect;
import com.java.exfile.dto.ExFileDto;
import com.java.experience.dto.ExperienceDto;
import com.java.experience.dto.ExperienceMainDto;
import com.java.experience.dto.GuestHouseMainDto;
import com.java.exremain.dto.ExRemainDto;
import com.java.exreserve.dto.ExReserveDto;
import com.java.exreview.dto.ExReviewDto;
import com.java.exreview.dto.ExReviewListDto;
import com.java.file.dto.FileDto;
import com.java.guestdelluna.dto.PointAccumulate;
import com.java.guestdelluna.dto.PointUse;
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
	public int getReviewCnt(int exCode) {
		return sqlSessionTemplate.selectOne("dao.ExperienceMapper.reviewCnt",exCode);
	}

	@Override 
	public List<ExReviewListDto> getExReviewList(int startRow, int endRow, int exCode){ 
		Map<String, Integer> hMap = new HashMap<String, Integer>();
		hMap.put("startRow", startRow); 
		hMap.put("endRow", endRow);
		//hMap.put("memberCode", memberCode);
		hMap.put("exCode", exCode);
		
		return sqlSessionTemplate.selectList("dao.ExperienceMapper.reviewList",hMap);
	  }
// 후기	 
	@Override // 예약번호가 있는지 cnt
	public int reserveCodeCnt(int memberCode, int exCode) {
		Map<String, Integer> hMap = new HashMap<String, Integer>();
		hMap.put("memberCode", memberCode);
		hMap.put("exCode", exCode);
		return sqlSessionTemplate.selectOne("dao.ExperienceMapper.exReserveCodeCnt", hMap);
	}
	@Override
	public List<ExReserveDto> exReserveCode(int exCode, int memberCode) {
		Map<String, Integer> hMap = new HashMap<String, Integer>();
		hMap.put("memberCode", memberCode);
		hMap.put("exCode", exCode);
		return sqlSessionTemplate.selectList("dao.ExperienceMapper.exReserveCode", hMap);
	}
	@Override
	public int reviewChk(int exReserveCode) {
		return sqlSessionTemplate.selectOne("dao.ExperienceMapper.reviewChk", exReserveCode);
	}
	
	@Override
	public int writeReview(ExReviewDto exReviewDto) {
		return sqlSessionTemplate.insert("dao.ExperienceMapper.writeReview", exReviewDto);
	}
	@Override
	public ExReviewDto exReviewUpdate(int memberCode, int exReserveCode) {
		Map<String, Integer> hMap = new HashMap<String, Integer>();
		hMap.put("exCode",memberCode);
		hMap.put("exReserveCode",exReserveCode);
		
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
	
	// 체험페이지
	@Override
	public ExperienceDto exPage(int exCode) {
		return sqlSessionTemplate.selectOne("dao.ExperienceMapper.exPage", exCode);
	}
	@Override
	public List<ExFileDto> exPageImgList(int exCode) {
		Map<String, Integer> hMap = new HashMap<String, Integer>();
		hMap.put("exCode",exCode);
		
		return sqlSessionTemplate.selectList("dao.ExperienceMapper.exPageImgList", hMap);
	}
	@Override
	public MemberDto exHostInfo(int exCode) {
		return sqlSessionTemplate.selectOne("dao.ExperienceMapper.exHostInfo", exCode);
	}
	@Override
	public int exPayment(int exPeople, int exCode) {
		Map<String, Integer> hMap = new HashMap<String, Integer>();
		hMap.put("exPeople",exPeople);
		hMap.put("exCode",exCode);
		return sqlSessionTemplate.selectOne("dao.ExperienceMapper.exPayment", hMap);
	}
	@Override
	public int getPoint(String email) {
		return sqlSessionTemplate.selectOne("dao.ExperienceMapper.getPoint", email);
	}
	@Override
	public int insertExReserve(ExReserveDto exReserveDto) {
		return sqlSessionTemplate.insert("dao.ExperienceMapper.insertExReserve", exReserveDto);
	}
	@Override
	public int getExReserveCode(int exCode, int memberCode, Date exDate) {
		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("exCode",exCode);
		hMap.put("memberCode",memberCode);
		hMap.put("exDate",exDate);
		
		return sqlSessionTemplate.selectOne("dao.ExperienceMapper.getExReserveCode", hMap);
	}
	
	@Override
	public int pointUpdate(int memberCode, int plusPoint) {
		Map<String, Integer> hMap = new HashMap<String, Integer>();
		hMap.put("memberCode",memberCode);
		hMap.put("plusPoint",plusPoint);
		
		return sqlSessionTemplate.update("dao.ExperienceMapper.pointUpdate", hMap);
	}
	
	@Override
	public int resPointUp(PointAccumulate pointAccumulate) {
		return sqlSessionTemplate.insert("dao.ExperienceMapper.resPointUp", pointAccumulate);
	}
	
	@Override
	public int usePointUp(PointUse pointUse) {
		return sqlSessionTemplate.insert("dao.ExperienceMapper.usePointUp", pointUse);
	}
	
	// 달력 체험하는 인원 세기
	@Override
	public List<ExReserveDto> reserveList(int exCode, Date exDate) {
		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("exCode",exCode);
		hMap.put("exDate",exDate);
		
		return sqlSessionTemplate.selectList("dao.ExperienceMapper.reserveList", hMap);
	}
	// 하루에 수용 가능한 인원
	@Override
	public int getPeople(int exCode) {
		return sqlSessionTemplate.selectOne("dao.ExperienceMapper.getPeople",exCode);
	}
	// exRemainDto에서 exCode에 맞는 값 가져오기!!!
	@Override
	public List<ExRemainDto> getExRemain(int exCode) {
		return sqlSessionTemplate.selectList("dao.ExperienceMapper.getExRemain",exCode);
	}
	// 예약 확인시에 남은 체험 테이블에  데이터 넣기
	@Override
	public int insertExRemain(Date exDate, int exPeople, int exCode) {
		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("exDate",exDate);
		hMap.put("exPeople",exPeople);
		hMap.put("exCode",exCode);
		
		return sqlSessionTemplate.insert("dao.ExperienceMapper.insertExRemain",hMap);
	}
	
	// 메세지 보관함

	@Override
	public int message(int memberCode, String msgContent, Date msgDate, String msgCheck) {
		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("memberCode",memberCode);
		hMap.put("msgContent",msgContent);
		hMap.put("msgDate",msgDate);
		hMap.put("msgCheck",msgCheck);
		
		return sqlSessionTemplate.insert("dao.ExperienceMapper.message", hMap);
	}
	
	// 카카오 페이에서 개인 정보 가져오기
	@Override
	public MemberDto getMemberInfo(String email) {
		return sqlSessionTemplate.selectOne("dao.ExperienceMapper.getMemberInfo",email);
	}
	
	// 체험 메인 페이지
	@Override
	public List<ExperienceMainDto> searchMainEx() {
		// 최근 등록된 체험 정보를 가져와서
		List<ExperienceMainDto> exImgList = sqlSessionTemplate.selectList("dao.ExperienceMapper.searchMainEx");
		HomeAspect.logger.info(HomeAspect.logMsg+"exImgList: " +exImgList);
		
		// 체험 정보에 해당하는 이미지 파일 가져오기
		for(ExperienceMainDto exImgDto : exImgList) {
			List<ExFileDto> exFileList = sqlSessionTemplate.selectList("dao.searchMapper.getExImg",exImgDto.getExCode());
			exImgDto.setExFileList(exFileList);
		}
		return exImgList;
	}
	// 게하 메인 페이지
	@Override
	public List<GuestHouseMainDto> searchMain() {
		// 최근 등록된 게하 정보를 가져와서
		List<GuestHouseMainDto> houseImgList = sqlSessionTemplate.selectList("dao.ExperienceMapper.searchMainGh");
		HomeAspect.logger.info(HomeAspect.logMsg+"houseImgList: " +houseImgList);
		
		// 체험 정보에 해당하는 이미지 파일 가져오기
		for(GuestHouseMainDto ImgDto : houseImgList) {
			List<FileDto> FileList = sqlSessionTemplate.selectList("dao.searchMapper.getHouseImg",ImgDto.getHouseCode());
			ImgDto.setFileList(FileList);
		}
		return houseImgList;	
		}
	@Override
	public List<String> exDisableDates(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("dao.ExperienceMapper.exDisableDates", map);
	}

}
