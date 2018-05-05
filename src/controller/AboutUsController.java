package controller;

import entity.AboutUs;
import org.apache.commons.lang.xwork.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import service.AboutUsService;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;

/**
 * Created by Liangying on 2018/4/10.
 */
@Controller
public class AboutUsController {

    @Autowired
    AboutUsService aboutUsService;

    @RequestMapping("/aboutUs")
    public ModelAndView aboutUs(){
        ModelAndView mav = new ModelAndView();
        AboutUs aboutUs = aboutUsService.get(1);
        mav.addObject("aboutUs",aboutUs);
        mav.setViewName("aboutUs/aboutUs");
        return mav;
    }

    @RequestMapping("/adminAboutUs")
    public ModelAndView adminAboutUs(){
        ModelAndView mav = new ModelAndView();
        AboutUs aboutUs = aboutUsService.get(1);
        mav.addObject("aboutUs",aboutUs);
        mav.setViewName("aboutUs/adminAboutUs");
        return mav;
    }

    @RequestMapping("/updateAboutUs")
    @ResponseBody
    public ModelAndView updateAboutUs(HttpServletRequest request, MultipartFile imageurl)throws IllegalStateException,IOException{
        Calendar c = Calendar.getInstance();
        int year = c.get(Calendar.YEAR);
        int month=c.get(Calendar.MONTH);
        int day=c.get(Calendar.DAY_OF_MONTH);
        int minute=c.get(Calendar.MINUTE);
        int second=c.get(Calendar.SECOND);
        String d = String.valueOf(year)+String.valueOf(month)+
                String.valueOf(day)+
                String.valueOf(minute)+
                String.valueOf(second);
        String name = d+ RandomStringUtils.randomAlphabetic(10);
        String newFileName=name+".jpg";

        String path = "D:\\Idea_Project\\graduation_design\\web\\upload\\aboutUs";
 //       String path = request.getServletContext().getRealPath("/upload/aboutUs");
        File newFile = new File(path,newFileName);
        imageurl.transferTo(newFile);

        String imageUrl = "upload/aboutUs/"+newFileName;
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
        String content=multipartHttpServletRequest.getParameter("content");

        AboutUs as = aboutUsService.get(1);
        as.setContent(content);
        as.setImageurl(imageUrl);
        aboutUsService.update(as);

        ModelAndView mav =new ModelAndView();
        mav.setViewName("aboutUs/adminAboutUs");
        return mav;
    }
}
