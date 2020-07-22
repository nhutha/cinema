package poly.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.entity.Chair;
import poly.entity.ShowTime;
import poly.entity.Ticket;
import poly.entity.User;

@Controller
@RequestMapping("/booking/")
@Transactional
public class BookingController {

	@Autowired
	SessionFactory sessionFactory;
	
	@Autowired
	JavaMailSender mailer;
	
	@RequestMapping("{namemovie}/{name}")
	public String index(ModelMap model,@PathVariable("name") String name, @PathVariable("namemovie") String namemovie){
		
		Session session = sessionFactory.getCurrentSession();
		
		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd"); 
		String currentDay = java.time.LocalDate.now().toString();
		SimpleDateFormat formatter = new SimpleDateFormat("HH:mm");  
		Date date = new Date();  
		String time = formatter.format(date);
		String hql = "FROM SHOWTIME s WHERE s.ShowDay = '"+ currentDay + "' AND s.movie.Name = '" + namemovie+"' AND s.Time >= '" +time+"'" ;
		Query query =  session.createQuery(hql);
		List<ShowTime> lsShowTime = query.list();
		model.addAttribute("namemovie", namemovie);
		model.addAttribute("namePeople", name);
		model.addAttribute("showtime", lsShowTime);
		if(lsShowTime.size() > 0)
			model.addAttribute("money", lsShowTime.get(0).getPrice());
		return "booking/index";
	}
	
	
	@RequestMapping("{namemovie}/{time}/{date}/{name}")
	public String loadChairByDate(ModelMap model,@PathVariable("name") String name ,@PathVariable("namemovie") String namemovie,@PathVariable("time") String time, @PathVariable("date") String date){
		
		Session session = sessionFactory.getCurrentSession();
		
	
		String currentDay = date;

		SimpleDateFormat formatter = new SimpleDateFormat("HH:mm");  
		Date dateNow = new Date();  
		String timeNow = formatter.format(dateNow);
		String hql = "FROM SHOWTIME s WHERE s.ShowDay = '"+ currentDay + "' AND s.movie.Name = '" + namemovie+"' AND s.Time >= '" +timeNow+"'" ;
		Query query =  session.createQuery(hql);
		List<ShowTime> lsShowTime = query.list();
		
		hql = "FROM CHAIR c WHERE c.showTime.Time = '" + time+"'";
		query = session.createQuery(hql);
		List<Chair> lsChair = query.list();
		String dataChair = "";
		for(int i=0;i<lsChair.size();i++){
			if(i+1 == lsChair.size()){
				dataChair+= lsChair.get(i).getRow() + "_" + lsChair.get(i).getCol()  ;
			}else{
				dataChair+= lsChair.get(i).getRow() + "_" + lsChair.get(i).getCol()  + ",";
			}
		}
		if(lsChair.size() > 0){
			model.addAttribute("money", lsChair.get(0).getShowTime().getPrice());
		}
		model.addAttribute("datachair", dataChair);
		
		model.addAttribute("time", time);
		model.addAttribute("namemovie", namemovie);
		model.addAttribute("showtime", lsShowTime);
		model.addAttribute("namePeople", name);
		model.addAttribute("nowDay", currentDay);
		if(lsShowTime.size() > 0)
			model.addAttribute("money", lsShowTime.get(0).getPrice());
		return "booking/index";
	}
	
