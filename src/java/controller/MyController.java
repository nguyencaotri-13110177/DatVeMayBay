package controller;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;



import dao.CustomerDAO;
import model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;


@Controller
public class MyController {
	/**
	 * Inject từ @Repository CustomerDAO
	 */
	
	private CustomerDAO dao;

	/**
	 * GET: register.ute
	 */ @RequestMapping(value="/register", method=RequestMethod.GET)
	 public String register(ModelMap model) {
		 model.addAttribute("user", new Customer());
		 return "Register";
	 }

	 /**
	  * POST: register.ute
	  */ @RequestMapping(value="/register", method=RequestMethod.POST)
	  public String register(ModelMap model,
			  @ModelAttribute("user") Customer user) {

		  try
		  { dao.insert(user);
		  return "Login";
		  }

		  catch(Exception ex){
			  model.addAttribute("errors", "User Name đã được sử dụng !");
			  return "Register";
		  }

	  }

	  /**
	   * GET: login.ute
	   */ @RequestMapping(value="/login", method=RequestMethod.GET)
	   public String login(ModelMap model) {
		   model.addAttribute("user", new Customer());
		   return "Login";
	   }

	   /**
	    * GET: login.ute
	    */ @RequestMapping(value="/login", method=RequestMethod.POST)
	    public String login(ModelMap model,
	    		@ModelAttribute("user") Customer user, HttpSession session)
	    				throws ClassNotFoundException,
	    				InstantiationException, IllegalAccessException {
	    	try{ Customer cust = dao.getById(user.getId());
	    	if(cust.getPassword().equals(user.getPassword())){
	    		session.setAttribute("username", user.getId());
	    		return "redirect:main.ute";
	    	}
	    	else{
	    		model.addAttribute("errors", "Sai mật khẩu !");
	    	}
	    	}
	    	catch(Exception ex){
	    		model.addAttribute("errors", "Sai mã đăng nhập !");
	    	}

	    	return "Login";
	    }

	    @RequestMapping(value = "/logout", method = RequestMethod.GET)
	    public String logout(HttpSession session) {
	    	session.removeAttribute("username");
	    	return "redirect:main.ute";
	    }

	    @RequestMapping(value="/main",method = RequestMethod.GET)
	    public String index(ModelMap mm)
	    {
	    	final String uri = "http://nguyencaotri.somee.com/api/sanbay";

	    	RestTemplate restTemplate = new RestTemplate();
	    	List<SanBay> listsanbay=Arrays.asList(restTemplate.getForObject(uri, SanBay[].class));

	    	mm.addAttribute("ListSanBay", listsanbay);
	    	mm.put("sb", new SanBay());

	    	return "index";
	    }
	    
	    @RequestMapping(value="/main1",method = RequestMethod.GET)
	    public String index(ModelMap mm,@RequestParam(value="thongbao") String thongbao)
	    {
	    	final String uri = "http://nguyencaotri.somee.com/api/sanbay";

	    	RestTemplate restTemplate = new RestTemplate();
	    	List<SanBay> listsanbay=Arrays.asList(restTemplate.getForObject(uri, SanBay[].class));


	    	mm.addAttribute("ListSanBay", listsanbay);
	    	mm.put("sb", new SanBay());
	    	mm.put("thongbao",thongbao);

	    	return "index";
	    }

	    @RequestMapping(value = "/timve", method = RequestMethod.POST)
	    public String timve(ModelMap mm,@RequestParam(value = "MaSanBayDi") String MaSanBayDi,@RequestParam(value = "MaSanBayDen") String MaSanBayDen,@RequestParam(value = "NgayDi") String NgayDi,HttpSession session)
	    {
	    	try{
	    		//-------------Cua VNAirLine----------------
		    	final String uri = "http://nguyencaotri.somee.com/api/ve?MaSanBayDi="+MaSanBayDi+"&MaSanBayDen="+MaSanBayDen+"&NgayDi="+NgayDi+"";

		    	RestTemplate restTemplate = new RestTemplate();
		    	List<KetQuaTimVe> listketquatimve=Arrays.asList(restTemplate.getForObject(uri, KetQuaTimVe[].class));		

		    	mm.addAttribute("ListKetQuaTimVe", listketquatimve);
		    	



		    	//---------------Khung tim ve ben canh----------------
		    	final String uri3 = "http://nguyencaotri.somee.com/api/sanbay";

		    	RestTemplate restTemplate3 = new RestTemplate();
		    	List<SanBay> listsanbay=Arrays.asList(restTemplate3.getForObject(uri3, SanBay[].class));


		    	mm.addAttribute("ListSanBay", listsanbay);
		    	mm.put("sb", new SanBay());

		    	//---------------luu các thông tin đặt vé vào sesion---------
		    	session.setAttribute("MaSanBayDi", MaSanBayDi);
		    	session.setAttribute("MaSanBayDen", MaSanBayDen);
		    	session.setAttribute("NgayDi", NgayDi);
		    	
		    	return "timve";
	    	}
	    	catch (Exception e) {
	    		mm.put("thongbao", "Vui lòng kiểm tra lại: sân bay đi phải khác sân bay đến, chắn chắn đã nhập ngày đi!");
	    		return "redirect:main1.ute";
			}
	    	
	    }

