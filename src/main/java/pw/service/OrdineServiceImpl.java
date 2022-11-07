package pw.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pw.dao.OrdineDao;
import pw.dao.UtenteDao;
import pw.model.Ordine;

@Service
public class OrdineServiceImpl implements OrdineService
{
	@Autowired
	private OrdineDao ordineDao;
	
	@Autowired
	private UtenteDao utenteDao;
	
	@Autowired
	private ProdottoService prodottoService;
	
	@Override
	public void registraOrdine(Ordine ordine, Object... ordineData)
	{
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try
		{
			ordine.setData(format.parse((String)ordineData[0]));
		} catch (ParseException e)
		{
			ordine.setData(new Date());
		}
		ordine.setUtente(utenteDao.findById(((int)ordineData[1])).get());
		ordine.getListaProdotti().clear();
		for(int i : (int[])ordineData[2])
			ordine.getListaProdotti().add(prodottoService.getProdottoById(i));
		double totale = ordine.getListaProdotti()
				.stream()
				.map(a -> a.getPrezzo())
				.reduce(0.0, (a1, a2) -> a1 + a2);
		ordine.setTotaleOrdine(totale);
		ordineDao.save(ordine);
	}

	@Override
	public Ordine getOrdineById(int id)
	{
		return ordineDao.findById(id).get();
	}

	@Override
	public List<Ordine> getOrdini()
	{
		return (List<Ordine>) ordineDao.findAll();
	}

	@Override
	public void cancellaOrdine(Ordine ordine)
	{
		ordine.setUtente(null);
		ordine.setListaProdotti(null);
		ordineDao.save(ordine);
		ordineDao.delete(ordine);
	}
}
