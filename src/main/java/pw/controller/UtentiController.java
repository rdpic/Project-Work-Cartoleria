package pw.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pw.dao.ProfiloDao;
import pw.dao.UtenteDao;
import pw.model.Profilo;
import pw.model.Utente;

@Controller
@RequestMapping("/utenti")
public class UtentiController {

	@Autowired
	private UtenteDao utenteDao;
	
	@Autowired
	private ProfiloDao profiloDao;
	
	@GetMapping
	public String getPage(
			Model model,
			@RequestParam(name = "id", required = false) Integer id)
	{
		Utente utente = id == null ? new Utente() : utenteDao.findById(id).get();
		model.addAttribute("title", "Gestione Clienti");
		model.addAttribute("utente", utente);
		model.addAttribute("utenti", utenteDao.findAll());
		return "area_clienti";
	}
	
	@PostMapping
	public String registraUtente(
			@Valid @ModelAttribute("utente") Utente utente,
			BindingResult result)
	{
		if(result.hasErrors())
			return "area_clienti";
		if(utente.getId() != 0)
		{
			Profilo profilo = profiloDao.findById(utente.getId()).get();
			profilo.setUsername(utente.getProfilo().getUsername());
			profilo.setPassword(utente.getProfilo().getPassword());
			utente.setProfilo(profilo);
		}
		utenteDao.save(utente);
		return "redirect:/area_clienti";
	}

}