	    @RequestMapping(value = "/timve", method = RequestMethod.GET)
	    public String timve2(ModelMap mm,HttpSession session)
	    {
	    	String MaSanBayDi=(String) session.getAttribute("MaSanBayDi");
	    	String MaSanBayDen=(String) session.getAttribute("MaSanBayDen");
	    	String NgayDi=(String) session.getAttribute("NgayDi");
	    	//---------------lấy lại danh sách chuyến bay từ sesion trước---
	    	//-------------Cua VNAirLine----------------
	    	final String uri = "http://nguyencaotri.somee.com/api/ve?MaSanBayDi="+MaSanBayDi+"&MaSanBayDen="+MaSanBayDen+"&NgayDi="+NgayDi+"";

	    	RestTemplate restTemplate = new RestTemplate();
	    	List<KetQuaTimVe> listketquatimve=Arrays.asList(restTemplate.getForObject(uri, KetQuaTimVe[].class));
	    	


	    	mm.addAttribute("ListKetQuaTimVe", listketquatimve);
	    	//---------------đổ danh sách sân bay vào các selection----
	    	final String uri2 = "http://nguyencaotri.somee.com/api/sanbay";

	    	RestTemplate restTemplate2 = new RestTemplate();
	    	List<SanBay> listsanbay=Arrays.asList(restTemplate2.getForObject(uri2, SanBay[].class));

	    	mm.addAttribute("ListSanBay", listsanbay);
	    	mm.put("sb", new SanBay());
	    	
	    	


	    	return "timve";	

	    }




	    @RequestMapping(value = "/thongtindatve", method = RequestMethod.GET)
	    public String thongtindatve(ModelMap mm,@RequestParam(value = "MaChuyenBay") String MaChuyenBay,@RequestParam(value = "MaGhe") String MaGhe,@RequestParam(value = "Gia") String Gia,@RequestParam(value = "Hang") String Hang)
	    {
	    	final String uri = "http://nguyencaotri.somee.com/api/chuyenbay?id="+MaChuyenBay+"";

	    	RestTemplate restTemplate = new RestTemplate();
	    	ChuyenBay chuyenbay=restTemplate.getForObject(uri, ChuyenBay.class);

	    	mm.addAttribute("ChuyenBay", chuyenbay);
	    	mm.put("MaGhe", MaGhe);
	    	mm.put("Gia", Gia);
	    	mm.put("Hang", Hang);

	    	return "thongtindatve";
	    }
	    
	    
	    
	    
	    @RequestMapping(value = "/thongtindatve", method = RequestMethod.POST)
	    public String thongtindatve(ModelMap mm,@RequestParam(value = "ChonNhieu") String[] ChonNhieu,HttpSession session)
	    {
	    	List ds = new ArrayList<String>();
	    	List dsghe = new ArrayList<String>();
	    	List dsgia = new ArrayList<String>();
	    	List dshang = new ArrayList<String>();
	    	List<ChuyenBay> dschuyenbay=new ArrayList<ChuyenBay>();

	    	for(int i=0;i<ChonNhieu.length;i++)
	    	{
	    		if(ChonNhieu[i]!=null)
	    		{
	    			String[] words=ChonNhieu[i].split("\\s");//chia chuoi dua tren string phan cac nhau boi khoang trang (\\s) 
	    			//su dung vong lap foreach de in cac phan tu trong mang chuoi  
	    			for(String w:words){
	    				ds.add(w);
	    			}
	    		}
	    	}
	    	
	    	
		    	
	    		double tonggiave=0;
		    	mm.put("sove",ds.size()/4);
		    	
		    	
		    	for(int i=0;i<ds.size();i=i+4)
		    	{		    		
		    		String uri = "http://nguyencaotri.somee.com/api/chuyenbay?id="+ds.get(i)+"";

			    	RestTemplate restTemplate = new RestTemplate();
			    	ChuyenBay chuyenbay=restTemplate.getForObject(uri, ChuyenBay.class);

			    	tonggiave+=Double.parseDouble((String) ds.get(i+2));
			    	
			    	
			    	dschuyenbay.add(chuyenbay);
			    	dsghe.add(ds.get(i+1));
			    	dsgia.add(ds.get(i+2));
			    	dshang.add(ds.get(i+3));
			    	
			    	
		    	}
		    	
		    	mm.put("dschuyenbay", dschuyenbay);
		    	mm.put("dsghe", dsghe);
		    	mm.put("dsgia", dsgia);
		    	mm.put("dshang", dshang);
		    	
		    	NumberFormat formatter = NumberFormat.getCurrencyInstance();//định dạng format money
		    	mm.put("tonggiave",formatter.format(tonggiave));
		    	
		    	System.out.print(dschuyenbay.get(0).getNgayDi());
		    	
		    	
		    	//--------Giữ vé trên service
		    	for(int i=0;i<ds.size()/4;i++)
		    	{
		    		
		    		String UriGiuVe = "http://nguyencaotri.somee.com/api/ve?MaChuyenBay="+dschuyenbay.get(i).getMaChuyenBay()+"&MaGhe="+dsghe.get(i)+"";
		    		
		    		RestTemplate restTemplate = new RestTemplate();
		    		
		    		boolean a=false;
		    		a=restTemplate.getForObject(UriGiuVe, boolean.class);
		    		
		    		System.out.println(a);
		    	 }
		    	
		    	
		    	//------Thông báo thời gian giữ vé
		    	
		    	long ONE_MINUTE_IN_MILLIS=60000;//millisecs

		    	Calendar date = Calendar.getInstance();
		    	long t= date.getTimeInMillis();
		    	Date afterAddingTenMins=new Date(t + (2 * ONE_MINUTE_IN_MILLIS));
		    	
		    	
		    	mm.put("mssThoiGianGiuVe", "Thời gian giữ vé của quý khách đến hết "+afterAddingTenMins+", vui lòng hoàn thành thanh toán trước thời gian trên!");
		    	
		    	
	    	return "thongtindatve2";

	    }
	    
	    

