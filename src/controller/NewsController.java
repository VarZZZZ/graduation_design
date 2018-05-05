package controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import entity.News;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.NewsService;
import utils.Page;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * Created by Liangying on 2018/5/2.
 */
@Controller
public class NewsController {
    @Autowired
    NewsService newsService;


    @RequestMapping("addNews")
    public ModelAndView addNews(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();

        String title = request.getParameter("titleCreate");
        String content = request.getParameter("contentCreate");

        Date dat = new Date();

        News news = new News();
        news.setTitle(title);
        news.setContent(content);
        news.setDate(dat.toString());
        newsService.add(news);
        mav.setViewName("redirect:/newsList");
        return mav;
    }

    @RequestMapping("/newsList" )
    public ModelAndView newsList(Page page,HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        PageHelper.offsetPage(page.getStart(), 10);
        List<News> newsList;
        String status = request.getParameter("status");
        String name = request.getParameter("queryText");
        if(name == null || "".equals(name)){
            newsList = newsService.list();
        }else{
            newsList=newsService.listByTitle(name);
        }

        if(newsList.size()==0){
            page.setStart(0);
            page.setIsNull(true);
        }
        int total = (int) new PageInfo<>(newsList).getTotal();
        page.caculateLast(total);
        int pageCount = page.getPageCount(total);
        int currentPage = page.getCurrentPage(page.getStart(),
                page.getIsNull());
        mav.addObject("pageCount", pageCount);
        mav.addObject("currentPage", currentPage);
        mav.addObject("name",name);
        mav.addObject("newsList",newsList);
        if(status!=null)
            mav.setViewName("news/newsList");
        else
            mav.setViewName("news/adminNewsList");
        return mav;
    }

    @RequestMapping("/newsDetails")
    public ModelAndView infoDetails(HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        News news = newsService.get(id);
        ModelAndView mav = new ModelAndView();
        String status = request.getParameter("status");
        mav.addObject("news",news);
        if (status != null) {
            mav.setViewName("news/newsDetails");
        } else {
            mav.setViewName("news/adminNewsDetails");
        }
        return mav;
    }
    @RequestMapping("/updateNews")
    public  ModelAndView updateNews(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();

        String headline = request.getParameter("titleUpdate");
        String content = request.getParameter("contentUpdate");

        News infor = new News();
        infor.setTitle(headline);
        infor.setContent(content);
        newsService.update(infor);

        mav.setViewName("redirect:/newsList");
        return mav;
    }

    @RequestMapping("/deleteNews")
    @ResponseBody
    public String deleteInfor(HttpServletRequest request, String NewsObj) {
        News i= JSON.parseObject(
                NewsObj, News.class);

        int rel=newsService.delete(i.getId());
        return String.valueOf(rel);
    }

}
