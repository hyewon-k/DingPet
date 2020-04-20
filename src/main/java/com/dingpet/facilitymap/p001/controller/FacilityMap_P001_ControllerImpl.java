package com.dingpet.facilitymap.p001.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dingpet.facilitymap.p001.dto.PlaceDTO;
import com.dingpet.facilitymap.p001.service.FacilityMap_P001_Service;
import com.dingpet.facilitymap.p001.vo.FacilityMap_P001_VO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/facilitymap/p001/*")
@AllArgsConstructor
@Log4j
@Controller
public class FacilityMap_P001_ControllerImpl implements FacilityMap_P001_Controller{
	
	private FacilityMap_P001_Service service;
	
	@RequestMapping("/mylocation")
	public void mylocation(Model model) {
		
	}
	
	@RequestMapping(value="/facilityMap", method = {RequestMethod.GET})
	public void facilityMap(Model model) {
		
	}
	
	@GetMapping("/medicenterMap")
	@ResponseBody
	@Override
	public ResponseEntity<List<FacilityMap_P001_VO>> medicenterMap(PlaceDTO dto) {
		HttpHeaders responseHeaders = new HttpHeaders(); // 헤더변경 시 사용
		responseHeaders.add("Content-Type", "text/html; charset=utf-8"); 
		System.out.println("11111111111");
		log.info("====mediMap Method====");
		List<FacilityMap_P001_VO> list = service.getMediMap(dto);
		log.info(dto);
		log.info(service);
		String msg = "";
		boolean status = list.isEmpty();
		if (status) {
			msg = "fail";
		} else {
			msg = "success";
		}
		log.info(msg);
		log.info("====End Map Method====");
		return new ResponseEntity<>(list, HttpStatus.OK);	
	} // medicenter End
		
	@GetMapping("/mediMap2")
	@ResponseBody
	@Override
	public ResponseEntity<List<FacilityMap_P001_VO>> mediMap2(PlaceDTO dto) {
		HttpHeaders responseHeaders = new HttpHeaders(); // 헤더변경 시 사용
		responseHeaders.add("Content-Type", "text/html; charset=utf-8"); 
		log.info("====Map22 Method====");
		List<FacilityMap_P001_VO> data = service.getMediMap2(dto);
		log.info(dto);
		log.info(service);
		String msg = "";
		boolean status = data.isEmpty();
		if (status) {
			msg = "fail";
		} else {
			msg = "success";
		}
		log.info(msg);
		log.info("====End Map22 Method====");
		return new ResponseEntity<>(data, HttpStatus.OK);	
	} // mediMap End
	
	@RequestMapping(value="/register", method = {RequestMethod.GET})
	public void test(Model model) {
		
		model.addAttribute("register", "등록 페이지 입니다");
	}
	
	@RequestMapping(value="/register", method = {RequestMethod.POST})
	public String registerAction(Model model, FacilityMap_P001_VO vo, MultipartHttpServletRequest uploadFile) {
		log.info("========register 등록중====");
		log.info("register: " + vo);

		//---------------------------	사진 업로드 데이터 처리	---------------------------
					
					//String uploadFolder = "/home/testpic";
					String uploadFolder = "C:\\upload";
					
					
					String fileName = "";
					
					Iterator<String> files = uploadFile.getFileNames();
					
					while(files.hasNext()) {
						
						File saveFile;
						String filePath;
						String index = files.next();
						UUID placeimg_UUID = UUID.randomUUID();
						UUID site_UUID = UUID.randomUUID();

						MultipartFile mFile = uploadFile.getFile(index);
						fileName = mFile.getOriginalFilename();

						if(!fileName.equals("")) {

							if(index.equals("placePic")) {
								saveFile = new File(uploadFolder, placeimg_UUID.toString()+"placepic_"+fileName);
								filePath = saveFile.getPath();
								vo.setPlace_pic(filePath);
							}else {
								saveFile = new File(uploadFolder, site_UUID.toString()+"site_"+fileName);
								filePath = saveFile.getPath();
								vo.setSite_pic(filePath);
								//service.licenseInsert(vo);
							}
								
							try {
								mFile.transferTo(saveFile);
							} catch (Exception e) {
								// TODO: handle exception
								System.out.println("사진업로드 Exception " + e);
							}
						}
					}
		log.info("사진 업로드 완료");
		//---------------------------------------------------------------------------
		// ------- 시퀀스 url 삽입 --------------
		int sitesq = service.getSeq();
		log.info(vo.getSitesq());
		log.info(sitesq);
		String url = vo.getPlace_url()+sitesq;
		vo.setPlace_url(url);
		// -------===============--------------
		log.info("==========================");
		service.register(vo);


		return "/facilitymap/p001/facilityMap";
		}
	
	@RequestMapping("/infopage")
	public void facilityinfo(@RequestParam("place_num") int place_num, Model model) {
		System.out.println("1111111111111111111111111111111111111111111111111111111111111111111");
		model.addAttribute("infopage", "조회 페이지 입니다");
		model.addAttribute("sample", "Hello List");
		model.addAttribute("info", service.getMediCenter(place_num));
		
	}
	
	
}
