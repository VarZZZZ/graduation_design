package controller;

import com.alibaba.fastjson.JSON;
import entity.Cart;
import entity.CartItem;
import entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.CartItemService;
import service.CartService;
import service.OrdersService;
import viewmodel.CartVM;

import javax.servlet.http.HttpSession;

@Controller
public class CartController {
	@Autowired
    CartService cartService;
	
	@Autowired
    CartItemService cartItemService;
	
	@Autowired
	OrdersService ordersService;
	
	@RequestMapping("/listCart")
	public ModelAndView listCart(HttpSession httpSession) {
		ModelAndView mav = new ModelAndView();
	
		float total=0;
		if(httpSession.getAttribute("Uid")==null) {
			mav.addObject("cart", null);
		}else {
			int uid = (Integer)httpSession.getAttribute("Uid");
			Cart cart=cartService.getCartByUid(uid);
			mav.addObject("cart", cart);
			total=cartService.getTotal(cart.getId());
		}
		
		mav.addObject("total", total);
		mav.setViewName("cart/list");
        return mav;
	}
	
	@RequestMapping("/addCart")
	@ResponseBody
	public String addCart(String cartObj,HttpSession httpSession)throws Exception {
		CartVM cartVM= JSON.parseObject(
				cartObj, CartVM.class);
		
		int uid = (Integer)httpSession.getAttribute("Uid");
		Cart cart=cartService.getCartByUid(uid);
		Product product=new Product();
		product.setId(cartVM.getPid());

		CartItem cartItem=cartItemService.getByProductCart(cartVM.getPid(), cart.getId());
		
		int rel=0;
		
		if(cartItem!=null) {
			cartItem.setNumber(cartItem.getNumber()+1);
			rel=cartItemService.update(cartItem);
		}else {
			CartItem ci=new CartItem();
			ci.setNumber(1);
			ci.setCart(cart);
			ci.setProduct(product);
			rel=cartItemService.add(ci);
		}
		return String.valueOf(rel);
	}
	@RequestMapping("/updateCartItem")
	@ResponseBody
	public String updateCartItem(String cartItemObj) {
		CartItem cartItem= JSON.parseObject(
				cartItemObj, CartItem.class);
		
		CartItem c=cartItemService.get(cartItem.getId());
		c.setNumber(cartItem.getNumber());
		
		int rel=cartItemService.update(c);
		
		return String.valueOf(rel);
	}
	@RequestMapping("/deleteCartItem")
	@ResponseBody
	public String deleteCartItem(String cartItemObj) {
		CartItem cartItem= JSON.parseObject(
				cartItemObj, CartItem.class);
		
		int rel=cartItemService.delete(cartItem.getId());
		
		return String.valueOf(rel);
	}
	
	@RequestMapping("/addToOrders")
	@ResponseBody
	public String addToOrders(HttpSession httpSession) {
		int uid = (Integer)httpSession.getAttribute("Uid");
		int rel=ordersService.addToOrders(uid);
		
		return String.valueOf(rel);
	}
}
