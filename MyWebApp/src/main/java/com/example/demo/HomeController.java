package com.example.demo;

import java.io.IOException;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.dao.DAO;
import com.example.model.Admin;
import com.example.model.Form;



@Controller
public class HomeController implements ErrorController  {
	
	DAO d = new DAO();
	
	// Begins --------------------Basic Navigation Methods
	
	@RequestMapping("/") //Home Page//
	public ModelAndView Home(HttpServletRequest req, HttpServletResponse resp) {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("login") //Directs To Login Page //
	public ModelAndView login() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
	}
	
	@PostMapping("/loginuser") //Once the user/admin log in. It takes the parameter and verify if the user/admin exists.
	public void loguser(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String param1 = req.getParameter("username");
		String param2 = req.getParameter("password");
		
		if(d.isValid(param1, param2)) { //Checks the database for existing user.
		Form newU = d.getUserForm(param1, param2);
		HttpSession session = req.getSession();
		session.setAttribute("user", newU);
		resp.sendRedirect("Profile"); //If true the session attribute is assigned the user(Form) object then redirected to the profile page.
		
		}else if(d.isAdminValid(param1, param2)) { //Checks the database for existing admin.
			
			Admin ad = d.getAdmin(param1, param2);
			HttpSession session = req.getSession();
			session.setAttribute("user", ad);
			resp.sendRedirect("Admin"); //If true the session attribute is assigned the user(admin) object then redirected to the admin page.
			
		}else {
			
			resp.sendRedirect("login"); //If user/admin doesn't exist then it reloads the page.
		}
		
	}
	

	@RequestMapping("register")   //Redirects user to the register page that contains the registration form.
	public ModelAndView reg() { 
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("register");
		return mv;
	}
	
	
	
	
	@PostMapping("/newform") //This page contains the registration information
	public void newform(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		Form newForm = new Form();
		newForm.setF_name(req.getParameter("firstname"));
		newForm.setL_name(req.getParameter("lastname"));
		newForm.setEmail(req.getParameter("emailaddress"));
		newForm.setPassword(req.getParameter("password"));
		newForm.setGamer_id(req.getParameter("gamerid"));
		newForm.setConsole(req.getParameter("console"));	
		newForm.setAdmin_1(" Awaiting... ");
		newForm.setAdmin_2(" Awaiting... ");
		newForm.setAdmin_3(" Awaiting... ");
		if(d.userexist(newForm.getGamer_id(), newForm.getPassword())) { // Once filled out and saved. It checks to see if user information already exist
			resp.sendRedirect("register");								 //If info is already in the database then it reloads the page
		}else if(d.adminexist(newForm.getGamer_id(), newForm.getPassword())) { // Once filled out and saved. It checks to see if admin information already exist
			resp.sendRedirect("register");									  //If info is already in the database then it reloads the page
		}else {
			if(d.saveForm(newForm)) {
			HttpSession session = req.getSession();
			session.setAttribute("user", newForm);					//Else it creates a new object and assigns it to the session and user is directed to the profile page
			resp.sendRedirect("Profile");
			
			}else {
				resp.sendRedirect("register");
			}
		}
		
	}
	
	// Ends --------------------Basic Navigation Methods
	
	
	
	
	
	// Begins --------------------User Profile Methods
	
	@RequestMapping("Profile") //Directs to the user profile page.
	public void profdirect(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Form f = (Form)session.getAttribute("user");
		f = d.getUserForm(f.getGamer_id(), f.getPassword());
		session.setAttribute("user", f);					
		if(!(f==null)) {
			RequestDispatcher rd = req.getRequestDispatcher("ProfilePage");  //Directs to the method meant to take user to the profile page.
			rd.forward(req, resp);
		}else {
			RequestDispatcher rd = req.getRequestDispatcher("logout");  //In case of any errors it logs out the user and goes back to login
			rd.forward(req, resp);
		}
	}
	
