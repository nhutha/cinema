package poly.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import poly.entity.Movie;
import poly.entity.Role;
import poly.entity.User;

@Controller
@Transactional
@RequestMapping("/login/")
public class LoginController {
	@Autowired
	SessionFactory sessionFactory;

	@RequestMapping("index")
	public String index() {
		return "login/index";
	}
	
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
	
	@RequestMapping(value = "dangky", method = RequestMethod.POST)
	public String dangky(ModelMap model,HttpServletRequest request){
		 
		String fullname = request.getParameter("fullName");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String birthDay = request.getParameter("birthDay");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		
		
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd"); 
		String nowDate = ft.format(new Date());
		String hql = "FROM MOVIE WHERE StartDay > '"  + nowDate +"'";
		
		Query query = session.createQuery(hql);
		
		List<Movie> movieSapChieu = query.list();
		if(!checkUser(email)){
			hql = "FROM MOVIE WHERE StartDay <= '" + nowDate + "' AND EndDay > '"  + nowDate + "'";
			query = session.createQuery(hql);
			
			List<Movie> movieDangChieu = query.list();
			
			model.addAttribute("dataDang", movieDangChieu);
			model.addAttribute("dataSap", movieSapChieu);
			model.addAttribute("name", "Đăng nhập");
			model.addAttribute("styledangky", "display: block;");
			model.addAttribute("message2", "Email đã được đăng ký");
			return "home/index";
			
		}
		if(!email.matches("\\w+@([a-z]+\\.[a-z]+)((.[a-z])*)")){
			
			
			hql = "FROM MOVIE WHERE StartDay <= '" + nowDate + "' AND EndDay > '"  + nowDate + "'";
			query = session.createQuery(hql);
			
			List<Movie> movieDangChieu = query.list();
			
			model.addAttribute("dataDang", movieDangChieu);
			model.addAttribute("dataSap", movieSapChieu);
			model.addAttribute("name", "Đăng nhập");
			model.addAttribute("styledangky", "display: block;");
			model.addAttribute("message2", "Email không đúng định dạng");
			return "home/index";
		}
		User user  = new User();
		user.setAddress(address);
		Date date = new Date();
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
		role.setId(1);
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
		return "login/index";
	}

	@RequestMapping(value = "dangnhap", method = RequestMethod.POST)
	public String dangNhap(ModelMap model, @RequestParam("your_email") String email,
			@RequestParam("password") String password) {
			
			Session session = sessionFactory.getCurrentSession();

			String hql = "FROM USERS WHERE Email = '" + email + "' AND Password = '" + password + "'";

			Query query = session.createQuery(hql);

			if(!email.matches("\\w+@([a-z]+\\.[a-z]+)((.[a-z])*)")){
				SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd"); 
				String nowDate = ft.format(new Date());
				hql = "FROM MOVIE WHERE StartDay > '"  + nowDate +"'";
				
				query = session.createQuery(hql);
				
				List<Movie> movieSapChieu = query.list();
				
				hql = "FROM MOVIE WHERE StartDay <= '" + nowDate + "' AND EndDay > '"  + nowDate + "'";
				query = session.createQuery(hql);
				
				List<Movie> movieDangChieu = query.list();
				
				model.addAttribute("dataDang", movieDangChieu);
				model.addAttribute("dataSap", movieSapChieu);
				model.addAttribute("name", "Đăng nhập");
				model.addAttribute("styledangnhap", "display: block;");
				model.addAttribute("message", "Email không đúng định dạng");
				return "home/index";
			}
			List<User> user = query.list();
			if(user.size() > 0){
				if(user.get(0).getRole().getId() == 1){
					model.addAttribute("name", user.get(0).getFullName());
					return "admin/index";
				}
				SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd"); 
				String nowDate = ft.format(new Date());
				
				
				hql = "FROM MOVIE WHERE StartDay > '"  + nowDate +"'";
				
				query = session.createQuery(hql);
				
				List<Movie> movieSapChieu = query.list();
				
				hql = "FROM MOVIE WHERE StartDay <= '" + nowDate + "' AND EndDay > '"  + nowDate + "'";
				query = session.createQuery(hql);
				
				List<Movie> movieDangChieu = query.list();
				
				model.addAttribute("dataDang", movieDangChieu);
				model.addAttribute("dataSap", movieSapChieu);
				model.addAttribute("name", user.get(0).getFullName());
				return "home/index";
			}else{
				SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd"); 
				String nowDate = ft.format(new Date());
				hql = "FROM MOVIE WHERE StartDay > '"  + nowDate +"'";
				
				query = session.createQuery(hql);
				
				List<Movie> movieSapChieu = query.list();
				
				hql = "FROM MOVIE WHERE StartDay <= '" + nowDate + "' AND EndDay > '"  + nowDate + "'";
				query = session.createQuery(hql);
				
				List<Movie> movieDangChieu = query.list();
				
				model.addAttribute("dataDang", movieDangChieu);
				model.addAttribute("dataSap", movieSapChieu);
				model.addAttribute("name", "Đăng nhập");
				model.addAttribute("styledangnhap", "display: block;");
				model.addAttribute("message", "Sai email hoặc mật khẩu");
				return "home/index";
			}
	}
}
