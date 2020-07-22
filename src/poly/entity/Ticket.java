package poly.entity;



import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity(name = "TICKET")
public class Ticket {
	@Id
	@GeneratedValue
	private int Id;
	@ManyToOne
	@JoinColumn(name = "IdUser")
	private User user;
	@ManyToOne
	@JoinColumn(name = "IdChair")
	private Chair chair;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Chair getChair() {
		return chair;
	}
	public void setChair(Chair chair) {
		this.chair = chair;
	}

}
