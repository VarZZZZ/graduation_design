package viewmodel;

import entity.AfterSale;
import entity.Orders;

/**
 * Created by Liangying on 2018/5/30.
 */
public class AfterSaleOrdersVM {
    private AfterSale afterSale;
    private Orders orders;

    public AfterSale getAfterSale() {
        return afterSale;
    }

    public void setAfterSale(AfterSale afterSale) {
        this.afterSale = afterSale;
    }

    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }
}
