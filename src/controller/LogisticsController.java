package controller;

import entity.Logistics;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import service.LogisticsItemService;
import service.LogisticsService;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Liangying on 2018/5/6.
 */
@Controller
public class LogisticsController {
    @Autowired
    LogisticsService logisticsService;
    @Autowired
    LogisticsItemService logisticsItemService;

    @RequestMapping("/getOrdLogistics")
    public ModelAndView getOrdLogistics(HttpServletRequest request){
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
    public ModelAndView adminOrdLogistics(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        int oid = Integer.parseInt(request.getParameter("oid"));
        Logistics logistics = logisticsService.orderGet(oid);
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
}
