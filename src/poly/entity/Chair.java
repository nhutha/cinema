package poly.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity(name = "CHAIR")
public class Chair {
	@Id
	@GeneratedValue
	private int Id;
	private int Row;
	private int Col;
	
	@ManyToOne
	@JoinColumn(name = "IdShowTime")
	private ShowTime showTime;
	
	@OneToMany(mappedBy = "chair",fetch=FetchType.EAGER)
	private Collection<Ticket> ticket;

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public int getRow() {
		return Row;
	}

	public void setRow(int row) {
		Row = row;
	}

	public int getCol() {
		return Col;
	}

	public void setCol(int col) {
		Col = col;
	}

	

	public ShowTime getShowTime() {
		return showTime;
	}

	public void setShowTime(ShowTime showTime) {
		this.showTime = showTime;
	}

	public Collection<Ticket> getTicket() {
		return ticket;
	}

	public void setTicket(Collection<Ticket> ticket) {
		this.ticket = ticket;
	}

	
	
}
