package controller;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.validator.ActionValidatorManager;
import entity.AfterSale;
import entity.Orders;
import entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.AfterSaleService;
import service.OrdersService;
import sun.plugin.AppletStatusListener;
import utils.AfterSaleStatus;
import utils.OrderStatus;
import viewmodel.AfterSaleOrdersVM;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Liangying on 2018/5/26.
 */
@Controller
public class AfterSaleController {
    @Autowired
    AfterSaleService afterSaleService;
    @Autowired
    OrdersService ordersService;

    @RequestMapping("/addAfterSale")
    public String addAfterSale(HttpServletRequest request){

        int oid = Integer.parseInt(request.getParameter("oid"));
        String code = request.getParameter("ocode");
        String info = request.getParameter("infoCreate");
        AfterSale afterSale = new AfterSale();
        afterSale.setOid(oid);
        afterSale.setInfo(info);
        afterSale.setStatus(AfterSaleStatus.AFTERSALE_APPLIED);
        afterSaleService.add(afterSale);
        return "redirect:/viewOrder?id="+code;
    }

    @RequestMapping("/listAfterSale")
    public ModelAndView listAfterSale(HttpServletRequest request, HttpSession session){
        ModelAndView mav  = new ModelAndView();
        int uid = (Integer)session.getAttribute("Uid");
        List<Orders>  ordersList = ordersService.getOrdersByUid(uid);
        List<AfterSaleOrdersVM> afterSaleOrdersVMS = new ArrayList<>();
        for(Orders o : ordersList){
            AfterSale afterSale ;
            afterSale = afterSaleService.getByOid(o.getId());
            if(afterSale!=null){
                AfterSaleOrdersVM afterSaleOrdersVM = new AfterSaleOrdersVM();
                afterSaleOrdersVM.setAfterSale(afterSale);
                afterSaleOrdersVM.setOrders(o);
                afterSaleOrdersVMS.add(afterSaleOrdersVM);
            }
        }

        mav.addObject("afterSaleOrdersVMS",afterSaleOrdersVMS);
        mav.setViewName("afterSale/list");
        return mav;
    }
    @RequestMapping("/listAdminAfterSale")
    public ModelAndView listAdminAfterSale(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        List<AfterSaleOrdersVM> afterSaleOrdersVMS = new ArrayList<>();
        List<AfterSale> afterSaleList = afterSaleService.list();
        for(AfterSale a:afterSaleList){
            AfterSaleOrdersVM afterSaleOrdersVM = new AfterSaleOrdersVM();
            afterSaleOrdersVM.setAfterSale(a);
            afterSaleOrdersVM.setOrders(ordersService.getOrders(a.getId()));
            afterSaleOrdersVMS.add(afterSaleOrdersVM);
        }
        mav.addObject("afterSaleOrdersVMS",afterSaleOrdersVMS);
        mav.setViewName("afterSale/adminList");
        return mav;
    }
    @RequestMapping("/statusAfterSale")
    @ResponseBody
    public String  statusAfterSale(String afterSaleObj)throws Exception{
        AfterSale af= JSON.parseObject(
                afterSaleObj, AfterSale.class);

        String status =af.getStatus();
        int id = af.getId();
        AfterSale afterSale = afterSaleService.get(id);
        if(status.equals(AfterSaleStatus.AFTERSALE_APPLIED)){
            afterSale.setStatus(AfterSaleStatus.AFTERSALE_SERVICING);
        }else{
            afterSale.setStatus(AfterSaleStatus.AFTERSALE_DONE);
        }
        int rel= afterSaleService.update(afterSale);

        return String.valueOf(rel);
    }
}
