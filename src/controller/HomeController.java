package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Liangying on 2018/4/23.
 */
@Controller
public class HomeController {
    @RequestMapping("/adminHome")
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("home/adminHome");
        return mav;
    }
    @RequestMapping("/home")
    public ModelAndView test(){
        ModelAndView mav =new ModelAndView();
        mav.setViewName("home/home");
        return mav;
    }
}
