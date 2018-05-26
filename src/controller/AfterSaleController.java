package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import service.AfterSaleService;
import service.OrdersService;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Liangying on 2018/5/26.
 */
@Controller
public class AfterSaleController {
    @Autowired
    AfterSaleService afterSaleService;
    @Autowired
    OrdersService ordersService;

    @RequestMapping("addAfterSale")
    public ModelAndView addAfterSale(HttpServletRequest request){
        ModelAndView mav= new ModelAndView();

        return mav;
    }
}
