package controller;

import com.alibaba.fastjson.JSON;
import entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.*;
import viewmodel.CustomizationVM;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * Created by Liangying on 2017/11/16.
 */
@Controller
public class SendController {
    @Autowired
    SendService sendService;
    @Autowired
    OrdersService ordersService;
    @Autowired
    UserService myUserService;
    @Autowired
    AddressService addressService;
    @Autowired
    CustomizationService customizationService;
    @Autowired
    ProductService productService;
    @RequestMapping("/getSend")
    public ModelAndView getSend(HttpServletRequest req){
        ModelAndView mav =new ModelAndView();
        String id= req.getParameter("id");
        Send send = sendService.get(id);
        mav.addObject("send",send);
        mav.setViewName("send/get");
        return mav;
    }
    @RequestMapping("/adminAddSend")
    public ModelAndView adminAddSend(HttpServletRequest request, HttpSession session) {
        int uid=Integer.parseInt(request.getParameter("uid"));
        Address add = addressService.getByUid(uid);
        User myUser  = myUserService.get(uid);
        ModelAndView mav=new ModelAndView();
        String id=request.getParameter("id");
        Orders orders = ordersService.getByCode(id);
        mav.addObject("id", id);
        mav.addObject("address",add);
        mav.addObject("orders",orders);
        mav.addObject("myuser",myUser);
        mav.setViewName("send/adminAddSend");
        return mav;
    }

    @RequestMapping("/adminAddCusSend")
    public ModelAndView adminAddCusSend(HttpServletRequest request, HttpSession session) {
        int uid=Integer.parseInt(request.getParameter("uid"));
        Address add = addressService.getByUid(uid);
        User myUser  = myUserService.get(uid);
        ModelAndView mav=new ModelAndView();
        String id=request.getParameter("id");
        Customization cus = customizationService.get(Integer.parseInt(id));
        CustomizationVM cusVm = new CustomizationVM();
        cusVm.setCustomization(cus);
        cusVm.setProduct(productService.get(cus.getPid()));
        cusVm.setUser(myUser);
        mav.addObject("id", id);
        mav.addObject("address",add);
        mav.addObject("cusVm",cusVm);
        mav.addObject("myuser",myUser);
        mav.setViewName("customization/adminAddCusSend");
        return mav;
    }


    @RequestMapping("/addToSend")
    @ResponseBody
    public String addToSend(String sendObj) {
        Send send = JSON.parseObject(sendObj,Send.class);

        Date dat = new Date();
        send.setSendtime(dat.toString());
        int rel =sendService.add(send);
        return String.valueOf(rel);
    }

    @RequestMapping("/addToCusSend")
    @ResponseBody
    public String addToCusSend(String sendObj) {
        Send send = JSON.parseObject(sendObj,Send.class);

        Date dat = new Date();
        send.setSendtime(dat.toString());
        int rel =sendService.addCus(send);
        return String.valueOf(rel);
    }
}
