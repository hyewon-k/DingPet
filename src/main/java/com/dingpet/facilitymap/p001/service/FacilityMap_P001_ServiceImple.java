package com.dingpet.facilitymap.p001.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dingpet.facilitymap.p001.dto.PlaceDTO;
import com.dingpet.facilitymap.p001.mapper.FacilityMap_P001_AttachMapper;
import com.dingpet.facilitymap.p001.mapper.FacilityMap_P001_Mapper;
import com.dingpet.facilitymap.p001.vo.FacilityMap_AttachVO;
import com.dingpet.facilitymap.p001.vo.FacilityMap_P001_ReplyVO;
import com.dingpet.facilitymap.p001.vo.FacilityMap_P001_VO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class FacilityMap_P001_ServiceImple implements FacilityMap_P001_Service {
	
	@Autowired
	private FacilityMap_P001_Mapper mapper;
	@Autowired
	private FacilityMap_P001_AttachMapper attachMapper;
	
	@Override
	public List<FacilityMap_P001_VO> getMediMap(PlaceDTO dto) {
		// 동물병원 맵 마킹
		return mapper.meditest(dto);
	}
	
	@Override
	public List<FacilityMap_P001_VO> getMediMap2(PlaceDTO dto) {
		// 약국 맵 마킹
		return mapper.medicenterSearch(dto);
	}
	
	@Override
	public List<FacilityMap_P001_VO> getCafeMap(PlaceDTO dto) {
		// 카페 맵 마킹
		return mapper.cafeSearch(dto);
	}
	@Override
	public List<FacilityMap_P001_VO> getRestaurantMap(PlaceDTO dto) {
		// 레스토랑 맵 마킹
		return mapper.restaurantSearch(dto);
	}
	@Override
	public List<FacilityMap_P001_VO> getHotelMap(PlaceDTO dto) {
		// 호텔 맵 마킹
		return mapper.hotelSearch(dto);
	}
	@Override
	public FacilityMap_P001_VO getMediCenter(int num) {
		// TODO Auto-generated method stub
		return mapper.readcenter(num);
	}
	// dog 플레이스 정보 가져오기
	@Override
	public FacilityMap_P001_VO getDogPlace(int num) {
		
		return mapper.dogcenter(num);
	}
	@Override
	public int getSeq() {
		// TODO Auto-generated method stub
		return mapper.getseq();
	}
	@Override
	public String getStarAvg(String site_id) {
		return mapper.getstaravg(site_id);
	}
	@Transactional
	@Override
	public void register(FacilityMap_P001_VO vo) {
		log.info("register....");
		// ------- 시퀀스 url 삽입 --------------
		int sitesq = mapper.getseq();
		log.info(vo.getSitesq());
		log.info(sitesq);
		String url = vo.getPlace_url()+sitesq;
		vo.setSite_id(sitesq);
		vo.setPlace_url(url);
		// -------===============--------------
		mapper.registerPlace(vo);
		log.info("Insert End...:"+vo);
		if (vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
			return;
		}

		vo.getAttachList().forEach(attach -> {
			attach.setSite_id(vo.getSite_id());
			attachMapper.insert(attach);
		});
	}
	@Transactional
	@Override
	public void reviewregister(FacilityMap_P001_ReplyVO vo) {
		log.info("REVIEW register....");
		// ------- site id - get --------------
		int sitesq = vo.getSite_id();
		log.info(sitesq);		
		// -------===============--------------
		log.info("DB Insert End...:"+vo);
		mapper.reviewRegister(vo);
	}
	
	@Override
	public List<FacilityMap_AttachVO> getAttachList(int site_id) {

		log.info("get Attach list by site_id : " + site_id);

		return attachMapper.findBySiteno(site_id);
	}

	@Override
	public void removeAttach(int site_id) {

		log.info("remove all attach files : ");

		attachMapper.deleteAll(site_id);
	}
	
}
