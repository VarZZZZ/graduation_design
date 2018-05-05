package controller;

import com.alibaba.fastjson.JSON;
import entity.Cart;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.CartService;
import service.UserService;
import utils.CodeUtil;

import javax.servlet.http.HttpSession;

/**
 * Created by Liangying on 2018/3/31.
 */
@Controller
public class LoginRegController {
    @Autowired
    UserService userService;

    @Autowired
    CartService cartService;
    @RequestMapping("/login")
    public ModelAndView login(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("login/login");
        return mav;
    }

    @RequestMapping("/loginIn")
    @ResponseBody
    public String loginIn(String userObj,HttpSession httpSession)
    {
        User user = JSON.parseObject(userObj,User.class);
        User rel=userService.login(
                user.getMobile(),
                user.getPassword()
        );
        int loginRel = 0;
        if(rel!=null){
            loginRel = 1;
            httpSession.setAttribute("Uid",rel.getId());
            httpSession.setAttribute("Uname",rel.getUsername());
        }

        return String.valueOf(loginRel);
    }

    @RequestMapping("/register")
    public ModelAndView register(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("registerUser/register");
        return mav;
    }

    @RequestMapping("/addUser")
    @ResponseBody
    public String registerUser(String userObj,HttpSession session){
        User user = JSON.parseObject(userObj,User.class);

        int rel= userService.add(user);
        User mu = userService.getByMobile(user.getMobile());

        CodeUtil codeUtil = new CodeUtil();
        String code=codeUtil.AutoCode();
        Cart cart=new Cart();
        cart.setCode(code);
        cart.setUid(mu.getId());
        rel=cartService.add(cart);
        if(rel!=0){
            session.setAttribute("Uid",user.getId());
            session.setAttribute("Uname",user.getUsername());

        }
        return String.valueOf(rel);
    }




}
