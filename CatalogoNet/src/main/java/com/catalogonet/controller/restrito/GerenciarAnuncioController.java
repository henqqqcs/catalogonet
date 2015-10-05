package com.catalogonet.controller.restrito;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.catalogonet.anuncio.Anuncio;
import com.catalogonet.anuncio.AnuncioRN;
import com.catalogonet.anuncio.AnuncioValidator;
import com.catalogonet.imagem.FileMeta;
import com.catalogonet.imagem.ImagemRN;
import com.catalogonet.plano.PlanoAnuncio;
import com.catalogonet.plano.PlanoRN;
import com.catalogonet.usuario.Usuario;
import com.catalogonet.usuario.UsuarioRN;
import com.catalogonet.util.ImageUtils;

@Controller
@RequestMapping("/area-da-empresa/meus-anuncios")
public class GerenciarAnuncioController {

	@Autowired
	private UsuarioRN usuarioRN;

	@Autowired
	private AnuncioRN anuncioRN;

	@Autowired
	private PlanoRN planoRN;

	@Autowired
	private ImagemRN imagemRN;

	@Autowired
	private ImageUtils imageUtils;

	//
	// @Autowired
	// private ProdutoRN produtoRN;
	//
	// @Autowired
	// private CategoriaRN categoriaRN;
	//
	// @Autowired
	// private LocalRN localRN;
	//
	// @Autowired
	// private PedidoRN pedidoRN;
	//
	//
	// @Autowired
	// private MandadorEmail mandadorEmail;

	@Autowired
	private AnuncioValidator anuncioValidator;

	@InitBinder("anuncio")
	public void dataBinding(WebDataBinder binder) {
		binder.setValidator(anuncioValidator);
	}

	@RequestMapping(value = { "/{tituloNaUrl}/{idAnuncio}",
			"/{tituloNaUrl}/{idAnuncio}/estatisticas" })
	public String paginaEstatisticas(
			@PathVariable("tituloNaUrl") String tituloNaUrl,
			@PathVariable("idAnuncio") Long idAnuncio, ModelMap map) {

		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		Anuncio anuncio = anuncioRN.buscarAnuncioDoUsuario(usuario.getId(),
				idAnuncio);
		if (anuncio == null) {
			return "redirect:/area-da-empresa/meus-anuncios";
		}

		map.put("anuncio", anuncio);

		return "/restrito/anuncio/gerenciar_anuncio/anuncio-estatisticas";
	}

	@RequestMapping("/{tituloNaUrl}/{idAnuncio}/plano")
	public String paginaPlano(@PathVariable("tituloNaUrl") String tituloNaUrl,
			@PathVariable("idAnuncio") Long idAnuncio, ModelMap map) {

		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		Anuncio anuncio = anuncioRN.buscarAnuncioDoUsuario(usuario.getId(),
				idAnuncio);
		PlanoAnuncio plano = planoRN.buscarPlanoAtivoDoAnuncio(idAnuncio);

		if (anuncio == null) {
			return "redirect:/area-da-empresa/meus-anuncios";
		}

		map.put("anuncio", anuncio);
		map.put("plano", plano);

		return "/restrito/anuncio/gerenciar_anuncio/anuncio-plano";
	}

	@RequestMapping("/{tituloNaUrl}/{idAnuncio}/informacoes")
	public String paginaInformacoes(
			@PathVariable("tituloNaUrl") String tituloNaUrl,
			@PathVariable("idAnuncio") Long idAnuncio, ModelMap map) {

		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		Anuncio anuncio = anuncioRN.buscarAnuncioDoUsuario(usuario.getId(),
				idAnuncio);
		if (anuncio == null) {
			return "redirect:/area-da-empresa/meus-anuncios";
		}

		map.put("anuncio", anuncio);
		return "/restrito/anuncio/gerenciar_anuncio/anuncio-informacoes";
	}

	/**
	 * Atualizar informacoes do anuncio
	 * 
	 * @param tituloNaUrl
	 * @param idAnuncio
	 * @param anuncio
	 * @param errors
	 * @param result
	 * @param map
	 * @return
	 */
	@RequestMapping("/{tituloNaUrl}/{idAnuncio}/informacoes-handle")
	public String paginaInformacoesHandle(
			@PathVariable("tituloNaUrl") String tituloNaUrl,
			@PathVariable("idAnuncio") Long idAnuncio,
			@ModelAttribute("anuncio") Anuncio anuncio, Errors errors,
			RedirectAttributes redirectAttrs, BindingResult result, ModelMap map) {

		// buscar anuncio original
		Anuncio anuncioOriginal = anuncioRN.buscarPorId(idAnuncio);
		anuncio.setId(anuncioOriginal.getId());

		// validar
		anuncioValidator.validateInformacoes(anuncio, errors);

		if (errors.hasErrors()) {
			map.put("anuncio", anuncio);
			map.put("errors", "errors");
			return "/restrito/anuncio/gerenciar_anuncio/anuncio-informacoes";
		}

		// titulo
		anuncioOriginal.setTitulo(anuncio.getTitulo());

		// descricao
		anuncioOriginal.setDescricao(anuncio.getDescricao());

		// telefone
		anuncioOriginal.setTelefone1(anuncio.getTelefone1());
		anuncioOriginal.setTelefone2(anuncio.getTelefone2());

		// site
		anuncioOriginal.setSite(anuncio.getSite());
		// email
		anuncioOriginal.setEmail(anuncio.getEmail());
		// facebook
		anuncioOriginal.setFacebook(anuncio.getFacebook());

		// atualizar
		anuncioRN.atualizar(anuncioOriginal);

		map.put("success", "success");
		redirectAttrs.addFlashAttribute("success", "success");
		return "redirect:/area-da-empresa/meus-anuncios/"
				+ anuncioOriginal.getTituloNaUrl() + "/"
				+ anuncioOriginal.getId() + "/informacoes";
	}

