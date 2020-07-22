package poly.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import poly.entity.Category;
import poly.entity.Movie;
import poly.entity.Role;
import poly.entity.ShowTime;
import poly.entity.User;

@Controller
@Transactional
@RequestMapping("/admin/")
public class AdminController {
	@Autowired
	SessionFactory sessionFactory;

	public boolean checkUser(String email){
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM USERS WHERE Email = '" + email + "'";
		Query query =  session.createQuery(hql);
		List<User> lsUser =  query.list();
		if(lsUser.size() > 0){
			return false;
		}
		return true;
	}
	public List<User> getUsers(){
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM USERS";
		Query query = session.createQuery(hql);
		List<User> users = query.list();
		return users;
	}
	
	@RequestMapping("user/{name}")
	public String user(ModelMap model,@PathVariable("name") String name){
		model.addAttribute("name", name);
		List<User> users = getUsers();
		model.addAttribute("users", users);
		return "admin/listUser";
	}
	
	@RequestMapping("user/edit/{name}/{email}")
	public String edit(HttpServletRequest request,ModelMap model,@PathVariable("email") String email,@PathVariable("name") String name){
		
		model.addAttribute("name", name);
		
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		String hql = "FROM USERS WHERE Email = '" + email + "'";
		Query query = session.createQuery(hql);
		List<User> users = query.list();
		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd"); 
		User user = users.get(0);
		String fullname = request.getParameter("fullName");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String birthDay = request.getParameter("birthDay");
		String newEmail = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		user.setAddress(address);
		Date date = new Date();
	
		try{
			date = ft.parse(birthDay);
		}catch(Exception ex){
			
		}
		user.setBirthDay(date);
		user.setAvatar("user");
		user.setEmail(newEmail);
		user.setFullName(fullname);
		user.setPhone(phone);
		user.setPassword(password);
		if(!checkUser(email)){
			model.addAttribute("message", "Email đã được đăng ký");
			model.addAttribute("style", "display:block;");
			model.addAttribute("name", name);
			List<User> lsusers = getUsers();
			model.addAttribute("users", lsusers);
			return "admin/listUser";
		}
		if(!email.matches("\\w+@([a-z]+\\.[a-z]+)((.[a-z])*)")){
			model.addAttribute("message", "Email không đúng định dạng");
			model.addAttribute("style", "display:block;");
			model.addAttribute("name", name);
			List<User> lsusers = getUsers();
			model.addAttribute("users", lsusers);
			return "admin/listUser";
		}
		try{
			session.update(user);
			t.commit();
		}catch(Exception ex){
			t.rollback();
		}finally {
			session.close();
		}
		
		List<User> lsUser = getUsers();
		model.addAttribute("users", lsUser);
		return "admin/listUser";
	}
	@RequestMapping("user/editGetData/{name}/{email}")
	public String editGetData(ModelMap model,@PathVariable("email") String email,@PathVariable("name") String name){
		
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM USERS WHERE Email = '" + email + "'";
		Query query = session.createQuery(hql);
		List<User> users = query.list();
		User user = users.get(0);
		
		model.addAttribute("name", name);
		model.addAttribute("style", "display: block;");
		
		model.addAttribute("email", user.getEmail());
		
		model.addAttribute("fullName", user.getFullName());
		
		model.addAttribute("phone", user.getPhone());
		
		model.addAttribute("password", user.getPassword());
		
		model.addAttribute("address", user.getAddress());
		
		model.addAttribute("birthDay", user.getBirthDay());
		
		List<User> lsUsers = getUsers();
		model.addAttribute("users", lsUsers);
		return "admin/listUser";
	}
	@RequestMapping("user/delete/{name}/{email}")
	public String delete(ModelMap model,@PathVariable("email") String email, @PathVariable("name") String name){
		
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		String hql = "FROM USERS WHERE Email = '" + email + "'";
		Query query = session.createQuery(hql);
		List<User> users = query.list();
		User user = users.get(0);
		try{
			session.delete(user);
			t.commit();
			
		}catch(Exception ex){
			t.rollback();
		}finally {
		}
		model.addAttribute("name", name);
		List<User> lsUser = getUsers();
		model.addAttribute("users", lsUser);
		return "admin/listUser";
	}
	
