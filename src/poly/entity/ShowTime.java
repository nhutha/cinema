package poly.entity;

import java.util.Collection;
import java.util.Date;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;

@Entity(name = "SHOWTIME")
public class ShowTime {
	@Id
	@GeneratedValue
	private int Id;
	@ManyToOne
	@JoinColumn(name = "IdMovie")
	private Movie movie;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date ShowDay;
	private String Time;
	private int Price;
	
	@OneToMany(mappedBy = "showTime", fetch=FetchType.EAGER)
	private Collection<Chair> chair;

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public Movie getMovie() {
		return movie;
	}

	public void setMovie(Movie movie) {
		this.movie = movie;
	}

	public Date getShowDay() {
		return ShowDay;
	}

	public void setShowDay(Date showDay) {
		ShowDay = showDay;
	}

	public String getTime() {
		return Time;
	}

	public void setTime(String time) {
		Time = time;
	}

	public int getPrice() {
		return Price;
	}

	public void setPrice(int price) {
		Price = price;
	}

	public Collection<Chair> getChair() {
		return chair;
	}

	public void setChair(Collection<Chair> chair) {
		this.chair = chair;
	}
	
	
}
