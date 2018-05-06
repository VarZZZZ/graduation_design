package entity;


import java.util.List;

/**
 * Created by Liangying on 2018/5/6.
 */
public class Logistics {
    private int id;
    private int oid;
    private int cusid;
    private List<LogisticsItem> logisticsItems;
    private Orders orders;
    private Customization customization;
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

    public int getCusid() {
        return cusid;
    }

    public void setCusid(int cusid) {
        this.cusid = cusid;
    }

    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }


    public List<LogisticsItem> getLogisticsItemList() {
        return logisticsItems;
    }

    public void setLogisticsItemList(List<LogisticsItem> logisticsItemList) {
        this.logisticsItems = logisticsItemList;
    }

    public Customization getCustomization() {
        return customization;
    }

    public void setCustomization(Customization customization) {
        this.customization = customization;
    }
}
