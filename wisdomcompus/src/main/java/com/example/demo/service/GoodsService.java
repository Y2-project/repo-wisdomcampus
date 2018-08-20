package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.GoodsMapper;
import com.example.demo.pojo.Goods;

@Service
public class GoodsService {
	
	@Autowired
	private GoodsMapper goodsMapper;
	
	public List<Goods> selectAll(){
		return this.goodsMapper.selectAll();
	}
}
