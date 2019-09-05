package com.sundi.movie.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sundi.movie.dao.MovieMapper;
import com.sundi.movie.domain.Movie;
import com.sundi.movie.service.MovieService;
/**
 * 
    * @ClassName: MovieServiceImpl
    * @Description: 业务逻辑层 service
    * @author sundi
    * @date 2019年9月3日
    *
 */
@Service
public class MovieServiceImpl implements MovieService {

	@Resource
	private MovieMapper mapper;

	//列表查询
	@Override
	public List getMovieList(String mohu) {
		// TODO Auto-generated method stub
		return mapper.getMovieList(mohu);
	}
	//类型查询
	@Override
	public List getTypeList() {
		// TODO Auto-generated method stub
		return mapper.getTypeList();
	}
	//添加电影和中间表
	@Override
	public void addMovie(Movie m, int[] tids) {
		//添加电影表
		mapper.addMovie(m);
		//添加中间表
		if(tids!=null) {
			for (int tid : tids) {
				mapper.addCenter(m.getMid(),tid);
			}
		}
		
		
	}
	@Override
	public Movie getMovieByMid(Integer mid) {
		// TODO Auto-generated method stub
		return mapper.getMovieByMid(mid);
	}
	@Override
	public List getTypeByMid(Integer mid) {
		// TODO Auto-generated method stub
		return mapper.getTypeByMid(mid);
	}
	@Override
	public void updMovie(Movie m, int[] tids) {
		//修改电影表
		mapper.updMovie(m);
		//删除中间表
		mapper.delCenter(m.getMid());
		//添加中间表
		if(tids!=null) {
			for (int tid : tids) {
				mapper.addCenter(m.getMid(),tid);
			}
		}
		
	}
	//删除
	@Override
	public void delMovie(String mid) {
		//删除电影表
		mapper.delMovie(mid);
		//删除中间表
		mapper.delCenter2(mid);
	}
}
