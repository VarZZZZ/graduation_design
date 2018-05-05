package controller;

import com.alibaba.fastjson.JSON;
import entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.CustomizationService;
import service.PaymentService;
import service.ProductService;
import service.UserService;
import utils.OrderStatus;
import viewmodel.CustomizationVM;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Liangying on 2018/5/5.
 */
@Controller
public class CustomizedController {

    @Autowired
    CustomizationService customizationService;
    @Autowired
    ProductService productService;
    @Autowired
    UserService userService;
    @Autowired(required = false)
    PaymentService paymentService;
    @RequestMapping("/customized")
    public ModelAndView customized(HttpSession session){
        ModelAndView mav = new ModelAndView();
        int uid=(Integer)session.getAttribute("Uid");
        User user = userService.get(uid);
        List<Customization> customizations = new ArrayList<>();
        customizations = customizationService.listByUid(uid);
        List<CustomizationVM> customizationVMList = new ArrayList<>();
        for(Customization cu:customizations){
            CustomizationVM customizationVM = new CustomizationVM();
            customizationVM.setCustomization(cu);
            customizationVM.setUser(user);
            customizationVM.setProduct(productService.get(cu.getPid()));
            customizationVMList.add(customizationVM);
        }

        List<Product> products = productService.list();
        mav.addObject("productList",products);
        mav.addObject("customizationVMList",customizationVMList);
        mav.setViewName("customization/customized");
        return mav;
    }

    @RequestMapping("/addCustomized")
    public String addCustomized(HttpServletRequest request,HttpSession session){
        int uid=(Integer)session.getAttribute("Uid");
        Integer pid = Integer.parseInt(request.getParameter("pid"));
        Integer number = Integer.parseInt(request.getParameter("numberCreate"));
        String demand = request.getParameter("demandCreate");
        Customization customization = new Customization();
        customization.setDemand(demand);
        customization.setNumber(number);
        customization.setPid(pid);
        customization.setUid(uid);
        customizationService.add(customization);
        return "redirect:/customized";
    }

    @RequestMapping("/adminCustomized")
    public ModelAndView adminCustomized(){
        ModelAndView mav= new ModelAndView();
        List<Customization> customizations = customizationService.list();
        List<CustomizationVM> customizationVMs = new ArrayList<>();
        for(Customization cu:customizations){
            CustomizationVM customizationVM = new CustomizationVM();
            customizationVM.setCustomization(cu);
            customizationVM.setUser(userService.get(cu.getUid()));
            customizationVM.setProduct(productService.get(cu.getPid()));
            customizationVMs.add(customizationVM);
        }

        mav.addObject("customizationVMList",customizationVMs);
        mav.setViewName("customization/adminCustomized");
        return mav;
    }

    @RequestMapping("/CusProduce")
    public String CusProduce(HttpServletRequest request){
        Float price = Float.parseFloat(request.getParameter("priceCreate"));
        int id=Integer.parseInt(request.getParameter("id"));
        Customization cus = customizationService.get(id);
        cus.setPrice(price);
        cus.setTotal(price*cus.getNumber());
        cus.setStatus(OrderStatus.ORDER_NOT_PAY);
        customizationService.update(cus);
        return "redirect:/adminCustomized";
    }

    @RequestMapping("/cusStatusCenter")
    public String cusStatusCenter(HttpServletRequest req){
        String id = req.getParameter("id");
        String total = req.getParameter("total");
        String status = req.getParameter("status");

        String url = "?id="+id+"&total="+total;
        if(status.equals(OrderStatus.ORDER_NOT_PAY)){
            url="addCusPayment"+url;
        }else if(status.equals(OrderStatus.ORDER_NOT_SEND)){
            url = "getCusSend"+url;
        }else if(status.equals(OrderStatus.ORDER_NOT_CONFIRM)){
            url = "addCusConfirm"+url;
        }else if(status.equals(OrderStatus.ORDER_NOT_EVALUATION))
        {
            url= "addCusEvaluation"+url;
        }else if(status.equals(OrderStatus.ORDER_OK)){
            url="viewCustomization"+url;
        }
        else{
            url ="customized";
        }
        return "redirect:/"+url;
    }

    @RequestMapping("/addCusPayment")
    public ModelAndView addCusPayment(HttpServletRequest req){
        ModelAndView mav = new ModelAndView();
        String id = req.getParameter("id");
        String total=req.getParameter("total");
        mav.addObject("id",id);
        mav.addObject("total",total);
        mav.setViewName("customization/addCusPayment");
        return mav;
    }


    @RequestMapping("/addToCusPayment")
    @ResponseBody
    public String addToCusPayment(String paymentObj,HttpSession httpSession)
    {
        Payment payment = JSON.parseObject(paymentObj, Payment.class);
        Date dat = new Date();
        payment.setPaytime(dat.toString());

        int uid = (Integer)httpSession.getAttribute("Uid");
        payment.setUid(uid);

        int rel = paymentService.addCusPayment(payment);
        return  String.valueOf(rel);
    }

    @RequestMapping("/addCusConfirm")
    @ResponseBody
    public String addCusConfirm(String confirmObj){
        Customization cus = JSON.parseObject(confirmObj,Customization.class);
        Customization c =customizationService.get(cus.getId());
        c.setStatus(OrderStatus.ORDER_NOT_EVALUATION);
        int rel = customizationService.update(c);
        return String.valueOf(rel);
    }

}