	@RequestMapping("user/them/{name}")
	public String them(ModelMap model,@PathVariable("name") String name,HttpServletRequest request){
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		String fullname = request.getParameter("fullName");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String birthDay = request.getParameter("birthDay");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd"); 
		User user  = new User();
		user.setAddress(address);
		Date date = new Date();
		if(!checkUser(email)){
			model.addAttribute("message1", "Email đã được đăng ký");
			model.addAttribute("stylelogin", "display:block;");
			model.addAttribute("name", name);
			List<User> users = getUsers();
			model.addAttribute("users", users);
			return "admin/listUser";
		}
		if(!email.matches("\\w+@([a-z]+\\.[a-z]+)((.[a-z])*)")){
			model.addAttribute("message1", "Email không đúng định dạng");
			model.addAttribute("stylelogin", "display:block;");
			model.addAttribute("name", name);
			List<User> users = getUsers();
			model.addAttribute("users", users);
			return "admin/listUser";
		}
		try{
			date = ft.parse(birthDay);
		}catch(Exception ex){
			
		}
		user.setBirthDay(date);
		user.setAvatar("user");
		user.setEmail(email);
		user.setFullName(fullname);
		user.setPhone(phone);
		Role role = new Role();
		role.setId(2);
		user.setRole(role);
		user.setPassword(password);
		try{
			session.save(user);
			t.commit();
		}catch(Exception ex){
			t.rollback();
		}finally {
			session.close();
		}
		
		model.addAttribute("name", name);
		List<User> users = getUsers();
		model.addAttribute("users", users);
		return "admin/listUser";
	}

	@Autowired
	ServletContext context;
	
	@RequestMapping("movie/{name}")
	public String movie(ModelMap model, @PathVariable("name") String name){
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM MOVIE";
		Query  query = session.createQuery(hql);
		List<Movie> lsMovie = query.list();
		
		hql = "FROM CATEGORY";
		query = session.createQuery(hql);
		List<Category> lsCategory = query.list();
		
		model.addAttribute("name", name);
		model.addAttribute("movies", lsMovie);
		model.addAttribute("category", lsCategory);
		return "admin/listMovie";
	}
	
	@RequestMapping("movie/them/{name}")
	public String addMovie(ModelMap model,@PathVariable("name") String name,HttpServletRequest request,@RequestParam("picture") MultipartFile file){
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		String nameMovie = request.getParameter("nameMovie");
		String startDay = request.getParameter("startDay");
		String endDay = request.getParameter("endDay");
		String content = request.getParameter("content");
		String trailer = request.getParameter("trailer");
		String picture = file.getOriginalFilename();
		String text = picture.substring(0,picture.length() - 4);
		String category = request.getParameter("category");
		String path = "D:\\Phan mem\\lap trinh web\\worldSpace\\CINEMA\\WebContent\\image\\" + file.getOriginalFilename();
		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd"); 
		Date dateEnd = new Date();
		Date dateStart = new Date();
		try{
			dateEnd = ft.parse(endDay);
			dateStart = ft.parse(startDay);
			file.transferTo(new File(path));
			Movie movie =  new Movie();
			movie.setContent(content);
			movie.setEndDay(dateEnd);
			movie.setStartDay(dateStart);
			movie.setPicture(picture);
			movie.setMovieTitle(text);
			movie.setName(nameMovie);
			movie.setTrailer(trailer);
			Category temp = new Category();
			int id = Integer.parseInt(category.trim());
			temp.setId(id);
			movie.setCategory(temp);
			
			try{
				session.save(movie);
				t.commit();
				String hql = "FROM MOVIE";
				Query  query = session.createQuery(hql);
				List<Movie> lsMovie = query.list();
				
				hql = "FROM CATEGORY";
				query = session.createQuery(hql);
				List<Category> lsCategory = query.list();
				model.addAttribute("movies", lsMovie);
				model.addAttribute("category", lsCategory);
				model.addAttribute("name", name);
				
			}catch(Exception ex){
				t.rollback();
			}finally {
				session.close();
			}
		}catch(Exception ex){
			
		}	
		return "admin/listMovie";
	}
	
	@RequestMapping("movie/delete/{id}/{name}")
	public String deleteMovie(ModelMap model,@PathVariable("id") int  id,@PathVariable("name") String name ){
		
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		
		Movie movie = (Movie) session.get(Movie.class, id);
		
		try {
			session.delete(movie);
			t.commit();
			String hql = "FROM MOVIE";
			Query  query = session.createQuery(hql);
			List<Movie> lsMovie = query.list();
			
			hql = "FROM CATEGORY";
			query = session.createQuery(hql);
			List<Category> lsCategory = query.list();
			model.addAttribute("movies", lsMovie);
			model.addAttribute("category", lsCategory);
			model.addAttribute("name", name);
		} catch (Exception e) {
			t.rollback();
			// TODO: handle exception
		}finally {
			session.close();
		}
		return "admin/listMovie";
	}
	
