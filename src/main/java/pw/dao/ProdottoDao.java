package pw.dao;

import org.springframework.data.repository.CrudRepository;

import pw.model.Prodotto;

public interface ProdottoDao extends CrudRepository<Prodotto, Integer> {}
