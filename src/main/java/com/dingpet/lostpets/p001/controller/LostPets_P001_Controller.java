package com.dingpet.lostpets.p001.controller;

import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dingpet.lostpets.p001.vo.Criteria;
import com.dingpet.lostpets.p001.vo.LostPets_P001_VO;

public interface LostPets_P001_Controller {

	//목록 조회
	public void list(Model model);
	//public void list(Criteria cri, Model model);
	
	//글 조회
	public void view(String board_id, Criteria cri, Model model);
	
	//글 작성
	public String write(Map<String, Object> writeMap, MultipartHttpServletRequest uploadFile, RedirectAttributes rttr) throws Exception;
	
	//글 수정
	public String modify(LostPets_P001_VO lostVO, Criteria cri, RedirectAttributes rttr);

	//글 삭제
	public String delete(String board_id, String dog_id, Criteria cri, RedirectAttributes rttr);

}