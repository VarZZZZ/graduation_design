package controller;


import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import entity.CategoryA;
import entity.CategoryB;
import entity.Product;
import org.apache.commons.lang.xwork.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import service.CategoryAService;
import service.CategoryBService;
import service.ProductService;
import utils.OtherUtil;
import utils.Page;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by Liangying on 2018/4/25.
 */
@Controller
public class ProductController {

    @Autowired
    ProductService productService;
    @Autowired
    CategoryBService categoryBService;

    @Autowired
    CategoryAService categoryAService;

    @RequestMapping("/productSet")
    public ModelAndView productSet(Page page, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        PageHelper.offsetPage(page.getStart(), 5);
        List<Product> products;
        String name = request.getParameter("queryText");
        if (name == null || "".equals(name))
            products = productService.list();
        else
            products = productService.listByName(name);
        if (products.size() == 0) {
            page.setStart(0);
            page.setIsNull(true);
        }
        int total = (int) new PageInfo<>(products).getTotal();
        page.caculateLast(total);
        int pageCount = page.getPageCount(total);
        int currentPage = page.getCurrentPage(page.getStart(),
                page.getIsNull());
        mav.addObject("pageCount", pageCount);
        mav.addObject("currentPage", currentPage);

        List<CategoryB> categoryBs = categoryBService.list();
        mav.addObject("categorybBs", categoryBs);
        mav.addObject("products", products);
        mav.addObject("name", name);
        mav.setViewName("product/adminList");
        return mav;
    }

    @RequestMapping("/listProduct")
    public ModelAndView listProduct(HttpServletRequest request) throws Exception {
        ModelAndView mav = new ModelAndView();
        String categoryA = request.getParameter("categoryA");
        String categoryB = request.getParameter("categoryB");

        List<CategoryA> categoryAS = categoryAService.listCategoryB();
        List<CategoryB> categoryBS;
        List<Product> products = new ArrayList<>();
        if (categoryA == null) {
            products = productService.list();
        } else if (categoryB == null) {                   //出现问题,可能是三表联立xml的错误.ca中的product属性值为空
            CategoryA ca = categoryAService.listProducts(categoryAService.getByName(categoryA).getId());
            List<CategoryB> cbs = categoryBService.listByCa(ca.getId());
            for (CategoryB cb : cbs) {
                List<Product> ps = new ArrayList<>();
                ps = categoryBService.listProducts(cb.getId()).getProducts();
                products.addAll(ps);
            }
        } else {
            CategoryB cb = categoryBService.listProducts(categoryBService.getByName(categoryB).getId());
            try {
                products = cb.getProducts();
            } catch (NullPointerException e) {
            }
        }
        mav.addObject("products", products);
        mav.addObject("categoryA", categoryA);
        mav.addObject("categoryB", categoryB);
        mav.addObject("categoryAs", categoryAS);
        mav.setViewName("product/list");
        return mav;
    }

    @RequestMapping("/searchProduct")
    public String searchProduct(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        String name = request.getParameter("search_keywords");
        Product product;
        if (name == null || "".equals(name)) {
            return "redirect:/listProduct";
        } else {
            product = productService.getByName(name);
            if (product == null)
                return "redirect:/listProduct";
            return "redirect:/theProduct?pid=" + product.getId();
        }


    }

    @RequestMapping("/theProduct")
    public ModelAndView theProduct(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        String pid = request.getParameter("pid");
        Product p = productService.get(Integer.parseInt(pid));
        List<CategoryA> categoryAS = categoryAService.listCategoryB();

        mav.addObject("theProduct", p);
        mav.addObject("categoryAs", categoryAS);
        mav.addObject("categoryA", p.getCategoryA());
        mav.addObject("categoryB", p.getCategoryB());
        mav.setViewName("product/theProduct");
        return mav;
    }

    @RequestMapping("/addProduct")
    @ResponseBody
    public ModelAndView addProduct(HttpServletRequest request, MultipartFile imageurlCreate) throws IllegalStateException, IOException {
        ModelAndView mav = new ModelAndView();

        MultipartHttpServletRequest multipartRequest
                = (MultipartHttpServletRequest) request;
        String code = multipartRequest.getParameter("codeCreate");
        String name = multipartRequest.getParameter("nameCreate");
        String price = multipartRequest.getParameter("priceCreate");
        String cbid = multipartRequest.getParameter("cbidCreate");
        String description = multipartRequest.getParameter("descriptionCreate");
        String color = multipartRequest.getParameter("colorCreate");
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
        String path = "D:\\Idea_Project\\graduation_design\\web\\upload\\product";
        //       String path = request.getServletContext().getRealPath("/upload/aboutUs");
        File newFile = new File(path, newFileName);
        imageurlCreate.transferTo(newFile);

        String imageUrl = "upload/product/" + newFileName;
        Product p = new Product();
        p.setCode(code);
        p.setName(name);
        p.setCbid(Integer.parseInt(cbid));
        p.setPrice(Float.parseFloat(price));
        p.setImageurl(imageUrl);
        p.setDescription(description);
        p.setColor(color);
        productService.add(p);

        mav.setViewName("redirect:/productSet");
        return mav;
    }

    @RequestMapping("/updateProduct")
    @ResponseBody
    public ModelAndView updateProduct(HttpServletRequest request, MultipartFile imageurlUpdate) throws IllegalStateException, IOException {
        ModelAndView mav = new ModelAndView();

        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        String id = multipartRequest.getParameter("idUpdate");
        String code = multipartRequest.getParameter("codeUpdate");
        String name = multipartRequest.getParameter("nameUpdate");
        String price = multipartRequest.getParameter("priceUpdate");
        String cbid = multipartRequest.getParameter("cbidUpdate");
        String description = multipartRequest.getParameter("descriptionUpdate");
        String color = multipartRequest.getParameter("colorUpdate");

        Product p = productService.get(Integer.parseInt(id));
        String url = p.getImageurl();

        String imageUrl = "";
        if (imageurlUpdate.isEmpty()) {
            imageUrl = url;
        } else {
            if (url == null || url.equals("")) {
            } else {
                File file = new File(OtherUtil.pro_imgpath, url);
                if (file.exists() && file.isFile())
                    file.delete();
            }
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
            File newFile = new File(OtherUtil.pro_imgpath, newFileName);
            imageurlUpdate.transferTo(newFile);

            imageUrl = "upload/product/" + newFileName;

        }

        Product product = new Product();
        product.setId(Integer.parseInt(id));
        product.setCode(code);
        product.setName(name);
        product.setPrice(Float.parseFloat(price));
        product.setCbid(Integer.parseInt(cbid));
        product.setImageurl(imageUrl);
        product.setDescription(description);
        product.setColor(color);
        productService.update(product);

        mav.setViewName("redirect:/productSet");
        return mav;
    }

    @RequestMapping("/deleteProduct")
    @ResponseBody
    public String deleteProduct(HttpServletRequest request, String productObj) {
        Product p = JSON.parseObject(
                productObj, Product.class);
        Product product = productService.get(p.getId());
        String imageUrl = product.getImageurl();
        if (imageUrl == null || imageUrl.equals("")) {

        } else {
            String path = request.getServletContext().getRealPath("/");
            File file = new File(path, imageUrl);
            if (file.exists() && file.isFile()) {
                file.delete();
            }
        }
        int rel = productService.delete(product.getId());
        return String.valueOf(rel);
    }
}