	@RequestMapping("/{tituloNaUrl}/{idAnuncio}/localizacao")
	public String paginaLocalizacao(
			@PathVariable("tituloNaUrl") String tituloNaUrl,
			@PathVariable("idAnuncio") Long idAnuncio, ModelMap map) {

		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		Anuncio anuncio = anuncioRN.buscarAnuncioDoUsuario(usuario.getId(),
				idAnuncio);
		if (anuncio == null) {
			return "redirect:/area-da-empresa/meus-anuncios";
		}

		map.put("anuncio", anuncio);
		return "/restrito/anuncio/gerenciar_anuncio/anuncio-localizacao";
	}

	@RequestMapping("/{tituloNaUrl}/{idAnuncio}/localizacao-handle")
	public String paginaLocalizacaoHandle(
			@PathVariable("tituloNaUrl") String tituloNaUrl,
			@PathVariable("idAnuncio") Long idAnuncio,
			@ModelAttribute("anuncio") Anuncio anuncio, Errors errors,
			RedirectAttributes redirectAttrs, BindingResult result, ModelMap map) {

		// buscar anuncio original
		Anuncio anuncioOriginal = anuncioRN.buscarPorId(idAnuncio);
		anuncio.setId(anuncioOriginal.getId());

		// validar
		anuncioValidator.validateLocalizacao(anuncio, errors);

		if (errors.hasErrors()) {
			map.put("anuncio", anuncio);
			map.put("errors", "errors");
			return "/restrito/anuncio/gerenciar_anuncio/anuncio-informacoes";
		}

		// estado
		anuncioOriginal.setEstado(anuncio.getEstado());

		// cidade
		anuncioOriginal.setCidade(anuncio.getCidade());

		// bairro
		anuncioOriginal.setBairro(anuncio.getBairro());

		// endereco
		anuncioOriginal.setEndereco(anuncio.getEndereco());

		// cep
		anuncioOriginal.setCep(anuncio.getCep());

		// lat e long
		anuncioOriginal.setMapLatitude(anuncio.getMapLatitude());
		anuncioOriginal.setMapLongitude(anuncio.getMapLongitude());

		// atualizar
		anuncioRN.atualizar(anuncioOriginal);

		map.put("success", "success");
		redirectAttrs.addFlashAttribute("success", "success");
		return "redirect:/area-da-empresa/meus-anuncios/"
				+ anuncioOriginal.getTituloNaUrl() + "/"
				+ anuncioOriginal.getId() + "/localizacao";
	}

	@RequestMapping("/{tituloNaUrl}/{idAnuncio}/palavras-chave")
	public String paginaPalavrasChave(
			@PathVariable("tituloNaUrl") String tituloNaUrl,
			@PathVariable("idAnuncio") Long idAnuncio, ModelMap map) {

		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		Anuncio anuncio = anuncioRN.buscarAnuncioDoUsuario(usuario.getId(),
				idAnuncio);
		if (anuncio == null) {
			return "redirect:/area-da-empresa/meus-anuncios";
		}

		map.put("anuncio", anuncio);
		return "/restrito/anuncio/gerenciar_anuncio/anuncio-palavras-chave";
	}

	@RequestMapping("/{tituloNaUrl}/{idAnuncio}/palavras-chave-handle")
	public String paginaPalavrasChaveHandle(
			@PathVariable("tituloNaUrl") String tituloNaUrl,
			@PathVariable("idAnuncio") Long idAnuncio,
			@ModelAttribute("anuncio") Anuncio anuncio, Errors errors,
			RedirectAttributes redirectAttrs, BindingResult result, ModelMap map) {

		// validate tags
		anuncioValidator.validateTags(anuncio, errors);

		if (result.hasErrors()) {
			map.put("anuncio", anuncio);
			map.put("errors", "errors");
			return "/restrito/anuncio/gerenciar_anuncio/anuncio-palavras-chave";
		}

		Anuncio anuncioOriginal = anuncioRN.buscarPorId(idAnuncio);

		anuncioOriginal.setTags(anuncio.getTags());

		// atualizar
		anuncioRN.atualizar(anuncioOriginal);

		map.put("success", "success");
		redirectAttrs.addFlashAttribute("success", "success");
		return "redirect:/area-da-empresa/meus-anuncios/"
				+ anuncioOriginal.getTituloNaUrl() + "/"
				+ anuncioOriginal.getId() + "/palavras-chave";
	}

