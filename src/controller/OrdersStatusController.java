package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import utils.OrderStatus;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Liangying on 2017/11/16.
 */
@Controller
public class OrdersStatusController {
    @RequestMapping("/ordersStatusCenter")
    public String ordersStatusCenter(HttpServletRequest req){
        String id = req.getParameter("id");
        String total = req.getParameter("total");
        String status = req.getParameter("status");

        String url = "?id="+id+"&total="+total;
        if(status.equals(OrderStatus.ORDER_NOT_PAY)){
            url="addPayment"+url;
        }else if(status.equals(OrderStatus.ORDER_NOT_SEND)){
            url = "getSend"+url;
        }else if(status.equals(OrderStatus.ORDER_NOT_CONFIRM)){
            url = "addConfirm"+url;
        }else if(status.equals(OrderStatus.ORDER_NOT_EVALUATION))
        {
            url= "addEvaluation"+url;
        }else if(status.equals(OrderStatus.ORDER_OK)){
            url="viewOrder"+url;
        }
        else{
            url ="listOrders"+url;
        }
        return "redirect:/"+url;
    }
}
