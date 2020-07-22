package poly.controller;

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

@Transactional
@Controller
@RequestMapping("/chitiet/")
public class ChiTietController {
	
	@Autowired
	SessionFactory sessionFactory;
	
	@RequestMapping("{picture}/{name}")
	public String index(ModelMap model, @PathVariable("picture") String picture,@PathVariable("name") String name){
		
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM MOVIE WHERE Picture = '" + picture +"'";
		Query query = session.createQuery(hql);
		Movie movie = (Movie) query.list().get(0);
		
		model.addAttribute("namemovie", movie.getName());
		model.addAttribute("link", movie.getTrailer());
		model.addAttribute("movie", movie.getMovieTitle());
		model.addAttribute("date", movie.getStartDay());
		model.addAttribute("content", movie.getContent());
		model.addAttribute("categoty", movie.getCategory().getName());
		model.addAttribute("name", name);
		return "chitiet/index";
	}
}
