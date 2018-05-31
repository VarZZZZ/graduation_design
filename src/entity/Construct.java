package entity;

import java.util.List;

/**
 * Created by Liangying on 2018/5/31.
 */
public class Construct {
    private int id;
    private int oid;
    private String status;
    private List<ConstructItem> constructItems;
    private Orders orders;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }

    public List<ConstructItem> getConstructItems() {
        return constructItems;
    }

    public void setConstructItems(List<ConstructItem> constructItems) {
        this.constructItems = constructItems;
    }
}
