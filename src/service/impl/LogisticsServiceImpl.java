package service.impl;

import dao.LogisticsMapper;
import entity.Customization;
import entity.Logistics;
import entity.Orders;
import entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.CustomizationService;
import service.LogisticsService;
import service.OrdersService;
import service.ProductService;
import viewmodel.CustomizationVM;

/**
 * Created by Liangying on 2018/5/6.
 */
@Service
public class LogisticsServiceImpl implements LogisticsService {
    @Autowired
    LogisticsMapper logisticsMapper;
    @Autowired
    OrdersService ordersService;
    @Autowired
    CustomizationService customizationService;
    @Autowired
    ProductService productService;
    @Override
    public int orderAdd(Logistics logistics) {
        return logisticsMapper.orderAdd(logistics);
    }

    @Override
    public int customizedAdd(Logistics logistics) {
        return logisticsMapper.customizedAdd(logistics);
    }

    @Override
    public Logistics orderGet(int oid)throws Exception {
        Logistics logistics=logisticsMapper.orderGet(oid);
        if(logistics==null)
            return null;
        else{
            Orders orders = ordersService.getOrders(oid);
            logistics.setOrders(orders);
            return logistics;
        }

    }

    @Override
    public Logistics customizedGet(int cusid) {
        Logistics logistics=logisticsMapper.customizedGet(cusid);
        Customization cus = customizationService.get(cusid);
        Product  p = productService.get(cus.getPid());
        CustomizationVM cusVM =new CustomizationVM();
        cusVM.setCustomization(cus);
        cusVM.setProduct(p);
        logistics.setCustomizationVM(cusVM);
        return logistics;
    }
}