	@RequestMapping("{namemovie}/{time}/{date}/{chair}/{name}")
	public String book(ModelMap model,@PathVariable("chair") String chair,@PathVariable("name") String name, @PathVariable("namemovie") String namemovie,@PathVariable("time") String time, @PathVariable("date") String date ){
		String []temp = chair.split(",");
		Session session = sessionFactory.openSession();
		Transaction t =  session.beginTransaction();
		
		String hql = "FROM SHOWTIME s WHERE s.movie.Name = '" + namemovie +"' AND s.ShowDay = '" +date+"' AND s.Time = '" + time+"'";
		Query query = session.createQuery(hql);
		List<Chair> lsChair = new ArrayList<Chair>();
		List<ShowTime> lsShowTime = query.list();
		for(int i=0;i<temp.length;i++){
			String []data = temp[i].split("_");
			Chair newChair = new Chair();
			newChair.setRow(Integer.parseInt(data[0]));
			newChair.setCol(Integer.parseInt(data[1]));
			newChair.setShowTime(lsShowTime.get(0));
			lsChair.add(newChair);
		}
		String body = "";
		for(int i=0;i<lsChair.size();i++){
			body += "hàng " + lsChair.get(i).getRow() + " - ghế số " + lsChair.get(i).getCol()+ "      "; 
			try {
				session.save(lsChair.get(i));
				if(!t.wasCommitted())
					t.commit();
			} catch (Exception ex) {
				// TODO: handle exception
				t.rollback();
			}
		}
		String currentDay = date;

		SimpleDateFormat formatter = new SimpleDateFormat("HH:mm");  
		Date dateNow = new Date();  
		String timeNow = formatter.format(dateNow);
		hql = "FROM SHOWTIME s WHERE s.ShowDay = '"+ currentDay + "' AND s.movie.Name = '" + namemovie+"' AND s.Time >= '" +timeNow+"'" ;
		query =  session.createQuery(hql);
		lsShowTime = query.list();
		
		hql = "FROM CHAIR c WHERE c.showTime.Time = '" + time+"'";
		query = session.createQuery(hql);
		List<Chair> lsChairFull = query.list();
		String dataChair = "";
		for(int i=0;i<lsChairFull.size();i++){
			if(i+1 == lsChairFull.size()){
				dataChair+= lsChairFull.get(i).getRow() + "_" + lsChairFull.get(i).getCol()  ;
			}else{
				dataChair+= lsChairFull.get(i).getRow() + "_" + lsChairFull.get(i).getCol()  + ",";
			}
		}
		
		hql = "FROM USERS";
		query =  session.createQuery(hql);
		List<User> lsUser = query.list();
		User user = new User();
		for(int i=0;i<lsUser.size();i++){
			if(lsUser.get(i).getFullName().equalsIgnoreCase(name)){
				user = lsUser.get(i);
			}
		}
		for(int i=0;i<lsChair.size();i++){
			Ticket ticket = new Ticket();
			ticket.setChair(lsChair.get(i));
			ticket.setUser(user);
			try {
				session.save(ticket);
				if(!t.wasCommitted())
					t.commit();
			} catch (Exception ex) {
				// TODO: handle exception
				t.rollback();
			}
		}
				
		try{
			MimeMessage mail = mailer.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail);
			helper.setFrom("GALAXY_CINEMA");
			helper.setTo(user.getEmail());
			helper.setReplyTo("GALAXY_CINEMA","GALAXY_CINEMA");
			helper.setSubject("Thông báo đặt vé thành công");
			helper.setText("Chúc mừng bạn " + user.getFullName() + " đã đặt thành công vé phim " + lsChair.get(0).getShowTime().getMovie().getName() 
					+ " với ghế "+ body + " thời gian " + lsChair.get(0).getShowTime().getTime() + " bạn vui lòng mang email này đén cho thu ngân để mua vé. Xin cảm ơn bạn đã sử dụng dịch vụ của chúng tôi",true);
			mailer.send(mail);
			model.addAttribute("mail", "thành công");
			if(lsShowTime.size() > 0)
				model.addAttribute("money", lsShowTime.get(0).getPrice());
		}catch(Exception ex){
			ex.printStackTrace();	
		}
	
		
		if(lsChair.size() > 0){
			model.addAttribute("money", lsChair.get(0).getShowTime().getPrice());
		}
		model.addAttribute("datachair", dataChair);
		model.addAttribute("time", time);
		model.addAttribute("namemovie", namemovie);
		model.addAttribute("showtime", lsShowTime);
		model.addAttribute("namePeople", name);
		model.addAttribute("nowDay", currentDay);
		return "booking/index";
	}
}
