package com.catalogonet.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.catalogonet.util.MapUtil;
import com.catalogonet.util.StringFormat;

public class Busca {

	public void setStringBusca(String stringBusca) {

		// seta o termo original (pão de quijo)
		this.stringBusca = stringBusca;

		// seta o termo na url (pao-de-queijo), utilizando a stringBusca
		this.setTermoBuscaNaUrl(this.stringBusca);

		// seta o termo pronto pro algoritmo de busca (pao de queijo)
		// utiliza a termoBuscaNaUrl
		this.setTermoBusca(this.termoBuscaNaUrl);
		
		//adiciona a stringBusca original na lista de keyowrds
		this.keywords.add(stringBusca);
	}

	public void setStringLocal(String stringLocal) {

		if ((stringLocal != null) && (!stringLocal.isEmpty())) {

			// seta o termo original (pão de quijo)
			this.stringLocal = stringLocal;

			// seta o termo na url (pao-de-queijo), utilizando a stringBusca
			this.setTermoLocalNaUrl(this.stringLocal);

			// seta o termo pronto pro algoritmo de busca (pao de queijo)
			// utiliza a termoBuscaNaUrl
			this.setTermoLocal(this.termoLocalNaUrl);
			
			//adiciona o local na lista de keywords
			
			//verifica se a string local, eh a string default
			if (this.termoLocal.equals("brasilia df")) {
				this.keywords.add("Brasília");
				this.keywords.add("DF");
				this.keywords.add("Distrito Federal");
				
				this.stringLocal = "Brasília, DF";
			} else {
				this.keywords.add(stringLocal);
				this.keywords.add("Brasília");
				this.keywords.add("DF");
				this.keywords.add("Distrito Federal");
			}
			
		} else {
			this.stringLocal = "Brasília, DF";
			this.termoLocalNaUrl = "brasilia-df";
			this.termoLocal = "brasilia df";
			
			this.keywords.add("Brasília");
			this.keywords.add("DF");
			this.keywords.add("Distrito Federal");
		}

	}

	// busca orinal com acentos e tudo mais (pão de queijo)
	private String stringBusca;
	private String stringLocal;
	
	//se a busca original tinha um local antes, de ser adicionador brasilia, df
	private boolean existeStringLocal = true;

	public boolean isExisteStringLocal() {
		return existeStringLocal;
	}

	public void setExisteStringLocal(boolean existeStringLocal) {
		this.existeStringLocal = existeStringLocal;
	}

	// termos busca na url, sem acentos, com traços entre os termos
	// (pao-de-queijo)
	private String termoBuscaNaUrl;
	private String termoLocalNaUrl;

	// termos da busca prontos para serem usados pelo algoritmo de busca (pao de
	// queijo)
	private String termoBusca;
	private String termoLocal;

	// /string do termo d busca, sem as keywords de categoria por exemplo,
	// pizzaria marinelle, ficara como marinelle
	private String termoBuscaSemKeywordCAtegoria;

	private Map<Anuncio, Integer> mapa = new HashMap<Anuncio, Integer>();
	private List<String> keywords = new ArrayList<String>();

	private boolean stringTemCategoria = false;
	private String termoBuscaSemCategoria;

	public boolean isStringTemCategoria() {
		return stringTemCategoria;
	}

	public void setStringTemCategoria(boolean stringTemCategoria) {
		this.stringTemCategoria = stringTemCategoria;
	}

	public String getTermoBuscaSemCategoria() {
		return termoBuscaSemCategoria;
	}

	public void setTermoBuscaSemCategoria(String termoBuscaSemCategoria) {
		this.termoBuscaSemCategoria = termoBuscaSemCategoria;
	}

	public void percorreMapaMostrandoPrioridade() {

		System.out.println("|---------------------------------------------");
		Set<Anuncio> keySet = mapa.keySet();
		for (Anuncio a : keySet) {
			System.out.println(a.getTitulo() + " prioridade ===========> " + mapa.get(a));
		}
	}

	public List<Anuncio> pegaListaDeAnunciosOrdenada() {

		Map<Anuncio, Integer> ordenado = MapUtil.sortByValue(this.mapa);

		Set<Anuncio> chaves = ordenado.keySet();
		ArrayList<Anuncio> listaAnunciosOrdenada = new ArrayList<Anuncio>();
		for (Anuncio a : chaves) {
			if ((a != null) && (mapa.get(a) > 0)) // só mostra se a prioridade?
				listaAnunciosOrdenada.add(a);
		}
		Collections.reverse(listaAnunciosOrdenada);
		return listaAnunciosOrdenada;

	}

	public ResultadoBusca pegaResultado() {
		ResultadoBusca resultadoBusca = new ResultadoBusca(this.stringBusca, this.stringLocal);

		String urlBusca = termoBuscaNaUrl;
		if (existeStringLocal) {
			urlBusca = urlBusca + "+" + termoLocalNaUrl;
		}
		resultadoBusca.setUrlBusca(urlBusca);
		resultadoBusca.setKeywords(keywords);
		resultadoBusca.setListaAnuncios(this.pegaListaDeAnunciosOrdenada());
		return resultadoBusca;
	}

	public String getTermoBusca() {
		return termoBusca;
	}

	private void setTermoBusca(String termoBusca) {
		this.termoBusca = termoBusca.replaceAll("-", " ");
		this.setTermoBuscaSemCategoria(this.termoBusca);
	}

	public String getTermoLocal() {
		return termoLocal;
	}

	private void setTermoLocal(String termoLocal) {
		this.termoLocal = termoLocal.replaceAll("-", " ").toLowerCase();
	}

	public Map<Anuncio, Integer> getMapa() {
		return mapa;
	}

	public void setMapa(Map<Anuncio, Integer> mapa) {
		this.mapa = mapa;
	}

	public List<String> getKeywords() {
		return keywords;
	}

	public void setKeywords(List<String> keywords) {
		this.keywords = keywords;
	}

	public String getStringBusca() {
		return stringBusca;
	}

	public String getStringLocal() {
		return stringLocal;
	}

	public String getTermoBuscaNaUrl() {
		return termoBuscaNaUrl;
	}

	private void setTermoBuscaNaUrl(String termoBuscaNaUrl) {
		this.termoBuscaNaUrl = StringFormat.formatarStringParaUrl(termoBuscaNaUrl);
	}

	public String getTermoLocalNaUrl() {
		return termoLocalNaUrl;
	}

	private void setTermoLocalNaUrl(String termoLocalNaUrl) {
		this.termoLocalNaUrl = StringFormat.formatarStringParaUrl(termoLocalNaUrl);
	}

	public String getTermoBuscaSemKeywordCAtegoria() {
		return termoBuscaSemKeywordCAtegoria;
	}

	public void setTermoBuscaSemKeywordCAtegoria(String termoBuscaSemKeywordCAtegoria) {
		this.termoBuscaSemKeywordCAtegoria = termoBuscaSemKeywordCAtegoria;
	}

}
