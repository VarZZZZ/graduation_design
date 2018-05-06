package entity;


import viewmodel.CustomizationVM;

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
    private CustomizationVM customizationVM;
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


    public CustomizationVM getCustomizationVM() {
        return customizationVM;
    }

    public void setCustomizationVM(CustomizationVM customizationVM) {
        this.customizationVM = customizationVM;
    }
}