	@RequestMapping("/{tituloNaUrl}/{idAnuncio}/imagens")
	public String paginaImagens(
			@PathVariable("tituloNaUrl") String tituloNaUrl,
			@PathVariable("idAnuncio") Long idAnuncio, ModelMap map) {

		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		Anuncio anuncio = anuncioRN.buscarAnuncioDoUsuario(usuario.getId(),
				idAnuncio);

		if (anuncio == null) {
			return "redirect:/area-da-empresa/meus-anuncios";
		}

		//Anuncio anuncioComImagens = anuncioRN.buscarAnuncioComImagens(anuncio.getId());
		List<FileMeta> lista = imagemRN.listarImagensDoAnuncio(idAnuncio);

//		List<FileMeta> lista = new ArrayList<FileMeta>();
//		if (anuncioComImagens != null) {
//			lista = anuncioComImagens.getListaImagens();
//		}

		for (FileMeta file : lista) {
			System.out.println("ID da imagem: " + file.getId());
		}

		map.put("listaImagens", lista);
		map.put("anuncio", anuncio);
		return "/restrito/anuncio/gerenciar_anuncio/anuncio-imagens";
	}

	@RequestMapping("/{tituloNaUrl}/{idAnuncio}/remover-imagem/{idImagem}")
	public void removerImagem(@PathVariable("tituloNaUrl") String tituloNaUrl,
			@PathVariable("idAnuncio") Long idAnuncio,
			@PathVariable("idImagem") Long idImagem,
			HttpServletResponse response, ModelMap map) {

		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		Anuncio anuncio = anuncioRN.buscarAnuncioDoUsuario(usuario.getId(),
				idAnuncio);

		// anuncio nao pertence ao usuario
		if (anuncio == null) {
			response.setStatus(403);
		}

		if (idAnuncio != null) {
			imagemRN.remover(idImagem);
		}

		response.setStatus(200);
	}
	
	@RequestMapping("/{tituloNaUrl}/{idAnuncio}/remover-logotipo")
	public void removerLogotipo(@PathVariable("tituloNaUrl") String tituloNaUrl,
			@PathVariable("idAnuncio") Long idAnuncio,
			HttpServletResponse response, ModelMap map) {
		
		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		Anuncio anuncio = anuncioRN.buscarAnuncioDoUsuario(usuario.getId(),
				idAnuncio);
		
		// anuncio nao pertence ao usuario
		if (anuncio == null) {
			response.setStatus(403);
		}
		
		
		//remover logotipo
		anuncio.setLogotipo(null);
		
		//atualizar
		anuncioRN.atualizar(anuncio);
		
		response.setStatus(200);
	}

	@RequestMapping(value = "/{tituloNaUrl}/{idAnuncio}/imagens-handle")
	public String anuncioImagensHandle(
			@PathVariable("tituloNaUrl") String tituloNaUrl,
			@PathVariable("idAnuncio") Long idAnuncio,
			@RequestParam(value = "logotipo", required = false) MultipartFile logotipo,
			@RequestParam("file") MultipartFile[] files,
			RedirectAttributes redirectAttrs, ModelMap map) {

		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		Anuncio anuncio = anuncioRN.buscarAnuncioDoUsuario(usuario.getId(),
				idAnuncio);

		if (anuncio == null) {
			return "redirect:/area-da-empresa/meus-anuncios";
		}

		// salvar logotipo
		byte[] logotipoByteArray = imageUtils.tratarLogotipo(logotipo);
		if (logotipoByteArray != null) {
			System.out.println("Salvando logotipo ...");
			anuncio.setLogotipo(logotipoByteArray);
		} else {
			
			//input esta vazio
		}
		

		// buscar anuncio com imagens
		List<FileMeta> listaImagensDoAnuncio = imagemRN.listarImagensDoAnuncio(idAnuncio);

		// tratar imagens
		List<FileMeta> listaImagens = imageUtils.tratarImagens(files);

		int maxImgs = 5;
		if ((listaImagensDoAnuncio.size() + listaImagens.size()) > maxImgs)  {
			map.put("errors", "errors");
			redirectAttrs.addFlashAttribute("errors", "errors");
			return "redirect:/area-da-empresa/meus-anuncios/"
					+ anuncio.getTituloNaUrl() + "/" + anuncio.getId() + "/imagens";	
		}

		// adicionar no banco
		imagemRN.adicionarListaImagens(listaImagens);

		// adicionar na lista do anuncio
		// sera que funciona?
		for (FileMeta imagem : listaImagens) {
			FileMeta file = imagemRN.buscarPorId(imagem.getId());
			anuncio.getListaImagens().add(file);
		}

		// atualizar anuncio
		anuncioRN.atualizar(anuncio);

		map.put("success", "success");
		redirectAttrs.addFlashAttribute("success", "success");
		return "redirect:/area-da-empresa/meus-anuncios/"
				+ anuncio.getTituloNaUrl() + "/" + anuncio.getId() + "/imagens";
	}

}
