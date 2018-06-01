package controller;

import entity.Construct;
import entity.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.ConstructItemService;
import service.ConstructService;
import service.OrdersService;
import utils.ConstructStatus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Liangying on 2018/5/31.
 */
@Controller
public class ConstructionController {
    @Autowired
    ConstructService constructService;
    @Autowired
    ConstructItemService constructItemService;
    @Autowired
    OrdersService ordersService;

    @RequestMapping("/addConstruct")
    @ResponseBody
    public String addConstruct(HttpServletRequest request){
        int id=Integer.parseInt(request.getParameter("oid"));
        Construct construct = new Construct();
        construct.setOid(id);
        construct.setStatus(ConstructStatus.CONSTRUCT_APPLIED);
        return String.valueOf(constructService.add(construct));
    }
    @RequestMapping("/listConstruct")
    public ModelAndView listConstruct(HttpServletRequest request, HttpSession httpSession){
        ModelAndView mav = new ModelAndView();
        int uid = (Integer)httpSession.getAttribute("Uid");
        List<Construct> constructs = constructService.list();
        List<Construct> constructList = new ArrayList<>();
        for(Construct c: constructs){
            Orders o = ordersService.get(c.getOid());
            if(o.getUid()==uid){
                constructList.add(c);
            }
        }
        mav.addObject("constructList",constructList);
        mav.setViewName("construct/listConstruct");
        return mav;
    }

    @RequestMapping("/adminListConstruct")
    public ModelAndView adminListConstruct(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();

        List<Construct> constructs = constructService.list();

        mav.addObject("constructList",constructs);
        mav.setViewName("construct/adminListConstruct");
        return mav;
    }

    @RequestMapping("/checkConstruct")
    public ModelAndView checkConstruct(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        int id = Integer.parseInt(request.getParameter("id"));
        Construct construct = constructService.get(id);
        mav.addObject("construct",construct);
        mav.setViewName("construct/checkConstruct");
        return mav;
    }
}
