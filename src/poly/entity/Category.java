package poly.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity(name = "CATEGORY")
public class Category {
	@Id
	@GeneratedValue
	private int Id;
	private String Name;
	
	@OneToMany( mappedBy =  "category",fetch =FetchType.EAGER)
	private Collection<Movie> movie;

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public Collection<Movie> getMovie() {
		return movie;
	}

	public void setMovie(Collection<Movie> movie) {
		this.movie = movie;
	}
	
	
}
