package pw.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pw.dao.ProfiloDao;
import pw.model.Profilo;

@Controller
@RequestMapping("/login")
public class FormLoginController {
	
	@Autowired
	private ProfiloDao profiloDao;

	@GetMapping
	public String getPage(Model model) {
		model.addAttribute("title", "User Login");
		return "FormLogin";
	}
	
	@PostMapping("/userlogin")
	public String userLogin(@RequestParam("username") String username, @RequestParam("password") String password, @RequestParam(name = "le", required = false) String lError, HttpSession session, Model model) {
	    List<Profilo> profili = (List<Profilo>) profiloDao.findAll();
	    boolean exists = false;
	    for (int i = 0; i < profili.size(); i++) {
	        if (profili.get(i).getUsername().equals(username) && profili.get(i).getPassword().equals(password)) {
	            session.setAttribute("username", username);
	            exists = true;
	            break;
	        }
	    }
	
	    if (exists) {
	        return "redirect:/";
	    } else {
	    	boolean loginError = lError != null;
			model.addAttribute("loginError", loginError);
	        return "redirect:/login";
	    }
	}
	
}