	@RequestMapping("movie/editGetData/{id}/{name}")
	public String editGetDataMovie(ModelMap model,@PathVariable("id") int id, @PathVariable("name") String name){
		Session session = sessionFactory.getCurrentSession();
		
		Movie movie = (Movie) session.get(Movie.class, id);
		
		String picture = movie.getPicture();
		String path = "D:\\Phan mem\\lap trinh web\\worldSpace\\CINEMA\\WebContent\\image\\" + picture;
		model.addAttribute("nameMovie", movie.getName());
		model.addAttribute("startDay", movie.getStartDay());
		model.addAttribute("endDay", movie.getEndDay());
		model.addAttribute("content", movie.getContent());
		model.addAttribute("trailer", movie.getTrailer());
		model.addAttribute("name", name);
		model.addAttribute("dataCategory", movie.getCategory().getName());
		model.addAttribute("dataFile", path);
		String hql = "FROM MOVIE";
		Query  query = session.createQuery(hql);
		List<Movie> lsMovie = query.list();
		
		hql = "FROM CATEGORY";
		query = session.createQuery(hql);
		List<Category> lsCategory = query.list();
		model.addAttribute("movies", lsMovie);
		model.addAttribute("category", lsCategory);
		model.addAttribute("name", name);
		model.addAttribute("id", movie.getId());
		model.addAttribute("name", name);
		model.addAttribute("style", "display: block;");
		return "admin/listMovie";
	}
	
	@RequestMapping("movie/editMovie/{name}/{id}")
	public String editMovie(ModelMap model,@PathVariable("name") String name,@PathVariable("id") int id,HttpServletRequest request,@RequestParam("picture") MultipartFile file){
		
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		Movie movie = (Movie)session.get(Movie.class, id);
		
		String nameMovie = request.getParameter("nameMovie");
		String startDay = request.getParameter("startDay");
		String endDay = request.getParameter("endDay");
		String content = request.getParameter("content");
		String trailer = request.getParameter("trailer");
		String picture = file.getOriginalFilename();
		String text = picture.substring(0,picture.length() - 4);
		String category = request.getParameter("category");
		String path = "D:\\Phan mem\\lap trinh web\\worldSpace\\CINEMA\\WebContent\\image\\" + file.getOriginalFilename();
		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd"); 
		Date dateEnd = new Date();
		Date dateStart = new Date();
		try{
			dateEnd = ft.parse(endDay);
			dateStart = ft.parse(startDay);
			file.transferTo(new File(path));
			movie.setContent(content);
			movie.setEndDay(dateEnd);
			movie.setStartDay(dateStart);
			movie.setPicture(picture);
			movie.setMovieTitle(text);
			movie.setName(nameMovie);
			movie.setTrailer(trailer);
			Category temp = new Category();
			int idCategory = Integer.parseInt(category.trim());
			temp.setId(idCategory);
			movie.setCategory(temp);
			
			try{
				session.update(movie);
				t.commit();
				String hql = "FROM MOVIE";
				Query  query = session.createQuery(hql);
				List<Movie> lsMovie = query.list();
				
				hql = "FROM CATEGORY";
				query = session.createQuery(hql);
				List<Category> lsCategory = query.list();
				model.addAttribute("movies", lsMovie);
				model.addAttribute("category", lsCategory);
				model.addAttribute("name", name);
				
			}catch(Exception ex){
				t.rollback();
			}finally {
				session.close();
			}
		}catch(Exception ex){
			
		}	
		
		
		return "admin/listMovie";
	}
	@RequestMapping("showTime/{name}/{id}")
	public String getShowTime(ModelMap model,@PathVariable("name") String name,@PathVariable("id") int id){
		
		Session session = sessionFactory.getCurrentSession();
		Movie movie =(Movie)session.get(Movie.class,id);
		String hql= "FROM SHOWTIME s WHERE s.movie.Id = " + id;
		Query query = session.createQuery(hql);
		List<ShowTime> lsShowTime = query.list();
		model.addAttribute("showtime", lsShowTime);
		model.addAttribute("nameMovie", movie.getName());
		model.addAttribute("name", name);
		model.addAttribute("id",id);
		return "admin/showTime";
	}
	@RequestMapping("showTime/them/{name}/{id}")
	public String themShowTime(ModelMap model,@PathVariable("name") String name,HttpServletRequest request,@PathVariable("id") int id){
		
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		Movie movie = (Movie)session.get(Movie.class, id);
		ShowTime showTime = new ShowTime();
		
		String showDay = request.getParameter("showDay");
		String price = request.getParameter("price");
		String time = request.getParameter("time");
		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd"); 
		Date dateStart = new Date();
		try{
			dateStart = ft.parse(showDay);
			showTime.setPrice(Integer.parseInt(price.trim()));
			showTime.setShowDay(dateStart);
			showTime.setTime(time);
			showTime.setMovie(movie);
			session.save(showTime);
			t.commit();
			
			String hql= "FROM SHOWTIME s WHERE s.movie.Id = " + id;
			Query query = session.createQuery(hql);
			List<ShowTime> lsShowTime = query.list();
			model.addAttribute("showtime", lsShowTime);
			model.addAttribute("nameMovie", movie.getName());
			model.addAttribute("name", name);
			model.addAttribute("id",id);
			
		}catch(Exception ex){
			t.rollback();
		}finally {
			session.close();
		}
		return "admin/showTime";
	}
	@RequestMapping("showTime/editGetData/{name}/{id}")
	public String showTimeGetData(ModelMap model,@PathVariable("name") String name, @PathVariable("id") int id){
		Session session = sessionFactory.getCurrentSession();
		ShowTime showTime = (ShowTime)session.get(ShowTime.class, id);
		
		String hql= "FROM SHOWTIME s WHERE s.movie.Id = " + showTime.getMovie().getId();
		Query query = session.createQuery(hql);
		List<ShowTime> lsShowTime = query.list();
		model.addAttribute("showtime", lsShowTime);
		model.addAttribute("nameMovie", showTime.getMovie().getName());

		
		model.addAttribute("time", showTime.getTime());
		model.addAttribute("price", showTime.getPrice());
		model.addAttribute("showDay", showTime.getShowDay());
		model.addAttribute("id", showTime.getMovie().getId());
		model.addAttribute("idShowTime", id);
		model.addAttribute("name", name);
		model.addAttribute("style", "display: block;");
		return "admin/showTime";
	}
	
