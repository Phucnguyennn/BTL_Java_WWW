package model;

import java.math.BigDecimal;
import java.util.Date;

public class Order {
	private int id;
    private int userId;
    private Date orderDate;
    private BigDecimal total;
	public Order(int id, int userId, Date orderDate, BigDecimal total) {
		super();
		this.id = id;
		this.userId = userId;
		this.orderDate = orderDate;
		this.total = total;
	}
	public Order() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public BigDecimal getTotal() {
		return total;
	}
	public void setTotal(BigDecimal total) {
		this.total = total;
	}
    
}
