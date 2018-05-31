package controller;

import com.alibaba.fastjson.JSON;
import entity.Construct;
import entity.Orders;
import entity.Payment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.ConstructService;
import service.OrdersService;
import service.PaymentService;
import utils.OrderStatus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * Created by Liangying on 2017/11/16.
 */
@Controller
public class PaymentController {
    @Autowired(required = false)
    PaymentService paymentService;
    @Autowired
    OrdersService ordersService;
    @Autowired
    ConstructService constructService;
    @RequestMapping("/addPayment")
    public ModelAndView addPayment(HttpServletRequest req){
        ModelAndView mav = new ModelAndView();
        String id = req.getParameter("id");
        Orders o = ordersService.getByCode(id);
        Construct c  = constructService.getByOid(o.getId());
        String total=req.getParameter("total");
        mav.addObject("id",id);
        mav.addObject("total",total);
        mav.addObject("construct",c);
        mav.addObject("orders",o);
        mav.setViewName("payment/add");
        return mav;
    }

    @RequestMapping("/addToPayment")
    @ResponseBody
    public String addToPayment(String paymentObj,HttpSession httpSession)
    {
        Payment payment = JSON.parseObject(paymentObj, Payment.class);
        Date dat = new Date();
        payment.setPaytime(dat.toString());

        int uid = (Integer)httpSession.getAttribute("Uid");
        payment.setUid(uid);

        int rel = paymentService.add(payment);

        return  String.valueOf(rel);
    }

    @RequestMapping("/addConfirm")
    @ResponseBody
    public String addConfirm(String confirmObj,HttpServletRequest req){
        Orders orders = JSON.parseObject(confirmObj,Orders.class);
        Orders o =ordersService.get(orders.getId());
        o.setStatus(OrderStatus.ORDER_NOT_EVALUATION);
        int rel = ordersService.update(o);
        return String.valueOf(rel);
    }
}
