package com.sundi.movie.service;

import java.util.List;

import com.sundi.movie.domain.Movie;

public interface MovieService {
	//列表查询
	List getMovieList(String mohu);
	//查询类型
	List getTypeList();
	//添加
	void addMovie(Movie m, int[] tids);
	//修改电影回显
	Movie getMovieByMid(Integer mid);
	//修改电影类型回显
	List getTypeByMid(Integer mid);
	//修改
	void updMovie(Movie m, int[] tids);
	//删除
	void delMovie(String mid);
	
}
