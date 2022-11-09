package pw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pw.dao.ProdottoDao;
import pw.model.Prodotto;

@Service
public class ProdottoServiceImpl implements ProdottoService {

	@Autowired
	private ProdottoDao prodottoDao;
	
	@Override
	public Prodotto getProdottoById(int id) {
		return prodottoDao.findById(id).get();
	}

	@Override
	public void cancellaProdotto(Prodotto prodotto) {
		prodotto.setCategoriaProdotto(null);
		prodottoDao.save(prodotto);
		prodottoDao.delete(prodotto);
	}
	
	@Override
	public void registraProdotto(Prodotto prodotto) {
		prodottoDao.save(prodotto);
	}
	
	@Override
	public List<Prodotto> getProdotto() {
		return (List<Prodotto>) prodottoDao.findAll();
	}

}