	@RequestMapping("ProfilePage")  // Directs to the user message inbox page.
	public ModelAndView prof() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Profile");
		return mv;
	}
	
	@GetMapping("usermessages") //Gets user information from the page session to be used to get Received Message field from the object.
	public void userMessages(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Form f = (Form)session.getAttribute("user");
		session.setAttribute("user", f);					
		if(!(f==null)) {
			RequestDispatcher rd = req.getRequestDispatcher("uMessages");  //Directs to the method meant to take user to the inbox page.
			rd.forward(req, resp);
		}else if(f==null) {
			RequestDispatcher rd = req.getRequestDispatcher("logout");  //In case of any errors it logs out the user and goes back to login
			rd.forward(req, resp);
		}
	}
	
	@RequestMapping("uMessages")  // Directs to the user message inbox page.
	public ModelAndView uMessages() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("UserMessages");
		return mv;
	}
	
	@PostMapping("newMessage")  // Once user sends message, it updates the form in the database and then redirects back to message inbox page.
	public void message(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
		
		String message = req.getParameter("message");
		HttpSession session = req.getSession();
		Form user = (Form)session.getAttribute("user");
		
		d.updateForm(user.getGamer_id(), user.getPassword(), message);
		
		user = d.getUserForm(user.getGamer_id(), user.getPassword());
		
		session.setAttribute("user", user);
		
		resp.sendRedirect("uMessages");	
	}
	
	
	// Ends --------------------User Profile Methods
	
	
	
	
	
	// Begins --------------------Admin Profile Methods
	
	@GetMapping("Admin") //Grabs the form list from the database to be displayed in the Admin profile page.
	public void admin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ArrayList<Form> forms = d.getForm(req, resp);
		req.setAttribute("forms", forms);
		RequestDispatcher rd = req.getRequestDispatcher("AdminPage");
		rd.forward(req, resp);
	}
	
	@GetMapping("AdminPage") // Directs to the admin profile page.
	public ModelAndView adminpage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Admin");
		
		return mv;
	}
	
	@PostMapping("Approve")  // If admin decides to approve the users request then it updates the form.
    public void approval(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		HttpSession s = req.getSession();
		
		Admin admin = (Admin) s.getAttribute("user");          //Grabs admin who is making the decision and the GamerID they have decided to change.
		String fid = req.getParameter("fid");
		
		
		if(d.approve(fid, admin.getAdmin_id())) {
			resp.sendRedirect("Admin");
		}else {
			resp.sendRedirect("Admin");
		}
		
		
}
	
	@PostMapping("Deny")  // If admin decides to deny the users request then it updates the form.
   public void deny(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		HttpSession s = req.getSession();
		
		Admin admin = (Admin) s.getAttribute("user");			//Grabs admin who is making the decision and the form id they have decided to change.
		String fid = req.getParameter("fid");
		
		if(d.deny(fid, admin.getAdmin_id())) {
			resp.sendRedirect("Admin");
		}else {
			resp.sendRedirect("Admin");
		}
		
		
}
	
	@GetMapping("messages") // This method is used to get the forms from the database in order to see the messages that the gamer have sent
	public void adminMessages(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ArrayList<Form> forms = d.getForm(req, resp);
		req.setAttribute("forms", forms);
		RequestDispatcher rd = req.getRequestDispatcher("mess");
		rd.forward(req, resp);
	}
	
	
	@RequestMapping("mess") // Directs the admin to the message inbox page
	public ModelAndView mess() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Messages");
		return mv;
	}
	

	@PostMapping("SendMessage")  // When admin sends a message it grabs the message and GamerID and it updates the form with the message.
	public void sendMessage(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
		
		String message = req.getParameter("message");
		String fid = req.getParameter("fid");
		d.messageSent(fid,  message);
		resp.sendRedirect("messages");	
	}
	
	// Ends --------------------Admin Profile Methods
	
	
	
	@RequestMapping("logout")   //User and Admin logout and the session is then wiped out and they are redirected back to the login page.
	public void logout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		HttpSession session = req.getSession();
		session.removeAttribute("user");
		session.invalidate();
		resp.sendRedirect("login");
	}
	
	@RequestMapping("/error")
	public void handleError(HttpServletRequest request, HttpServletResponse resp) throws IOException {
		resp.sendRedirect("logout");
	     
	}

	@Override
	public String getErrorPath() {
		return  "/error";
	}


}
