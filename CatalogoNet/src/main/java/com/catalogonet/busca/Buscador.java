package com.catalogonet.busca;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.catalogonet.dao.interfaces.BuscaDAO;
import com.catalogonet.model.Anuncio;
import com.catalogonet.model.Bairro;
import com.catalogonet.model.Busca;
import com.catalogonet.model.ResultadoBusca;
import com.catalogonet.negocio.CategoriaRN;
import com.catalogonet.negocio.LocalRN;

@Component
@Transactional
public class Buscador {

	@Autowired
	private BuscaDAO dao;

	@Autowired
	private LocalRN localRN;

	@Autowired
	private CategoriaRN categoriaRN;

	private static final int PRIORIDADE_CATEGORIA = 1;
	private static final int PRIORIDADE_SUB_CATEGORIA = 2;
	private static final int PRIORIDADE_TITULO_INTEIRO = 5;
	private static final int PRIORIDADE_TITULO_PARTE = 2;
	private static final int PRIORIDADE_ANUNCIO_TAG = 2;
	private static final int PRIORIDADE_LOCAL_INTEIRO = 4;
	private static final int PRIORIDADE_LOCAL_PARTE = 3;

	public ResultadoBusca busca(Busca busca) {
		
		System.out.println("\n\n\n|----- Começando busca por " + busca.getStringBusca() + " local: " + busca.getStringLocal() + " ------|");

		busca = buscaPorCategorias(busca);
		busca = buscaPorTitulos(busca);
		busca = buscaPelasTagsDosAnuncios(busca);
		busca = buscaPorLocais(busca);
		//busca = adicionarKeywords(busca);
		busca = colocarPrioridade(busca);

		busca.percorreMapaMostrandoPrioridade();
		return busca.pegaResultado();

	}

	private Busca buscaPorCategorias(Busca busca) {
		Map<Anuncio, Integer> mapa = busca.getMapa();
		List<String> keywordsDaBusca = busca.getKeywords();
		// busca por anuncios da categoria (mais branda)
		String termoBusca = busca.getTermoBusca();
		String[] termos = termoBusca.split(" ");

		for (String termo : termos) {
			
			ResultadoBuscaCategoria resultadoBuscaCategoria = categoriaRN.buscarAnunciosPorCategoria(termo);
			
			//remove a keyword da busca caso tenha achado
			if (resultadoBuscaCategoria.isAchouKeyword()) {
				busca.setTermoBuscaSemCategoria(removerStringCategoriaDaStringOriginal(busca.getTermoBuscaSemCategoria(), termo));
			}
			
			//pega a lista de anuncios achados pela categoria
			List<Anuncio> listaAnuncioCategoria = resultadoBuscaCategoria.getListaAnunciosCategoria();

			for (Anuncio a : listaAnuncioCategoria) {
				System.out.println("Anuncio que foi achado pela categoria: " + a.getTitulo());
			}
			
			// adiciona o termo a lista de termo que eh categoria, para serem
			// ignoradas na hora de buscar por titulo
			if (listaAnuncioCategoria.size() > 0) {
				mapa = colocarPrioridade(listaAnuncioCategoria, mapa, PRIORIDADE_CATEGORIA);
			}

			List<Anuncio> listaAnuncioSubCategoria = resultadoBuscaCategoria.getListaAnunciosSubCategoria();
			if (listaAnuncioSubCategoria.size() > 0) {
				mapa = colocarPrioridade(listaAnuncioSubCategoria, mapa, PRIORIDADE_SUB_CATEGORIA);
			}
			
			//adiciona os keywords das categorias achadas na busca
			keywordsDaBusca.addAll(resultadoBuscaCategoria.getListaTagsEncontradas());
		}

		busca.setKeywords(keywordsDaBusca);
		busca.setMapa(mapa);
		return busca;
	}

