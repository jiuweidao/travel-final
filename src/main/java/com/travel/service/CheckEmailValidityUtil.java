package com.travel.service;


  
import java.io.IOException;

import org.apache.commons.net.smtp.SMTPClient;  
import org.apache.commons.net.smtp.SMTPReply;  
import org.apache.log4j.Logger;  
import org.xbill.DNS.Lookup;  
import org.xbill.DNS.Record;  
import org.xbill.DNS.Type;  

/** 
 *  
 * 校验邮箱：1、格式是否正确 2、是否真实有效的邮箱地址 
 * 步骤： 
 * 1、从dns缓存服务器上查询邮箱域名对应的SMTP服务器地址 
 * 2、尝试建立Socket连接 
 * 3、尝试发送一条消息给SMTP服务器 
 * 4、设置邮件发送者 
 * 5、设置邮件接收者 
 * 6、检查响应码是否为250(为250则说明这个邮箱地址是真实有效的) 
 * @author Michael Ran 
 * 
 */  
public class CheckEmailValidityUtil {  
    private static final Logger logger = Logger.getLogger(CheckEmailValidityUtil.class);  
    /** 
     * @param email 待校验的邮箱地址 
     * @return 
     */  
    public static boolean isEmailValid(String email) {  
//        if (!email.matches("[\\w\\.\\-]+@([\\w\\-]+\\.)+[\\w\\-]+")) {  
//            logger.error("邮箱（"+email+"）校验未通过，格式不对!");  
//            return false;  
//        }  
        String host = "";  
        String hostName = email.split("@")[1];  
        //Record: A generic DNS resource record. The specific record types   
        //extend this class. A record contains a name, type, class, ttl, and rdata.  
        Record[] result = null;  
        SMTPClient client = new SMTPClient();  
        try {  
            // 查找DNS缓存服务器上为MX类型的缓存域名信息  
            Lookup lookup = new Lookup(hostName, Type.MX);  
            lookup.run();  
            if (lookup.getResult() != Lookup.SUCCESSFUL) {//查找失败  
                logger.error("邮箱（"+email+"）校验未通过，未找到对应的MX记录!");  
                return false;  
            } else {//查找成功  
                result = lookup.getAnswers();  
            }  
            //尝试和SMTP邮箱服务器建立Socket连接  
            for (int i = 0; i < result.length; i++) {  
                host = result[i].getAdditionalName().toString();  
                logger.info("SMTPClient try connect to host:"+host);  
                  
                //此connect()方法来自SMTPClient的父类:org.apache.commons.net.SocketClient  
                //继承关系结构：org.apache.commons.net.smtp.SMTPClient-->org.apache.commons.net.smtp.SMTP-->org.apache.commons.net.SocketClient  
                //Opens a Socket connected to a remote host at the current default port and   
                //originating from the current host at a system assigned port. Before returning,  
                //_connectAction_() is called to perform connection initialization actions.   
                //尝试Socket连接到SMTP服务器  
                client.connect(host);  
                //Determine if a reply code is a positive completion response（查看响应码是否正常）.   
                //All codes beginning with a 2 are positive completion responses（所有以2开头的响应码都是正常的响应）.   
                //The SMTP server will send a positive completion response on the final successful completion of a command.   
                if (!SMTPReply.isPositiveCompletion(client.getReplyCode())) {  
                    //断开socket连接  
                    client.disconnect();  
                    continue;  
                } else {  
                    logger.info("找到MX记录:"+hostName);  
                    logger.info("建立链接成功："+hostName);  
                    break;  
                }  
            }  
            logger.info("SMTPClient ReplyString:"+client.getReplyString());  
            String emailSuffix="163.com";  
            String emailPrefix="ranguisheng";  
            String fromEmail = emailPrefix+"@"+emailSuffix;   
            //Login to the SMTP server by sending the HELO command with the given hostname as an argument.   
            //Before performing any mail commands, you must first login.   
            //尝试和SMTP服务器建立连接,发送一条消息给SMTP服务器  
            client.login(emailPrefix);  
            logger.info("SMTPClient login:"+emailPrefix+"...");  
            logger.info("SMTPClient ReplyString:"+client.getReplyString());  
              
            //Set the sender of a message using the SMTP MAIL command,   
            //specifying a reverse relay path.   
            //The sender must be set first before any recipients may be specified,   
            //otherwise the mail server will reject your commands.   
            //设置发送者，在设置接受者之前必须要先设置发送者  
            client.setSender(fromEmail);  
            logger.info("设置发送者 :"+fromEmail);  
            logger.info("SMTPClient ReplyString:"+client.getReplyString());  
  
            //Add a recipient for a message using the SMTP RCPT command,   
            //specifying a forward relay path. The sender must be set first before any recipients may be specified,   
            //otherwise the mail server will reject your commands.   
            //设置接收者,在设置接受者必须先设置发送者，否则SMTP服务器会拒绝你的命令  
            client.addRecipient(email);  
            logger.info("设置接收者:"+email);  
            logger.info("SMTPClient ReplyString:"+client.getReplyString());  
            logger.info("SMTPClient ReplyCode："+client.getReplyCode()+"(250表示正常)");  
            if (250 == client.getReplyCode()) {  
                return true;  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        } finally {  
            try {  
                client.disconnect(); 
            } catch (IOException e) {  
            }  
        }  
        return false;  
    }  
}  