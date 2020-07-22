package poly.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity(name = "MOVIE")
public class Movie {
	@Id
	@GeneratedValue
	private int Id;
	private String Name;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date StartDay;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date EndDay;
	private String Content;
	private String Picture;
	private String Trailer;
	private String MovieTitle;
	@ManyToOne
	@JoinColumn(name = "IdCategory")
	private Category category;
	
	@OneToMany(mappedBy = "movie",fetch=FetchType.EAGER)
	private Collection<ShowTime> showTime;

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}
	

	public String getMovieTitle() {
		return MovieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		MovieTitle = movieTitle;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public Date getStartDay() {
		return StartDay;
	}

	public void setStartDay(Date startDay) {
		StartDay = startDay;
	}

	public Date getEndDay() {
		return EndDay;
	}

	public void setEndDay(Date endDay) {
		EndDay = endDay;
	}

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}

	public String getPicture() {
		return Picture;
	}

	public void setPicture(String picture) {
		Picture = picture;
	}

	public String getTrailer() {
		return Trailer;
	}

	public void setTrailer(String trailer) {
		Trailer = trailer;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Collection<ShowTime> getShowTime() {
		return showTime;
	}

	public void setShowTime(Collection<ShowTime> showTime) {
		this.showTime = showTime;
	}
	
	
}
