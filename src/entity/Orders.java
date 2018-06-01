package entity;

import java.util.List;

public class Orders {
	private int id;
	private String code;
	private int uid;
	private String status;
	private float total;
	private List<OrdersItem> ordersItems;
	private Construct construct;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public List<OrdersItem> getOrdersItems() {
		return ordersItems;
	}
	public void setOrdersItems(List<OrdersItem> ordersItems) {
		this.ordersItems = ordersItems;
	}

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public Construct getConstruct() {
        return construct;
    }

    public void setConstruct(Construct construct) {
        this.construct = construct;
    }
}
