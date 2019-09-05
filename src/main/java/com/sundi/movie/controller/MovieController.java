package com.sundi.movie.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sundi.movie.domain.Movie;
import com.sundi.movie.service.MovieService;

/**
 * 
    * @ClassName: MovieController
    * @Description: 持久层 电影请求
    * @author sundi
    * @date 2019年9月3日
    *
 */
@Controller
public class MovieController {

	@Resource
	private MovieService service;
	
	/**
	 * 
	    * @Title: getMovieList
	    * @Description: 查询列表
	    * @param @param m model域对象
	    * @param @param mohu 模糊条件
	    * @param @param pageNum  分页的当前页
	    * @param @return    参数
	    * @return String    返回类型
	    * @throws
	 */
	@RequestMapping("selects")
	public String getMovieList(Model m,@RequestParam(defaultValue="")String mohu,
			@RequestParam(defaultValue="1")int pageNum) {
		PageHelper.startPage(pageNum, 3);
		List list = service.getMovieList(mohu);
		PageInfo info = new PageInfo(list);
		m.addAttribute("info", info);
		m.addAttribute("list", list);
		m.addAttribute("mohu", mohu);
		List type = service.getTypeList();
		m.addAttribute("type", type);
		return "list";
		
	}
	//添加页面追加复选框
	@RequestMapping("toAdd")
	public String getTypeList(Model m){
		
		List type = service.getTypeList();
		m.addAttribute("type", type);
		return "add";
		
	}
	
	//添加
	@RequestMapping("add")
	@ResponseBody
	public boolean addMovie(Movie m,int[] tids){
		
		 try {
			service.addMovie(m,tids);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}
	
	//修改页面回显
	@RequestMapping("toUpd")
	@ResponseBody
	public Object toUpd(Integer mid){
		//根据mid查询电影
		Movie mo = service.getMovieByMid(mid);
		//查询全部复选框
		List type = service.getTypeList();
		//根据mid查询已拥有类型
		List type1 = service.getTypeByMid(mid);
		Map m = new HashMap();
		m.put("mo", mo);
		m.put("type", type);
		m.put("type1", type1);
		return m;
		
	}
	
	//修改
	@RequestMapping("upd")
	@ResponseBody
	public boolean updMovie(Movie m,int[] tids){
		
		 try {
			service.updMovie(m,tids);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}
	//删除和批量删除
	@RequestMapping("del")
	@ResponseBody
	public boolean del(String mid){
		try {
			service.delMovie(mid);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}
}
