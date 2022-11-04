package pw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	public String getPage(Model model) {
		model.addAttribute("title", "Pannello di Amministrazione");
		return "area_admin";
	}

}