	private Busca buscaPorTitulos(Busca busca) {
		Map<Anuncio, Integer> mapa = busca.getMapa();

		String termoBusca = busca.getTermoBusca();
		// busca pelo titulo inteiro

		List<Anuncio> listaAnuncios = dao.buscarPorTituloInteiro(termoBusca);
		if (listaAnuncios.size() > 0) {
			System.out.println("\n|----------- Busca por titulos inteiro -------------|\n");
			for (Anuncio a : listaAnuncios) {
				System.out.println("Achou titulo inteiro: " + a.getTitulo());
			}
			mapa = colocarPrioridade(listaAnuncios, mapa, PRIORIDADE_TITULO_INTEIRO);
			busca.setMapa(mapa);
			System.out.println("\n|----------- Fim busca titulo inteiro -------------|\n");
			return busca;
		} else {

			return buscaPorPartesDeTitulos(busca);
		}
	}

	private Busca buscaPorPartesDeTitulos(Busca busca) {

		Map<Anuncio, Integer> mapa = busca.getMapa();
		List<Anuncio> listaAnuncios = new ArrayList<Anuncio>();

		// busca por partes de titulos

		System.out.println("\n|----------- Busca por PARTES DE TITULO -------------|\n");

		// so faz a busca no banco de dados, se o
		// termoBuscaSemKeywordsDeCategoria for maior ou igual 3
		if (busca.getTermoBuscaSemCategoria().length() >= 3) {
			// faz busca por parte de titulo
			listaAnuncios = buscaAnunciosPorParteDeTitulo(busca.getTermoBuscaSemCategoria());
			System.out.println("Termo da busca sem keywords que esta sendo procurado: " + busca.getTermoBuscaSemKeywordCAtegoria());
			// mostra anuncios que tem parte do titulo
			for (Anuncio a : listaAnuncios) {
				System.out.println("Titulo por parte: " + a.getTitulo());
			}
			mapa = colocarPrioridade(listaAnuncios, mapa, PRIORIDADE_TITULO_PARTE);

			System.out.println("\n|----------- FIM busca por PARTES DE TITULO -------------|\n");
		}

		busca.setMapa(mapa);
		return busca;
	}

	private List<Anuncio> buscaAnunciosPorParteDeTitulo(String termoBuscaSemKeywordsDeCategoria) {
		String[] termos = termoBuscaSemKeywordsDeCategoria.split(" ");
		List<Anuncio> listaAnuncio = new ArrayList<Anuncio>();
		for (String termo : termos) {
			// faz pesquisa no banco por essa parte de titulo
			listaAnuncio.addAll(dao.buscarPorTituloPartes(termo));
		}

		return listaAnuncio;
	}

	private Busca buscaPelasTagsDosAnuncios(Busca busca) {
		Map<Anuncio, Integer> mapa = busca.getMapa();
		String[] termos = busca.getTermoBusca().split(" ");
		System.out.println("\n|----------- Buscando pelas Tags dos Anuncios -------------|\n");
		for (String termo : termos) {
			List<Anuncio> listaAnuncio = dao.buscarPorAnunciosTags(termo);
			// mostrar anuncios que acharam tags
			for (Anuncio a : listaAnuncio) {
				System.out.println("Titulo: " + a.getTitulo());
			}

			mapa = colocarPrioridade(listaAnuncio, mapa, PRIORIDADE_ANUNCIO_TAG);
		}
		System.out.println("\n|----------- Fim busca pelas Tags -------------|\n");

		busca.setMapa(mapa);
		return busca;
	}

