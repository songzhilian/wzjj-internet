package com.sunland.wzjj.controller.admin;

import com.sunland.frame.enumerate.EnumJsonResult;
import com.sunland.wzjj.common.utils.MD5PwdUtil;
import com.sunland.wzjj.dto.admin.JsonResultDto;
import com.sunland.wzjj.dto.admin.LoginDto;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by xdb on 2016/4/17.
 *
 * 登录相关Controller
 */

@Controller
@RequestMapping(value = "/bxlogin")
public class LoginController {

    @RequestMapping(value = "login")
    @ResponseBody
    public JsonResultDto login(@RequestBody LoginDto loginDto, HttpServletRequest request, HttpServletResponse response){

        Subject currentUser = SecurityUtils.getSubject();

        //获取基于用户名和密码的令牌
        UsernamePasswordToken token = new UsernamePasswordToken(loginDto.getYhdm(), MD5PwdUtil.encodePassword(loginDto.getMm()));
        //subject权限对象
        Subject subject = SecurityUtils.getSubject();
        try{
            //这句是提交申请，验证能不能通过。这里会回调reaml里的一个方法
            // 回调doGetAuthenticationInfo，进行认证
            subject.login(token);
        }catch (Exception ex){
            return new JsonResultDto(EnumJsonResult.LOGIN_FAILED.getValue(),EnumJsonResult.LOGIN_FAILED.getText());
        }
        return new JsonResultDto(EnumJsonResult.LOGIN_SUCCESS.getValue(),""); //登录成功
    }

    @RequestMapping(value = "logout")
    public String logout(){
        Subject currentUser = SecurityUtils.getSubject();
        currentUser.logout();
        return "redirect:/acd";
    }
}
