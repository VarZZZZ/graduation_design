package controller;

import entity.Construct;
import entity.ConstructItem;
import entity.Orders;
import org.apache.commons.lang.xwork.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import service.ConstructItemService;
import service.ConstructService;
import service.OrdersService;
import utils.ConstructStatus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by Liangying on 2018/5/31.
 */
@Controller
public class ConstructionController {
    @Autowired
    ConstructService constructService;
    @Autowired
    ConstructItemService constructItemService;
    @Autowired
    OrdersService ordersService;

    private DateFormat df = new SimpleDateFormat("yyyy-MM-dd E HH:mm:ss");

    @RequestMapping("/addConstruct")
    public String addConstruct(HttpServletRequest request,MultipartFile imageurl)throws IllegalStateException, IOException {
        int id=Integer.parseInt(request.getParameter("oid"));

        Construct construct = new Construct();
        construct.setOid(id);
        construct.setStatus(ConstructStatus.CONSTRUCT_APPLIED);
        return String.valueOf(constructService.add(construct));
    }

    @RequestMapping("/addConstructItem")
    public String addConstructItem(HttpServletRequest request,MultipartFile imageurl)throws IllegalStateException, IOException {
        MultipartHttpServletRequest multipartRequest
                = (MultipartHttpServletRequest) request;
        int cuid= Integer.parseInt(request.getParameter("id"));
        String info = multipartRequest.getParameter("info");
        Calendar c = Calendar.getInstance();
        int year = c.get(Calendar.YEAR);
        int month = c.get(Calendar.MONTH);
        int day = c.get(Calendar.DAY_OF_MONTH);
        int minute = c.get(Calendar.MINUTE);
        int second = c.get(Calendar.SECOND);
        String d = String.valueOf(year) +
                String.valueOf(month) +
                String.valueOf(day) +
                String.valueOf(minute) +
                String.valueOf(second);
        String imgname = d + RandomStringUtils.randomAlphabetic(10);
        String newFileName = imgname + ".jpg";
        String path = "D:\\Idea_Project\\graduation_design\\web\\upload\\construct";
        //       String path = request.getServletContext().getRealPath("/upload/aboutUs");
        File newFile = new File(path, newFileName);
        imageurl.transferTo(newFile);
        String imageUrl = "upload/construct/" + newFileName;
        Date date = new Date();
        ConstructItem constructItem = new ConstructItem();
        constructItem.setCuid(cuid);
        constructItem.setDate(df.format(date));
        constructItem.setImageurl(imageUrl);
        constructItem.setInfo(info);
        constructItemService.add(constructItem);
        Construct con = constructService.get(cuid);
        if(con.getStatus().equals(ConstructStatus.CONSTRUCT_APPLIED)){
            con.setStatus(ConstructStatus.CONSTRUCT_SERVICING);
            constructService.update(con);
        }
        return "redirect:/adminCheckConstruct?id="+cuid;
    }
    @RequestMapping("/listConstruct")
    public ModelAndView listConstruct(HttpServletRequest request, HttpSession httpSession){
        ModelAndView mav = new ModelAndView();
        int uid = (Integer)httpSession.getAttribute("Uid");
        List<Construct> constructs = constructService.list();
        List<Construct> constructList = new ArrayList<>();
        for(Construct c: constructs){
            Orders o = ordersService.get(c.getOid());
            if(o.getUid()==uid){
                constructList.add(c);
            }
        }
        mav.addObject("constructList",constructList);
        mav.setViewName("construct/listConstruct");
        return mav;
    }

    @RequestMapping("/adminListConstruct")
    public ModelAndView adminListConstruct(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();

        List<Construct> constructs = constructService.list();

        mav.addObject("constructList",constructs);
        mav.setViewName("construct/adminListConstruct");
        return mav;
    }

    @RequestMapping("/checkConstruct")
    public ModelAndView checkConstruct(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        int id = Integer.parseInt(request.getParameter("id"));
        Construct construct = constructService.get(id);
        mav.addObject("construct",construct);
        mav.setViewName("construct/checkConstruct");
        return mav;
    }

    @RequestMapping("/adminCheckConstruct")
    public ModelAndView adminCheckConstruct(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        int id = Integer.parseInt(request.getParameter("id"));
        Construct construct = constructService.get(id);
        mav.addObject("construct",construct);
        mav.setViewName("construct/adminCheckConstruct");
        return mav;
    }

    @RequestMapping("/adminConstructDone")
    @ResponseBody
    public String adminConstructDone(HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        Construct c = constructService.get(id);
        c.setStatus(ConstructStatus.CONSTRUCT_DONE);
        return String.valueOf(constructService.update(c));
    }
}
