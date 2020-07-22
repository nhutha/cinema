package poly.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.entity.Movie;

@Controller
@RequestMapping("/home/")
@Transactional
public class HomeController {
	
	@Autowired
	SessionFactory sessionFactory;
	
	
	@RequestMapping("index")
	public String deault(ModelMap model){
		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd"); 
		String nowDate = ft.format(new Date());
		model.addAttribute("name", "Đăng nhập");
		
		Session session = sessionFactory.getCurrentSession();
		
		String hql = "FROM MOVIE WHERE StartDay > '"  + nowDate +"'";
		
		Query query = session.createQuery(hql);
		
		List<Movie> movieSapChieu = query.list();
		
		hql = "FROM MOVIE WHERE StartDay <= '" + nowDate + "' AND EndDay > '"  + nowDate + "'";
		query = session.createQuery(hql);
		
		List<Movie> movieDangChieu = query.list();
		
		model.addAttribute("dataDang", movieDangChieu);
		model.addAttribute("dataSap", movieSapChieu);
		
		return "home/index";
	}
	
	@RequestMapping("index/{name}")
	public String deaultName(ModelMap model,@PathVariable("name") String name){
		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd"); 
		String nowDate = ft.format(new Date());
		model.addAttribute("name", name);
		
		Session session = sessionFactory.getCurrentSession();
		
		String hql = "FROM MOVIE WHERE StartDay > '"  + nowDate +"'";
		
		Query query = session.createQuery(hql);
		
		List<Movie> movieSapChieu = query.list();
		
		hql = "FROM MOVIE WHERE StartDay <= '" + nowDate + "' AND EndDay > '"  + nowDate + "'";
		query = session.createQuery(hql);
		
		List<Movie> movieDangChieu = query.list();
		
		model.addAttribute("dataDang", movieDangChieu);
		model.addAttribute("dataSap", movieSapChieu);
		
		return "home/index";
	}
	
}
