package controller;

import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by Liangying on 2018/5/22.
 */
@Controller
public class UserController {
    @Autowired
    UserService userService;

    @RequestMapping("/userInfo")
    public ModelAndView userInfo(HttpSession session){
        ModelAndView mav=new ModelAndView();
        int uid =  (Integer)session.getAttribute("Uid");
        User user = userService.get(uid);
        mav.addObject("user",user);
        mav.setViewName("user/userInfo");
        return mav;
    }

    @RequestMapping("/updateUserInfo")
    public ModelAndView updateUserInfo(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        String username  = request.getParameter("nameUpdate");
        String mobile = request.getParameter("mobileUpdate");
        String address = request.getParameter("addressUpdate");
        String password = request.getParameter("passwordUpdate");
        int id= Integer.parseInt(request.getParameter("userId"));
        User user = userService.get(id);
        user.setUsername(username);
        user.setMobile(mobile);
        user.setAddress(address);
        user.setPassword(password);
        userService.update(user);
        User u = userService.getByMobile(mobile);
        mav.addObject("user",u);
        mav.setViewName("user/userInfo");
        return mav;
    }
}