	    /**
	     * GET: thanhtoan.ute
	     */ @RequestMapping(value="/thanhtoan", method=RequestMethod.GET)
	     public String thanhtoan(ModelMap model) {
	    	 return "thanhtoan";
	     }

	     @RequestMapping(value="/quanly1",method = RequestMethod.GET)
	     public String quanly(ModelMap mm,@RequestParam(value = "thongbao") String thongbao)
	     {
	    	 mm.put("thongbao", thongbao);
	    	 return "quanly";
	     }
	     
	     @RequestMapping(value="/quanly",method = RequestMethod.GET)
	     public String quanly(ModelMap mm)
	     {
	    	 return "quanly";
	     }

	     @RequestMapping(value="/guiemail",method = RequestMethod.POST)
	     public String guiemail(ModelMap mm,@RequestParam(value = "EmailNhan") String EmailNhan,@RequestParam(value = "Subject") String Subject,@RequestParam(value = "NoiDung") String NoiDung)
	     {
	    	 
	    	 
	    	 String user = "nguyencaotri1995@gmail.com";
	    	 String pass = "19951879tri3";

	    	 Properties props = new Properties();
	    	 props.put("mail.smtp.host", "smtp.gmail.com");
	    	 props.put("mail.smtp.port", "587");		
	    	 props.put("mail.smtp.auth", "true");
	    	 props.put("mail.smtp.starttls.enable", "true");
	    	 
	    	 Session session = Session.getInstance(props,new javax.mail.Authenticator()
	           {
	         	  protected PasswordAuthentication getPasswordAuthentication() 
	         	  {
	         	 	 return new PasswordAuthentication(user,pass);
	         	  }
	          });
	    	 
	    	 try
	          {
	        
	        	/* Create an instance of MimeMessage, 
	        	      it accept MIME types and headers 
	        	   */
	        
	           MimeMessage me = new MimeMessage(session);
	           me.setFrom(new InternetAddress(user));
	           me.addRecipient(Message.RecipientType.TO,new InternetAddress(EmailNhan));
	           me.setSubject(Subject);
	           me.setText(NoiDung);

	              /* Transport class is used to deliver the message to the recipients */
	              
	              Transport.send(me);
	              mm.put("thongbao", "<h2 style="+"color:green"+"><b>sent successfully &#x2713;</b></h2>");
	          }
	          catch(Exception e)
	          {
	          	 e.printStackTrace();
	          	 mm.put("thongbao", "<h2 style="+"color:red"+"><b>! send failed</b></h2>");
	          }
	        
	    	 return "redirect:quanly1.ute";
	     }
}