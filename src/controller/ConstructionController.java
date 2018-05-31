package controller;

import entity.Construct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.ConstructItemService;
import service.ConstructService;
import utils.ConstructStatus;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Liangying on 2018/5/31.
 */
@Controller
public class ConstructionController {
    @Autowired
    ConstructService constructService;
    @Autowired
    ConstructItemService constructItemService;

    @RequestMapping("/addConstruct")
    @ResponseBody
    public String addConstruct(HttpServletRequest request){
        int id=Integer.parseInt(request.getParameter("oid"));
        Construct construct = new Construct();
        construct.setOid(id);
        construct.setStatus(ConstructStatus.CONSTRUCT_APPLIED);
        return String.valueOf(constructService.add(construct));
    }
}
