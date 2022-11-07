package pw.service;

import java.util.List;

import pw.model.Prodotto;

public interface ProdottoService {

	Prodotto getProdottoById(int id);
	List<Prodotto> getProdotto();
	void registraProdotto(Prodotto prodotto);
	void cancellaProdotto(Prodotto prodotto);
}
