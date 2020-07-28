package top.cxh.crud.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import top.cxh.crud.bean.Msg;
import top.cxh.crud.bean.User;
import top.cxh.crud.service.UserService;
import top.cxh.crud.utils.ImageVerificationCode;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	/**
	 * 获取图片验证码
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/get_code",method=RequestMethod.GET)
	public void getCode(HttpServletRequest request,HttpServletResponse response) {
		ImageVerificationCode image_code = new ImageVerificationCode();
		BufferedImage image = image_code.getImage();
		String text = image_code.getText();
		request.getSession().setAttribute("veri_code", text);
		try {
			ImageIO.write(image, "png", response.getOutputStream());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 登录
	 * @param user
	 * @param result
	 * @param veri_code
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/login",method=RequestMethod.GET)
	@ResponseBody
	public Msg login(@Valid User user,BindingResult result,
			@RequestParam("veri_code") String veri_code,
			HttpServletRequest request) {
		if(result.hasErrors()) {
			Map<String,Object> map = new HashMap<String,Object>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		}else {
			Msg msg = new Msg();
			String server_veri_code = (String) request.getSession().getAttribute("veri_code");
			if(!server_veri_code.toUpperCase().equals(veri_code.toUpperCase())) {
				msg.setMsg("验证码错误");
				msg.setCode(200);
				return msg;
			}
			boolean flag = userService.check_user_id(user.getUserId());
			if(!flag) {
				msg.setMsg("账号不存在");
				msg.setCode(200);
				return msg;
			}
			List<User> users = userService.check_password(user.getUserId(), user.getPassword());
			if(users.size() == 0) {
				msg.setMsg("密码错误");
				msg.setCode(200);
				return msg;
			}else {
				request.getSession().setAttribute("userId", user.getUserId());
				request.getSession().setAttribute("userName", users.get(0).getUserName());
				return Msg.success();
			}
		}
	}
	
	/**
	 * 退出
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	@ResponseBody
	public Msg logout(HttpServletRequest request,HttpServletResponse response) {
		try {
			request.getSession().invalidate();
			Cookie[] cookie=request.getCookies();
			for(Cookie c:cookie){
				if("autoLogin".equals(c.getName())){
					c.setMaxAge(0);
					response.addCookie(c);
				}
			}
			return Msg.success();
		}catch (Exception e){
			return Msg.fail();
		}
	}
	
	/**
	 * 跳转主页
	 * @return
	 */
	@RequestMapping(value="/toIndex",method = RequestMethod.GET)
	public String toIndex() {
		return "index";
	}
	

}
