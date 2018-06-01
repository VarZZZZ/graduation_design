package controller;

import entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import service.*;
import utils.AfterSaleStatus;
import utils.OrderStatus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Liangying on 2017/11/14.
 */
@Controller
public class OrdersController {
    @Autowired
    OrdersService ordersService;

    @Autowired
    EvaluationService evaluationService;

    @Autowired(required = false)
    ReplyService replyService;

    @Autowired
    LogisticsService logisticsService;

    @Autowired
    AfterSaleService afterSaleService;
    @Autowired
    ConstructService constructService;

    @RequestMapping("/listOrders")
    public ModelAndView listOrders(HttpServletRequest req, HttpSession httpSession) {
        ModelAndView mav = new ModelAndView();
        String status = req.getParameter("status");
        String role = req.getParameter("role");
        float total = 0;
        List<Orders> orders = null;
        if (httpSession.getAttribute("Uid") == null) {
            mav.addObject("orders", null);
            mav.setViewName("orders/list");
            return mav;
        } else {
            int uid = (Integer) httpSession.getAttribute("Uid");
            orders = ordersService.getOrdersByUid(uid);
        }
        if (status == null || orders.size() == 0) {
            mav.addObject("orders", orders);
        } else {
            List<Orders> os = new ArrayList<>();        //  直接用List<> os ==null  os的值为空
            for (Orders o : orders) {
                if (o.getStatus().equals(status))
                    os.add(o);
            }
            mav.addObject("orders", os);
        }
        mav.addObject("total", total);
        mav.setViewName("orders/list");
        return mav;
    }

    @RequestMapping("/listAdminOrders")
    public ModelAndView listAdminOrders(HttpServletRequest req) {
        ModelAndView mav = new ModelAndView();
        String status = req.getParameter("status");
        List<Orders> ordersList = ordersService.listOrder();
        List<Orders> osOK = new ArrayList<>();
        List<Orders> orders = new ArrayList<>();
        for(Orders o : ordersList){
            if(o.getStatus().equals(OrderStatus.ORDER_OK)){
                osOK.add(o);
            }else{
                orders.add(o);
            }
        }
        if (status == null) {
            mav.addObject("orders", orders);
            mav.addObject("osOK",osOK);
        } else {
            List<Orders> os = new ArrayList<>();        //  直接用List<> os ==null  os的值为空
            for (Orders o : orders) {
                if (o.getStatus().equals(status))
                    os.add(o);
            }
            mav.addObject("orders", os);
            mav.addObject("osOK",null);
        }
        mav.setViewName("orders/adminList");
        return mav;
    }

    @RequestMapping("/adminCheckOrders")
    public ModelAndView adminCheckOrders(HttpServletRequest req){
        ModelAndView mav =new ModelAndView();
        int id =Integer.parseInt(req.getParameter("id"));
        Orders o = ordersService.getOrders(id);
        Evaluation e = evaluationService.get(o.getCode());
        Reply r = replyService.getByCode(o.getCode());
        mav.addObject("evaluation",e);
        mav.addObject("order",o);
        mav.addObject("reply",r);
        mav.setViewName("orders/checkOrders");
        return mav;
    }
    @RequestMapping("/viewOrder")
    public ModelAndView viewOrder(HttpServletRequest req) throws Exception {
        ModelAndView mav =new ModelAndView();
        String code =req.getParameter("id");

        Orders o = ordersService.getByCode(code);
        AfterSale afterSale = afterSaleService.getByOid(o.getId());
        Evaluation e = evaluationService.get(o.getCode());
        Reply r = replyService.getByCode(o.getCode());
        Logistics logistics = logisticsService.orderGet(o.getId());
        Construct construct = constructService.getByOid(o.getId());
        mav.addObject("evaluation",e);
        mav.addObject("order",o);
        mav.addObject("reply",r);
        mav.addObject("logistics",logistics);
        mav.addObject("afterSale",afterSale);
        mav.addObject("construct",construct);
        mav.setViewName("orders/viewOrder");
        return mav;
    }

}
