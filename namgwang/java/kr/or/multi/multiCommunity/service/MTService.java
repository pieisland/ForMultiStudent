package kr.or.multi.multiCommunity.service;

import java.util.List;

import kr.or.multi.multiCommunity.dto.MT;

public interface MTService {
	public MT addMT(MT mt);
	public List<MT> getMTs();
	public int deleteMT(String phoneNumber);
}