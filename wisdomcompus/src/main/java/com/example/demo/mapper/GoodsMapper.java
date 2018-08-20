package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.example.demo.pojo.Goods;

public interface GoodsMapper {

	//@Select("select * from Goods")
	public List<Goods> selectAll();
}
