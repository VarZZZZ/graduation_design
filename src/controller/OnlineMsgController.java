package controller;

import com.alibaba.fastjson.JSON;
import entity.OnlineMsg;
import entity.OnlineReply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.OnlineMsgService;
import service.OnlineReplyService;
import service.UserService;
import viewmodel.OnlineMsgVM;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Liangying on 2018/5/3.
 */
@Controller
public class OnlineMsgController {
    @Autowired
    OnlineMsgService onlineMsgService;
    @Autowired
    UserService userService;
    @Autowired
    OnlineReplyService onlineReplyService;
    @RequestMapping("/listOnlineMsg")
    public ModelAndView listOnlineMsg(HttpServletRequest request){
        ModelAndView mav=new ModelAndView();
        String isAdmin=request.getParameter("isAdmin");
        List<OnlineMsg> onlineMsgs = onlineMsgService.listOnlineMsg();
        List<OnlineMsgVM> onlineMsgList = new ArrayList<>();
        for(OnlineMsg onlineMsg:onlineMsgs){
            OnlineMsgVM  onlineMsgVM = new OnlineMsgVM();
            onlineMsgVM.setOnlineMsg(onlineMsg);
            onlineMsgVM.setUser(userService.get(onlineMsg.getUid()));
            onlineMsgList.add(onlineMsgVM);
        }
        mav.addObject("onlineMsgList",onlineMsgList);
        if(isAdmin==null)
            mav.setViewName("onlineMsg/onlineMsg");
        else
            mav.setViewName("onlineMsg/adminOnlineMsg");


        return mav;
    }

    @RequestMapping("/addOnlineMsg")
    @ResponseBody
    public String addOnlineMsg(String onlineMsgObj, HttpSession session){
        int uid = (Integer)session.getAttribute("Uid");
        OnlineMsg onlineMsg = JSON.parseObject(onlineMsgObj,OnlineMsg.class);
        onlineMsg.setUid(uid);
        Date date = new Date();
        onlineMsg.setDate(date.toString());
        int rel = onlineMsgService.add(onlineMsg);
        return String.valueOf(rel);
    }

    @RequestMapping("/addOnlineReply")
    public String addOnlineReply(HttpServletRequest request){
        int mid=Integer.parseInt(request.getParameter("mid"));
        String recontent= request.getParameter("recontentCreate");
        OnlineReply onlineReply = new OnlineReply();
        onlineReply.setMid(mid);
        onlineReply.setRecontent(recontent);
        Date date = new Date();
        onlineReply.setRedate(date.toString());
        onlineReplyService.add(onlineReply);

        return "redirect:listOnlineMsg?isAdmin=1";
    }
}