	private Busca buscaPorLocais(Busca objBusca) {

		String local = objBusca.getTermoLocal();
		if ((local == null) || (local.isEmpty()) || (local.length() <= 2)) {
			System.out.println("Abortando a busca por local ...");
			return objBusca;
		}

		Map<Anuncio, Integer> mapa = objBusca.getMapa();

		System.out.println("|--- Fazendo uma busca pelo local: " + local + "-----");
		String nomeDoBairro = null;

		for (Map.Entry<Anuncio, Integer> entry : mapa.entrySet()) {
			Anuncio a = entry.getKey();

			Bairro bairro = a.getBairro();
			if (bairro == null) {
				continue;
			}
			nomeDoBairro = bairro.getNomeNaUrl().replaceAll("-", " ");
			
			// verifica se a string local(inteira bate com o bairro)
			if (nomeDoBairro.equals(local)) {
				Integer integer = mapa.get(a);
				integer = integer + PRIORIDADE_LOCAL_INTEIRO;
				entry.setValue(integer);
				System.out.println("Achou procurando pela string bairro inteiro: " + nomeDoBairro);
			} else {
				if (verificaSeLocalBate(nomeDoBairro, local)) {
					Integer integer = mapa.get(a);
					integer = integer + PRIORIDADE_LOCAL_PARTE;
					entry.setValue(integer);
					System.out.println("Achou procurando por uma parte do bairro: " + nomeDoBairro + " termoDoLocal: " + local);
				}

			}

		}

		objBusca.setMapa(mapa);
		return objBusca;

	}

	private boolean verificaSeLocalBate(String nomeDoBairro, String local) {
		String[] termosDoBairro = nomeDoBairro.trim().split(" ");
		String[] termosDoLocal = local.trim().split(" ");

		int contadorDeOcorrencias = 0;
		for (int i = 0; i < termosDoBairro.length; i++) {
			for (int j = 0; j < termosDoLocal.length; j++) {
				int num = StringUtils.getLevenshteinDistance(termosDoBairro[i], termosDoLocal[j]);
				if (num <= 2) {
					contadorDeOcorrencias++;
				}
			}
		}

		if (contadorDeOcorrencias >= termosDoBairro.length) {
			return true;
		} else {
			return false;
		}

	}

//	private Busca adicionarKeywords(Busca busca) {
//
//		List<String> keywords = busca.getKeywords();
//		
//		if (busca.getStringLocal().equals("Bras�lia, DF")) {
//			keywords.add("Distrito Federal");
//		} else {
//			keywords.add("Bras�lia");
//			keywords.add("Distrito Federal");
//			keywords.add("DF");
//		}
//		busca.setKeywords(keywords);
//		return busca;
//	}

	private Busca colocarPrioridade(Busca objBusca) {
		Map<Anuncio, Integer> mapa = objBusca.getMapa();

		System.out.println("\n|----------- Colocar Prioridade de Planos -------------|\n");
		for (Map.Entry<Anuncio, Integer> entry : mapa.entrySet()) {
			Anuncio anuncio = entry.getKey();
			Integer prioridade = entry.getValue();
			int numPrioridade = anuncio.getPrioridadeProduto();
			System.out.println("Adicionando prioridade " + numPrioridade + " ao anuncio " + anuncio.getTitulo());
			prioridade += numPrioridade;
			entry.setValue(prioridade);
		}

		System.out.println("\n|----------- Fim colocar prioridade ------------------|\n");
		objBusca.setMapa(mapa);
		return objBusca;
	}

	private Map<Anuncio, Integer> colocarPrioridade(List<Anuncio> lista, Map<Anuncio, Integer> mapa, int prioridade) {

		if (lista == null) {
			return mapa;
		}
		for (Anuncio a : lista) {

			if (mapa.containsKey(a)) {
				Integer valor = mapa.get(a);
				valor = valor + prioridade;
				mapa.remove(a);
				mapa.put(a, valor);

			} else {
				mapa.put(a, prioridade);
			}
		}
		return mapa;
	}

	private String removerStringCategoriaDaStringOriginal(String termoBusca, String keyword) {
		System.out.println("\n|----------- Metodo que remove keyword de categoria do termo -------------|\n");
		System.out.println("Termo da busca: " + termoBusca);
		System.out.println("Keyword a ser removida: " + keyword);
		String buscaSemNomeCategoria = StringUtils.remove(termoBusca, keyword);
		buscaSemNomeCategoria = buscaSemNomeCategoria.replaceAll("  ", " ").trim();
		System.out.println("Resultado: " + buscaSemNomeCategoria);
		return buscaSemNomeCategoria;
	}
}
