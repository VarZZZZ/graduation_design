package controller;

import entity.Orders;
import entity.Reply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import service.OrdersService;
import service.ReplyService;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * Created by Liangying on 2017/11/28.
 */
@Controller
public class ReplyController {
    @Autowired(required = false)
    ReplyService replyService;

    @Autowired(required = false)
    OrdersService ordersService;

    @RequestMapping("/addReply")
    public String addReply(HttpServletRequest req){

        String code = req.getParameter("code");
        Orders o  = ordersService.getByCode(code);
        int id = o.getId();
        String content =req.getParameter("content");
        Reply r = new Reply();
        r.setCode(code);
        r.setContent(content);
        Date d = new Date();
        r.setTime(d.toString());
        replyService.add(r);
        return "redirect:/adminCheckOrders?id="+id;
    }

    @RequestMapping("/replyUpdate")
    public ModelAndView replyUpdate(HttpServletRequest req){
        ModelAndView mav = new ModelAndView();

        return mav;
    }

}
