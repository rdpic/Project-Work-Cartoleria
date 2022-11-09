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

import pw.dao.CategoriaDao;
import pw.dao.ProdottoDao;
import pw.model.Categoria;
import pw.model.Prodotto;

@Controller
@RequestMapping("/prodotti")
public class ProdottiController {
	
	@Autowired
	private ProdottoDao prodottoDao;
	
	@Autowired
	private CategoriaDao categoriaDao;
	
	@GetMapping
	public String getPage(Model model, @RequestParam(name = "id", required = false) Integer id) {
		Prodotto prodotto = id == null ? new Prodotto() : prodottoDao.findById(id).get();
		model.addAttribute("title", "Gestione Prodotti");
		model.addAttribute("prodotto", prodotto);
		model.addAttribute("prodotti", prodottoDao.findAll());
		boolean mostraForm = id != null;
		model.addAttribute("mostraForm", mostraForm);
		return "area_prodotti_e_categorie";
	}
	
	@PostMapping
	public String registraProdotto(@Valid @ModelAttribute("prodotto") Prodotto prodotto, BindingResult result)
	{
		if(result.hasErrors())
			return "area_prodotti_e_categorie";
		if(prodotto.getId() != 0)
		{
			Categoria categoria = categoriaDao.findById(prodotto.getId()).get();
			prodotto.setNomeProdotto(prodotto.getNomeProdotto());
			prodotto.setDescrizione(prodotto.getDescrizione());
			prodotto.setQuantita(prodotto.getQuantita());
			prodotto.setPrezzo(prodotto.getPrezzo());
			prodotto.setCodiceProdotto(prodotto.getCodiceProdotto());
			categoria.setDescrizione(prodotto.getCategoriaProdotto().getDescrizione());
			prodotto.setCategoriaProdotto(categoria);
		}
		prodottoDao.save(prodotto);
		return "redirect:/area_prodotti_e_categorie";
	}

}
