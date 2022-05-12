package com.hobbycam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.users.model.UsersDAO;
import com.hobbycam.users.model.UsersDTO;

import java.util.List;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.*;

@Controller
public class UsersController {
	
	@Autowired
	UsersDAO usersDao;
	
	@Autowired
	private JavaMailSender mailSender;
	
	 private static final String SMTP_HOST_NAME = "smtp.gmail.com";
	 private static final String SMTP_AUTH_USER = "lemoni3710@gmail.com";
	 private static final String SMTP_AUTH_PWD  = "hobbyCampus";

	 
	 @RequestMapping("/userTest.do")
	 public ModelAndView userTest() {
			 ModelAndView mav=new ModelAndView();
			 mav.setViewName("users/userTest");
			 return mav;
	 }
	 
	 
	 
	 
	 
	//change page emailCheck
	@RequestMapping("/userJoin.do")
	public ModelAndView usersJoin() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("users/userJoin2");
		return mav;
	}
	
	// emailCheck
		@RequestMapping("/userEmailCheck.do")
		public ModelAndView usersEmailCheck(String email) {
		
			ModelAndView mav=new ModelAndView();
			int count=usersDao.usersEmailCheck(email);
			
			String msg="";
			if(count>0) {
				msg="이미 가입하거나 탈퇴한 email입니다.";
				
			} else if(count==0) {
				try {
					emailSend(email);
					msg="인증 메일을 확인해 주세요";
					
				} catch (Exception e) {
					e.printStackTrace();
					msg="메일주소를 다시 확인해 주세요 ";
				}
			}
			 
			mav.addObject("msg",msg);
			mav.setViewName("users/userMsg");
			return mav;
		}
	
	
		   //email Send
        public void emailSend(String email) throws Exception{
            //int code=(int)(Math.random()*10000);
             Properties props = new Properties();
             props.put("mail.transport.protocol", "smtp");
             props.put("mail.smtp.host", SMTP_HOST_NAME);
             props.put("mail.smtp.auth", "true");
             props.put("mail.smtp.port", "587");
             props.put("mail.smtp.starttls.enable", "true");
             props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
             props.put("mail.smtp.ssl.protocols", "TLSv1.2");

             Authenticator auth = new SMTPAuthenticator();
             Session mailSession = Session.getDefaultInstance(props, auth);
             Transport transport = mailSession.getTransport();

             MimeMessage message = new MimeMessage(mailSession);
             message.setSubject("hobbyCampus 입니다~ ^^");
             String content = "인증을 진행해 주세요~  "
                   +"<a href='http://localhost:9090/hobbycampus/userEmail.do?email="+email+"'>"
                   + "클릭클릭</a> ^^";
             message.setContent(content,"text/html;charset=utf-8");
             message.setFrom(new InternetAddress(SMTP_AUTH_USER));
             message.addRecipient(Message.RecipientType.TO,
                  new InternetAddress(email));

             transport.connect();
             transport.sendMessage(message,
                 message.getRecipients(Message.RecipientType.TO));
             transport.close();
         }

		   
		   //mail Authenticator
		    private class SMTPAuthenticator extends javax.mail.Authenticator {
		        public PasswordAuthentication getPasswordAuthentication() {
		           String username = SMTP_AUTH_USER;
		           String password = SMTP_AUTH_PWD;
		           return new PasswordAuthentication(username, password);
		        }
		    }
		
		
	//after email Check
	@RequestMapping("/userEmail.do" )
		public ModelAndView usersEmail(String email) {
			ModelAndView mav=new ModelAndView();
			System.out.println(email);
			mav.addObject("u_email",email);
			mav.setViewName("users/userJoin");
			return mav;
	}
	
	
	// nameCheck
	@RequestMapping("/userNameCheck.do")
	public ModelAndView usersNameCheck(String name) {
		ModelAndView mav=new ModelAndView();

		int count=usersDao.usersNameCheck(name);
		String msg=count>0?"이미 있는 닉네임입니다.":"사용 가능한 닉네임입니다.";
		
		mav.addObject("msg",msg);
		
		//boolean result=count==0?true:false;
		//mav.addObject("result",result);
		mav.setViewName("users/userMsg");
		return mav;
	}
	
	//email join
	@RequestMapping(value="/userEmailJoin.do",method = RequestMethod.POST)
	public ModelAndView usersEmailJoin(UsersDTO dto, 
	@RequestParam("upload") MultipartFile upload /*, HttpServletRequest request, HttpServletResponse response_email*/) {

		//file Upload and dto.setU_img	
		if (upload.isEmpty()) {
				dto.setU_img("img/user.png");
		} else {
			String imgname=copyInto(dto.getU_email(), upload);
			dto.setU_img(imgname);
		}
			  
		//emailJoin
		dto.setU_img("img/user.png");
		int count=usersDao.usersEmailJoin(dto);
		
		String msg=count>0?"가입 완료":"가입 실패";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("users/usersMsg");
		
		return mav;
	}
	
	
	//profile file copy method
		public String copyInto(String email,/*@RequestParam("upload")*/ MultipartFile upload) {

			String filename = upload.getOriginalFilename();
			String file4= filename.substring(filename.length()-4, filename.length());
			String imgname=email+file4;
				
			try {
				byte bytes[]=upload.getBytes();
				File f=new File("D:\\final\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\hobbycampus\\img\\users\\"+imgname);
				FileOutputStream fos=new FileOutputStream(f);
				fos.write(bytes);
				fos.close();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			return imgname;
		}

		
	
	//kakao login
	@RequestMapping("/userKakaoLogin.do")
	public ModelAndView usersKakaoLogin() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("users/userKakaoLogin");
		return mav;
	}
	

	@RequestMapping(value="/userLogin.do",method = RequestMethod.GET)
	public ModelAndView usersLoginForm() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("users/usersLogin");
		return mav;
	}
	    
	
	    /**Login */
	    @RequestMapping(value="/userLogin.do", method = RequestMethod.POST)
	    public ModelAndView userLogin(String u_email,String u_pwd, 
	    	HttpSession session, String savemail, HttpServletResponse resp) {
	    	ModelAndView mav=new ModelAndView();

	    	int count=usersDao.usersLogin(u_email, u_pwd);
	
	    	if(count==usersDao.DEL) {
	    		mav.addObject("msg","탈퇴한 이메일입니다.");
	    		mav.setViewName("users/usersMsg");
	    		
	    	} else
	    	
	    	if(count==usersDao.LOGIN_OK) {
	    		UsersDTO dto=usersDao.usersname(u_email);
	    		int u_idx=dto.getU_idx();
	    		Integer t_idx=usersDao.usersTidx(u_idx);
	    	
	    		String u_name=dto.getU_name();
	    		
	    		session.setAttribute("u_name", u_name);
	    		session.setAttribute("u_idx", dto.getU_idx());
	    		
	    		if(t_idx!=null) {
	    			session.setAttribute("t_idx", t_idx);
	    			System.out.println("tidx 세션 저장됨 ");
	    		}
	    		
	    		System.out.println(t_idx);
	    		
	    		if(savemail==null) {
	    			Cookie ck=new Cookie("savemail", u_email);
	    			ck.setMaxAge(0);
	    			resp.addCookie(ck);
	    			
	    		} else {
	    			Cookie ck=new Cookie("savemail", u_email);
	    			ck.setMaxAge(60*60*24*30);
	    			resp.addCookie(ck);
	    		}
	    		
	    		mav.addObject("msg",u_name+"님 환영합니다.");
	    		mav.addObject("u_name",u_name);
	    		mav.setViewName("users/usersMsg");
	    	} else if(count==usersDao.NOT_ID||count==usersDao.NOT_PWD) {
	    		mav.addObject("msg","이메일 혹은 비밀번호를 확인해 주세요");
	    		mav.setViewName("users/usersMsg");
	    		
	    	} else {
	    		mav.addObject("msg","로그인 할 수 없습니다. 고객센터에 전화주세요");
	    		mav.setViewName("users/usersMsg");
	    	}
	    	
	    	return mav;
	    }
	    
	
	@RequestMapping("/userLogout.do")
	public ModelAndView usersLogout(HttpServletRequest req) {
		HttpSession session=req.getSession();
		session.invalidate();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg","로그아웃되었습니다.");
		mav.setViewName("users/usersMsg");
		return mav;
	}
	
	@RequestMapping("/userUpForm.do")
	public ModelAndView userUpForm(HttpServletRequest req) {
		ModelAndView mav=new ModelAndView();
		
		HttpSession session=req.getSession();
		int idx=(int)session.getAttribute("u_idx");
		UsersDTO dto= usersDao.userUpForm(idx);
		
		
		mav.addObject("dto",dto);
		mav.setViewName("users/userUp");
		
		return mav;
	}
	

	@RequestMapping(value="/userUp.do" ,method = RequestMethod.POST)
	public ModelAndView userUp(UsersDTO dto, @RequestParam("upload") MultipartFile upload, HttpServletRequest req) {
		ModelAndView mav=new ModelAndView();
		
		HttpSession session=req.getSession();
		int idx=(int)session.getAttribute("u_idx");
		dto.setU_idx(idx);
		
		
	if (!upload.isEmpty()) {
		String imgname=copyInto(dto.getU_email(), upload);
		dto.setU_img(imgname);
	}
		
		int count=usersDao.userUp(dto);
		String msg=count>0?"회원정보가 수정되었습니다.":"수정 불가합니다.";
		if(count>0) {
			session.setAttribute("u_name", dto.getU_name());
		}		
		
		mav.addObject("msg",msg);
		mav.setViewName("users/usersMsg");
		
		return mav;
	}
	
	
	@RequestMapping("/userDel.do")
	public ModelAndView userDel(HttpServletRequest req) {
		ModelAndView mav=new ModelAndView();
		HttpSession session=req.getSession();
		int idx=(int)session.getAttribute("u_idx");
		System.out.println("u_idx="+idx);
		
		int count=usersDao.userDel(idx);
		
		String msg=count>0?"탈퇴 완료되었습니다.":"탈퇴할 수 없습니다.";
		
		session.invalidate();
		
		mav.addObject("msg",msg);
		mav.setViewName("users/usersMsg");
		
		return mav;
	}
	

	    /*	
	//email send nouse
	public ModelAndView mailSend(HttpServletRequest request, String email, HttpServletResponse response_email) throws IOException, ParseException{
		System.out.println("mailSender 시작");
		Random ran=new Random();
		int num=ran.nextInt(4589362)+49311;
		
		String fromemail="lemoni3710@gmail.com";
		String subject="회원가입 인증 이메일 입니다.";
		String content="hobbyCampus 인증 메일입니다. 인증번호는 "+num+"입니다";
		System.out.println("mimeMessage 만들기");
		try {
			MimeMessage message=mailSender.createMimeMessage();
			System.out.println("MimeMessagehelper 시작");
			MimeMessageHelper messageHelper=new MimeMessageHelper(message,true,"utf-8");

			messageHelper.setFrom(fromemail);
			messageHelper.setTo(email);
			messageHelper.setSubject(subject);
			messageHelper.setText(content,"utf-8");
			
			System.out.println("send");
			mailSender.send(message);
			
			System.out.println("메세지좀 보내라");
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg1",num);
		mav.setViewName("users/userEmailCheck");
		response_email.setContentType("text/html; charset=UTF-8");
		PrintWriter out_email = response_email.getWriter();
		out_email.flush();
				
		return mav;
	}


	// email send - no use
	public ModelAndView emailSend(String email, HttpServletRequest request) {
		System.out.println("컨트롤러로 넘어감");
		ModelAndView mav=new ModelAndView();
		String msg1=usersDao.mailSend(email,request);
		mav.addObject(msg1);
		mav.setViewName("users/userEmailCheck");
		return mav;
	}
	
	*/
}