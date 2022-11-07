package pw.service;

import java.util.List;

import pw.model.Ordine;

public interface OrdineService
{
	void registraOrdine(Ordine ordine, Object... ordineData);
	Ordine getOrdineById(int id);
	List<Ordine> getOrdini();
	void cancellaOrdine(Ordine ordine);
}
