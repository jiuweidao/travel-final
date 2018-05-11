package com.travel.realm;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.HashSet;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import com.sun.org.apache.xalan.internal.xsltc.compiler.Parser;
import com.travel.pojo.Users;
import com.travel.service.DecriptUtil;
import com.travel.service.UserService;
import com.travel.service.UserServiceImpl;

public class MyShiroRealm extends AuthorizingRealm {
	
	
	@Resource
	private UserService userService;

	/* 
	 * 授权
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) { 
        Set<String> roleNames = new HashSet<String>();  
        Set<String> permissions = new HashSet<String>();  
        roleNames.add("administrator");//添加角色 管理者
        permissions.add("newPage.jhtml");  //添加权限
        //通过用户名去获得用户的所有资源，并把资源存入info中
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo(roleNames);  
        info.setStringPermissions(permissions);  
        return info;  
	}
	
	/* 
	 * 登录验证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authcToken)  {
		
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		String loginName=token.getUsername();
		String loginPassword=String.valueOf(token.getPassword());
		Users newLoginer=null;
		boolean password=true;
		
		/*if (!loginPassword.equals("")) {
			newLoginer=userService.selectUser(loginName);
		}else {
			newLoginer=userService.selectUserByTeleMobile(loginName).getUser();
			password=false;
		}*/
		newLoginer=userService.selectByAll(loginName);
		if(newLoginer!=null){
			
			return new SimpleAuthenticationInfo(newLoginer.getTelemoble(), newLoginer.getPassword(), getName()); 
			
		}else{
			throw new AuthenticationException();  
		}
		
	}

  
}
