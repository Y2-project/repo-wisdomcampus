package com.example.demo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
//扫描Mybatis的Mapper
@MapperScan(basePackages= {"com.example.demo"})
public class WisdomcompusApplication {

	public static void main(String[] args) {
		SpringApplication.run(WisdomcompusApplication.class, args);
	}
}
