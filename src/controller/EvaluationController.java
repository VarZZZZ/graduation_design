package controller;

import com.alibaba.fastjson.JSON;
import dao.OrdersMapper;
import entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.*;
import viewmodel.CustomizationVM;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Liangying on 2017/11/20.
 */
@Controller
public class EvaluationController {
    @Autowired(required = false)
    EvaluationService evaluationService;
    @Autowired(required = false)
    OrdersMapper ordersMapper;
    @Autowired
    CustomizationService customizationService;
    @Autowired
    UserService userService;
    @Autowired
    ProductService productService;
    @Autowired
    LogisticsService logisticsService;

    @RequestMapping("/addEvaluation")
    public ModelAndView addEvaluation(HttpServletRequest req) throws Exception {
        ModelAndView mav = new ModelAndView();
        String id = req.getParameter("id");
        String total=req.getParameter("total");
        Orders o = new Orders();
        o=ordersMapper.getOrdersByCode(id);
        Logistics logistics = logisticsService.orderGet(o.getId());
        mav.addObject("orders",o);
        mav.addObject("id",id);
        mav.addObject("total",total);
        mav.addObject("logistics",logistics);
        mav.setViewName("evaluation/add");
        return mav;
    }
    @RequestMapping("/addCusEvaluation")
    public ModelAndView addCusEvaluation(HttpServletRequest req){
        ModelAndView mav = new ModelAndView();
        String id = req.getParameter("id");
        String total=req.getParameter("total");

        Customization cus = customizationService.get(Integer.parseInt(id));
        User user = userService.get(cus.getUid());
        Product product = productService.get(cus.getPid());
        CustomizationVM cusVM = new CustomizationVM();
        cusVM.setUser(user);
        cusVM.setProduct(product);
        cusVM.setCustomization(cus);
        mav.addObject("cusVM",cusVM);
        mav.addObject("id",id);
        mav.addObject("total",total);
        mav.setViewName("customization/addEvaluation");
        return mav;
    }

    @RequestMapping("/addToEvaluation")
    @ResponseBody
    public String addToEvaluation(String evaluationObj)
    {
        Evaluation evaluation= JSON.parseObject(evaluationObj, Evaluation.class);
        Date dat = new Date();
        evaluation.setEvatime(dat.toString());

        int rel = evaluationService.add(evaluation);

        return  String.valueOf(rel);
    }

    @RequestMapping("/addToCusEvaluation")
    @ResponseBody
    public String addToCusEvaluation(String evaluationObj)
    {
        Evaluation evaluation= JSON.parseObject(evaluationObj, Evaluation.class);
        Date dat = new Date();
        evaluation.setEvatime(dat.toString());

        int rel = evaluationService.cudAdd(evaluation);

        return  String.valueOf(rel);
    }
}
