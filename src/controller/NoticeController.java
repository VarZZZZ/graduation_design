package controller;

import com.alibaba.fastjson.JSON;
import entity.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.NoticeService;

import java.util.Date;

/**
 * Created by Liangying on 2017/11/22.
 */
@Controller
public class NoticeController {
    @Autowired
    NoticeService noticeService;

    @RequestMapping("/adminNotice")
    public ModelAndView adminNotice() {
        ModelAndView mav = new ModelAndView();
        Notice notice=noticeService.get(1);

        mav.addObject("notice", notice);
        mav.setViewName("notice/adminNotice");
        return mav;
    }

    @RequestMapping("/updateNotice")
    @ResponseBody
    public String updateNotice(String noticeObj) {
        Notice notice= JSON.parseObject(
                noticeObj, Notice.class);

        Notice c=noticeService.get(1);
        c.setContent(notice.getContent());
        Date date = new Date();
        c.setReleasetime(date.toString());

        int rel=noticeService.update(c);

        return String.valueOf(rel);
    }


    @RequestMapping("/notice")
    public ModelAndView notice() {
        ModelAndView mav = new ModelAndView();
        Notice notice=noticeService.get(1);
        mav.addObject("notice", notice);
        mav.setViewName("notice/notice");
        return mav;
    }
}
