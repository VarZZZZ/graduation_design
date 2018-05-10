package controller;

import entity.Logistics;
import entity.LogisticsItem;
import entity.Orders;
import org.omg.PortableInterceptor.LOCATION_FORWARD;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.LogisticsItemService;
import service.LogisticsService;
import service.OrdersService;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * Created by Liangying on 2018/5/6.
 */
@Controller
public class LogisticsController {
    @Autowired
    LogisticsService logisticsService;
    @Autowired
    LogisticsItemService logisticsItemService;
    @Autowired
    OrdersService ordersService;

    @RequestMapping("/getOrdLogistics")
    public ModelAndView getOrdLogistics(HttpServletRequest request) throws Exception {
        ModelAndView mav = new ModelAndView();
        int oid = Integer.parseInt(request.getParameter("oid"));
        Logistics logistics = logisticsService.orderGet(oid);
        mav.addObject("logistics",logistics);
        mav.setViewName("logistics/getOrdLogistics");
        return mav;
    }

    @RequestMapping("/getCusLogistics")
    public ModelAndView getCusLogistics(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        int cusid = Integer.parseInt(request.getParameter("cusid"));
        Logistics logistics  = logisticsService.customizedGet(cusid);
        mav.addObject("logistics",logistics);
        mav.setViewName("logistics/getCusLogistics");
        return mav;
    }

    @RequestMapping("adminOrdLogistics")
    public ModelAndView adminOrdLogistics(HttpServletRequest request) throws Exception {
        ModelAndView mav = new ModelAndView();
        int oid = Integer.parseInt(request.getParameter("oid"));
        Orders  orders = ordersService.getOrders(oid);
        Logistics logistics = logisticsService.orderGet(oid);
        mav.addObject("order",orders);
        mav.addObject("logistics",logistics);
        mav.setViewName("logistics/adminOrdLogistics");
        return mav;
    }
    @RequestMapping("/adminCusLogistics")
    public ModelAndView adminCusLogistics(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        int cusid = Integer.parseInt(request.getParameter("cusid"));
        Logistics logistics  = logisticsService.customizedGet(cusid);
        mav.addObject("logistics",logistics);
        mav.setViewName("logistics/adminCusLogistics");
        return mav;
    }

    @RequestMapping("addLogistics")
    @ResponseBody
    public String addOrdLogistics(HttpServletRequest request) throws Exception {
        int oid = Integer.parseInt(request.getParameter("oid"));
        int cusid = Integer.parseInt(request.getParameter("cusid"));
        String info = request.getParameter("info");
        Logistics logistics;
        Date date = new Date();
        LogisticsItem logisticsItem;
        int loid;
        int rel;
        if(oid>0){
            logistics = logisticsService.orderGet(oid);
            if(logistics==null){
                logistics = new Logistics();
                logistics.setOid(oid);
                logisticsService.orderAdd(logistics);
                Logistics l = logisticsService.orderGet(oid);
                loid = l.getId();
            }else
                loid = logistics.getId();

        }else{
            logistics = logisticsService.customizedGet(cusid);
            if(logistics==null){
                logistics = new Logistics();
                logistics.setCusid(cusid);
                logisticsService.customizedAdd(logistics);
                Logistics l = logisticsService.customizedGet(cusid);
                loid = l.getId();
            }else
                loid = logistics.getId();
        }
        logisticsItem = new LogisticsItem();
        logisticsItem.setLoid(loid);
        logisticsItem.setDate(date.toString());
        logisticsItem.setInfo(info);
        rel = logisticsItemService.add(logisticsItem);
        return String.valueOf(rel);
    }
}
