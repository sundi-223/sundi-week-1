package com.sundi.movie.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sundi.movie.domain.Movie;

public interface MovieMapper {
	//列表查询
	List getMovieList(@Param("mohu")String mohu);
	//查询类型
	List getTypeList();
	//添加电影表
	void addMovie(Movie m);
	//添加中间表
	void addCenter(@Param("mid")Integer mid, @Param("tid")int tid);
	//修改电影回显
	Movie getMovieByMid(@Param("mid")Integer mid);
	//修改电影类型回显
	List getTypeByMid(@Param("mid")Integer mid);
	//修改电影表
	void updMovie(Movie m);
	//删除中间表
	void delCenter(@Param("mid")Integer mid);
	//删除电影表
	void delMovie(@Param("mid")String mid);
	//删除中间表2
	void delCenter2(@Param("mid")String mid);

}