	@RequestMapping("showTime/edit/{name}/{id}")
	public String editShowTime(ModelMap model, @PathVariable("name") String name,@PathVariable("id") int id,HttpServletRequest request){
		
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		
		ShowTime showTime = (ShowTime)session.get(ShowTime.class, id);
		
		String showDay = request.getParameter("showDay");
		String price = request.getParameter("price");
		String time = request.getParameter("time");
		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd"); 
		Date dateStart = new Date();
		try{
			dateStart = ft.parse(showDay);
			showTime.setPrice(Integer.parseInt(price.trim()));
			showTime.setShowDay(dateStart);
			showTime.setTime(time);
			session.update(showTime);
			t.commit();
			String hql= "FROM SHOWTIME s WHERE s.movie.Id = " + showTime.getMovie().getId();
			Query query = session.createQuery(hql);
			List<ShowTime> lsShowTime = query.list();
			model.addAttribute("showtime", lsShowTime);
			model.addAttribute("nameMovie", showTime.getMovie().getName());
			model.addAttribute("idShowTime", showTime.getId());
			model.addAttribute("id", showTime.getMovie().getId());
		}catch(Exception ex){
			t.rollback();
		}finally {
			session.close();
		}
		
		model.addAttribute("name", name);
		return "admin/showTime"; 
	}
	@RequestMapping("showTime/delete/{name}/{id}")
	public String deleteShowTime(ModelMap model,@PathVariable("name") String name,@PathVariable("id") int id){
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		ShowTime showTime = (ShowTime)session.get(ShowTime.class, id);
		try{
			session.delete(showTime);
			t.commit();
			String hql= "FROM SHOWTIME s WHERE s.movie.Id = " + showTime.getMovie().getId();
			Query query = session.createQuery(hql);
			List<ShowTime> lsShowTime = query.list();
			model.addAttribute("showtime", lsShowTime);
			model.addAttribute("nameMovie", showTime.getMovie().getName());
			model.addAttribute("idShowTime", showTime.getId());
			model.addAttribute("id", showTime.getMovie().getId());
		}catch(Exception ex){
			t.rollback();
		}finally {
			session.close();
		}
		model.addAttribute("name", name);
		return "admin/showTime"; 
		
	}
}
