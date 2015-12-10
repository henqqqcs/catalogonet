package com.catalogonet.controller.restrito;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.catalogonet.model.Anuncio;
import com.catalogonet.model.Categoria;
import com.catalogonet.model.FileMeta;
import com.catalogonet.model.PlanoAnuncio;
import com.catalogonet.model.SubCategoria;
import com.catalogonet.model.Usuario;
import com.catalogonet.negocio.AnuncioRN;
import com.catalogonet.negocio.CategoriaRN;
import com.catalogonet.negocio.ImagemRN;
import com.catalogonet.negocio.PlanoRN;
import com.catalogonet.negocio.UsuarioRN;
import com.catalogonet.util.ImageUtils;
import com.catalogonet.validators.AnuncioValidator;

@Controller
@RequestMapping("/area-da-empresa/meus-anuncios")
@SessionAttributes("anuncio")
public class GerenciarAnuncioController {

	@Autowired
	private UsuarioRN usuarioRN;

	@Autowired
	private AnuncioRN anuncioRN;

	@Autowired
	private PlanoRN planoRN;
	
	@Autowired
	private CategoriaRN categoriaRN;

	@Autowired
	private ImagemRN imagemRN;

	@Autowired
	private ImageUtils imageUtils;

	@Autowired
	private AnuncioValidator anuncioValidator;

	@InitBinder("anuncio")
	public void dataBinding(WebDataBinder binder) {
		binder.setValidator(anuncioValidator);
	}

	// ======================================================================
	// =========================== Publicacao ===============================
	// ======================================================================
	@RequestMapping("/{tituloNaUrl}/{idAnuncio}/publicar")
	public String publicarAnuncio(@PathVariable("tituloNaUrl") String tituloNaUrl,
			@PathVariable("idAnuncio") Long idAnuncio, @ModelAttribute("anuncio") Anuncio anuncio,
			RedirectAttributes redirectAttrs, BindingResult result, ModelMap map) {

		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		// verifica se o anuncio pertence ao usuario
		if (anuncioRN.buscarAnuncioDoUsuario(usuario.getId(), idAnuncio) == null) {
			return "redirect:/area-da-empresa/meus-anuncios";
		}

		map.put("anucio", anuncio);

		Map<String, String> mapaInformacoes = new HashMap<String, String>();
		Map<String, String> mapaLocalizacao = new HashMap<String, String>();
		Map<String, String> mapaCategoria = new HashMap<String, String>();
		Map<String, String> mapaTags = new HashMap<String, String>();

		// valida informacao
		anuncioValidator.validateInformacoes(anuncio, result);
		if (result.hasErrors()) {
			for (FieldError f : result.getFieldErrors()) {
				mapaInformacoes.put(f.getField(), f.getDefaultMessage());
			}
		}

		// valida localizacao
		anuncioValidator.validateLocalizacao(anuncio, result);
		if (result.hasErrors()) {
			for (FieldError f : result.getFieldErrors()) {
				if (!mapaInformacoes.containsKey(f.getField()))
					mapaLocalizacao.put(f.getField(), f.getDefaultMessage());
			}
		}

		// valida categoria
		anuncioValidator.validateCategorias(anuncio, result);
		if (result.hasErrors()) {
			for (FieldError f : result.getFieldErrors()) {
				if (!mapaInformacoes.containsKey(f.getField()) && !mapaLocalizacao.containsKey(f.getField()))
					mapaCategoria.put(f.getField(), f.getDefaultMessage());
			}
		}

		// valida tags
		anuncioValidator.validateTags(anuncio, result);
		if (result.hasErrors()) {
			for (FieldError f : result.getFieldErrors()) {
				if (!mapaInformacoes.containsKey(f.getField()) && !mapaLocalizacao.containsKey(f.getField())
						&& !mapaCategoria.containsKey(f.getField()))
					mapaTags.put(f.getField(), f.getDefaultMessage());
			}
		}

		System.out.println("|--------- mapa de informacao ----------------");
		iterarMapa(mapaInformacoes);
		System.out.println("|--------- mapa de categoria ----------------");
		iterarMapa(mapaLocalizacao);
		System.out.println("|--------- mapa de localizacao ----------------");
		iterarMapa(mapaCategoria);
		System.out.println("|--------- mapa de tags ----------------");
		iterarMapa(mapaTags);

		map.put("mapaInformacoes", mapaInformacoes);
		map.put("mapaLocalizacao", mapaLocalizacao);
		map.put("mapaCategoria", mapaCategoria);
		map.put("mapaTags", mapaTags);

		return "/restrito/anuncio/gerenciar_anuncio/publicar";
	}

	private void iterarMapa(Map<String, String> map) {

		for (Map.Entry<String, String> entry : map.entrySet()) {
			System.out.println("Field: " + entry.getKey() + " menssagem: " + entry.getValue());
		}

	}

	@RequestMapping(value = { "/{tituloNaUrl}/{idAnuncio}", "/{tituloNaUrl}/{idAnuncio}/estatisticas" })
	public String paginaEstatisticas(@PathVariable("tituloNaUrl") String tituloNaUrl,
			@PathVariable("idAnuncio") Long idAnuncio, ModelMap map) {

		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		Anuncio anuncio = anuncioRN.buscarAnuncioDoUsuario(usuario.getId(), idAnuncio);
		if (anuncio == null) {
			return "redirect:/area-da-empresa/meus-anuncios";
		}

		// imagens
		List<FileMeta> listaImagens = imagemRN.listarImagensDoAnuncio(anuncio.getId());
		map.put("listaImagens", listaImagens);

		// plano do anuncio
		PlanoAnuncio plano = planoRN.buscarPlanoDoAnuncio(anuncio.getId());
		map.put("plano", plano);

		map.put("anuncio", anuncio);

		return "/restrito/anuncio/gerenciar_anuncio/resumo";
	}

	@RequestMapping("/{tituloNaUrl}/{idAnuncio}/plano")
	public String paginaPlano(@PathVariable("tituloNaUrl") String tituloNaUrl,
			@PathVariable("idAnuncio") Long idAnuncio, ModelMap map) {

		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		Anuncio anuncio = anuncioRN.buscarAnuncioDoUsuario(usuario.getId(), idAnuncio);
		PlanoAnuncio plano = planoRN.buscarPlanoAtivoDoAnuncio(idAnuncio);

		if (anuncio == null) {
			return "redirect:/area-da-empresa/meus-anuncios";
		}

		map.put("anuncio", anuncio);
		map.put("plano", plano);

		return "/restrito/anuncio/gerenciar_anuncio/anuncio-plano";
	}

	@RequestMapping("/{tituloNaUrl}/{idAnuncio}/informacoes")
	public String paginaInformacoes(@PathVariable("tituloNaUrl") String tituloNaUrl,
			@PathVariable("idAnuncio") Long idAnuncio, ModelMap map) {

		if (map.get("anuncioUpdate") == null) {
			Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
			Anuncio anuncio = anuncioRN.buscarAnuncioDoUsuario(usuario.getId(), idAnuncio);
			if (anuncio == null) {
				return "redirect:/area-da-empresa/meus-anuncios";
			}
			map.put("anuncioUpdate", anuncio);
		}

		return "/restrito/anuncio/gerenciar_anuncio/informacoes";
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
	public String paginaInformacoesHandle(@PathVariable("tituloNaUrl") String tituloNaUrl,
			@PathVariable("idAnuncio") Long idAnuncio, @ModelAttribute("anuncioUpdate") Anuncio anuncioUpdate,
			Errors errors, RedirectAttributes redirectAttrs, BindingResult result, ModelMap map) {

		// buscar anuncio original
		Anuncio anuncioOriginal = anuncioRN.buscarPorId(idAnuncio);
		anuncioUpdate.setId(anuncioOriginal.getId());

		// validar
		anuncioValidator.validateInformacoes(anuncioUpdate, errors);

		if (errors.hasErrors()) {
			redirectAttrs.addFlashAttribute("errors", "errors");
			redirectAttrs.addFlashAttribute("anuncioUpdate", anuncioUpdate);
			redirectAttrs.addFlashAttribute("org.springframework.validation.BindingResult.anuncioUpdate", result);
			return "redirect:/area-da-empresa/meus-anuncios/" + anuncioUpdate.getTituloNaUrl() + "/"
					+ anuncioUpdate.getId() + "/informacoes";
		}

		// titulo
		anuncioOriginal.setTitulo(anuncioUpdate.getTitulo());

		// descricao
		anuncioOriginal.setDescricao(anuncioUpdate.getDescricao());

		// telefone
		anuncioOriginal.setTelefone1(anuncioUpdate.getTelefone1());
		anuncioOriginal.setTelefone2(anuncioUpdate.getTelefone2());

		// site
		anuncioOriginal.setSite(anuncioUpdate.getSite());
		// email
		anuncioOriginal.setEmail(anuncioUpdate.getEmail());
		// facebook
		anuncioOriginal.setFacebook(anuncioUpdate.getFacebook());

		// atualizar
		anuncioRN.atualizar(anuncioOriginal);

		map.put("success", "success");
		map.put("anuncio", anuncioOriginal);
		redirectAttrs.addFlashAttribute("success", "success");
		return "redirect:/area-da-empresa/meus-anuncios/" + anuncioOriginal.getTituloNaUrl() + "/"
				+ anuncioOriginal.getId() + "/informacoes";
	}

	// ======================================================================
	// =========================== Localizazao ==============================
	// ======================================================================

	@RequestMapping("/{tituloNaUrl}/{idAnuncio}/localizacao")
	public String paginaLocalizacao(@PathVariable("tituloNaUrl") String tituloNaUrl,
			@PathVariable("idAnuncio") Long idAnuncio, ModelMap map) {

		if (map.get("anuncioUpdate") == null) {
			Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
			Anuncio anuncio = anuncioRN.buscarAnuncioDoUsuario(usuario.getId(), idAnuncio);
			if (anuncio == null) {
				return "redirect:/area-da-empresa/meus-anuncios";
			}

			map.put("anuncioUpdate", anuncio);

		}
		return "/restrito/anuncio/gerenciar_anuncio/localizacao";
	}

	@RequestMapping("/{tituloNaUrl}/{idAnuncio}/localizacao-handle")
	public String paginaLocalizacaoHandle(@PathVariable("tituloNaUrl") String tituloNaUrl,
			@PathVariable("idAnuncio") Long idAnuncio, @ModelAttribute("anuncioUpdate") Anuncio anuncioUpdate,
			Errors errors, RedirectAttributes redirectAttrs, BindingResult result, ModelMap map) {

		// buscar anuncio original
		Anuncio anuncioOriginal = anuncioRN.buscarPorId(idAnuncio);
		anuncioUpdate.setId(anuncioOriginal.getId());

		// validar
		anuncioValidator.validateLocalizacao(anuncioUpdate, errors);

		if (errors.hasErrors()) {
			redirectAttrs.addFlashAttribute("errors", "errors");
			redirectAttrs.addFlashAttribute("anuncioUpdate", anuncioUpdate);
			redirectAttrs.addFlashAttribute("org.springframework.validation.BindingResult.anuncioUpdate", result);
			return "redirect:/area-da-empresa/meus-anuncios/" + anuncioOriginal.getTituloNaUrl() + "/"
					+ anuncioOriginal.getId() + "/localizacao";
		}

		// estado
		anuncioOriginal.setEstado(anuncioUpdate.getEstado());

		// cidade
		anuncioOriginal.setCidade(anuncioUpdate.getCidade());

		// bairro
		anuncioOriginal.setBairro(anuncioUpdate.getBairro());

		// endereco
		anuncioOriginal.setEndereco(anuncioUpdate.getEndereco());

		// cep
		anuncioOriginal.setCep(anuncioUpdate.getCep());

		// lat e long
		anuncioOriginal.setMapLatitude(anuncioUpdate.getMapLatitude());
		anuncioOriginal.setMapLongitude(anuncioUpdate.getMapLongitude());

		// atualizar
		anuncioRN.atualizar(anuncioOriginal);

		redirectAttrs.addFlashAttribute("success", "success");
		return "redirect:/area-da-empresa/meus-anuncios/" + anuncioOriginal.getTituloNaUrl() + "/"
				+ anuncioOriginal.getId() + "/localizacao";
	}

	// ======================================================================
	// =========================== Categoria ==============================
	// ======================================================================

	@RequestMapping("/{tituloNaUrl}/{idAnuncio}/categoria")
	public String paginaCategoria(@PathVariable("tituloNaUrl") String tituloNaUrl,
			@PathVariable("idAnuncio") Long idAnuncio, ModelMap map) {

		if (map.get("anuncioUpdate") == null) {
			Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
			Anuncio anuncio = anuncioRN.buscarAnuncioDoUsuario(usuario.getId(), idAnuncio);
			if (anuncio == null) {
				return "redirect:/area-da-empresa/meus-anuncios";
			}

			map.put("anuncioUpdate", anuncio);

		}
		return "/restrito/anuncio/gerenciar_anuncio/categoria";
	}

	@RequestMapping("/{tituloNaUrl}/{idAnuncio}/categoria-handle")
	public String paginaCategoriaHandle(@PathVariable("tituloNaUrl") String tituloNaUrl,
			@PathVariable("idAnuncio") Long idAnuncio, @ModelAttribute("anuncioUpdate") Anuncio anuncioUpdate,
			Errors errors, RedirectAttributes redirectAttrs, BindingResult result, ModelMap map) {

		// buscar anuncio original
		Anuncio anuncioOriginal = anuncioRN.buscarPorId(idAnuncio);
		anuncioUpdate.setId(anuncioOriginal.getId());

		// validar
		anuncioValidator.validateCategorias(anuncioUpdate, errors);

		if (errors.hasErrors()) {
			redirectAttrs.addFlashAttribute("errors", "errors");
			redirectAttrs.addFlashAttribute("anuncioUpdate", anuncioUpdate);
			redirectAttrs.addFlashAttribute("org.springframework.validation.BindingResult.anuncioUpdate", result);
			return "redirect:/area-da-empresa/meus-anuncios/" + anuncioOriginal.getTituloNaUrl() + "/"
					+ anuncioOriginal.getId() + "/categoria";
		}

		// colocar categoria
		Categoria categoria = categoriaRN.buscarCategoriaPorId(anuncioUpdate.getCategoria().getId());
		anuncioOriginal.setCategoria(categoria);

		// colocar subcategoria
		SubCategoria subCategoria = categoriaRN.buscarSubCategoriaPorId(anuncioUpdate.getSubCategoria().getId());
		anuncioOriginal.setSubCategoria(subCategoria);

		anuncioRN.atualizar(anuncioOriginal);
		
		redirectAttrs.addFlashAttribute("success", "success");
		return "redirect:/area-da-empresa/meus-anuncios/" + anuncioOriginal.getTituloNaUrl() + "/"
				+ anuncioOriginal.getId() + "/categoria";
	}

	// ======================================================================
	// ========================= Palavras-chave =============================
	// ======================================================================

	@RequestMapping("/{tituloNaUrl}/{idAnuncio}/palavras-chave")
	public String paginaPalavrasChave(@PathVariable("tituloNaUrl") String tituloNaUrl,
			@PathVariable("idAnuncio") Long idAnuncio, ModelMap map) {

		if (map.get("anuncioUpdate") == null) {
			Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
			Anuncio anuncio = anuncioRN.buscarAnuncioDoUsuario(usuario.getId(), idAnuncio);
			if (anuncio == null) {
				return "redirect:/area-da-empresa/meus-anuncios";
			}
			map.put("anuncioUpdate", anuncio);
		}

		return "/restrito/anuncio/gerenciar_anuncio/palavras-chave";
	}

	@RequestMapping("/{tituloNaUrl}/{idAnuncio}/palavras-chave-handle")
	public String paginaPalavrasChaveHandle(@PathVariable("tituloNaUrl") String tituloNaUrl,
			@PathVariable("idAnuncio") Long idAnuncio, @ModelAttribute("anuncioUpdate") Anuncio anuncioUpdate,
			Errors errors, RedirectAttributes redirectAttrs, BindingResult result, ModelMap map) {

		Anuncio anuncioOriginal = anuncioRN.buscarPorId(idAnuncio);

		// validate tags
		anuncioValidator.validateTags(anuncioUpdate, errors);

		if (result.hasErrors()) {
			redirectAttrs.addFlashAttribute("errors", "errors");
			redirectAttrs.addFlashAttribute("anuncioUpdate", anuncioUpdate);
			redirectAttrs.addFlashAttribute("org.springframework.validation.BindingResult.anuncioUpdate", result);
			return "redirect:/area-da-empresa/meus-anuncios/" + anuncioOriginal.getTituloNaUrl() + "/"
					+ anuncioOriginal.getId() + "/palavras-chave";
		}

		anuncioOriginal.setTags(anuncioUpdate.getTags());

		// atualizar
		anuncioRN.atualizar(anuncioOriginal);

		redirectAttrs.addFlashAttribute("success", "success");
		return "redirect:/area-da-empresa/meus-anuncios/" + anuncioOriginal.getTituloNaUrl() + "/"
				+ anuncioOriginal.getId() + "/palavras-chave";
	}

	@RequestMapping("/{tituloNaUrl}/{idAnuncio}/imagens")
	public String paginaImagens(@PathVariable("tituloNaUrl") String tituloNaUrl,
			@PathVariable("idAnuncio") Long idAnuncio, ModelMap map) {

		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		Anuncio anuncio = anuncioRN.buscarAnuncioDoUsuario(usuario.getId(), idAnuncio);

		if (anuncio == null) {
			return "redirect:/area-da-empresa/meus-anuncios";
		}

		// Anuncio anuncioComImagens =
		// anuncioRN.buscarAnuncioComImagens(anuncio.getId());
		List<FileMeta> lista = imagemRN.listarImagensDoAnuncio(idAnuncio);

		map.put("listaImagens", lista);
		map.put("anuncio", anuncio);
		return "/restrito/anuncio/gerenciar_anuncio/imagens";
	}

	@RequestMapping("/{tituloNaUrl}/{idAnuncio}/remover-imagem/{idImagem}")
	public void removerImagem(@PathVariable("tituloNaUrl") String tituloNaUrl,
			@PathVariable("idAnuncio") Long idAnuncio, @PathVariable("idImagem") Long idImagem,
			HttpServletResponse response, ModelMap map) {

		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		Anuncio anuncio = anuncioRN.buscarAnuncioDoUsuario(usuario.getId(), idAnuncio);

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
			@PathVariable("idAnuncio") Long idAnuncio, HttpServletResponse response, ModelMap map) {

		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		Anuncio anuncio = anuncioRN.buscarAnuncioDoUsuario(usuario.getId(), idAnuncio);

		// anuncio nao pertence ao usuario
		if (anuncio == null) {
			response.setStatus(403);
		}

		// remover logotipo
		anuncio.setLogotipo(null);

		// atualizar
		anuncioRN.atualizar(anuncio);

		response.setStatus(200);
	}

	@RequestMapping(value = "/{tituloNaUrl}/{idAnuncio}/imagens-handle")
	public String anuncioImagensHandle(@PathVariable("tituloNaUrl") String tituloNaUrl,
			@PathVariable("idAnuncio") Long idAnuncio,
			@RequestParam(value = "logotipo", required = false) MultipartFile logotipo,
			@RequestParam("file") MultipartFile[] files, RedirectAttributes redirectAttrs, ModelMap map) {

		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		Anuncio anuncio = anuncioRN.buscarAnuncioDoUsuario(usuario.getId(), idAnuncio);

		if (anuncio == null) {
			return "redirect:/area-da-empresa/meus-anuncios";
		}

		// salvar logotipo
		byte[] logotipoByteArray = imageUtils.tratarLogotipo(logotipo);
		if (logotipoByteArray != null) {
			System.out.println("Salvando logotipo ...");
			anuncio.setLogotipo(logotipoByteArray);
		} else {

			// input esta vazio
		}

		// buscar anuncio com imagens
		List<FileMeta> listaImagensDoAnuncio = imagemRN.listarImagensDoAnuncio(idAnuncio);

		// tratar imagens
		List<FileMeta> listaImagens = imageUtils.tratarImagens(files);

		int maxImgs = 5;
		if ((listaImagensDoAnuncio.size() + listaImagens.size()) > maxImgs) {
			map.put("errors", "errors");
			redirectAttrs.addFlashAttribute("errors", "errors");
			return "redirect:/area-da-empresa/meus-anuncios/" + anuncio.getTituloNaUrl() + "/" + anuncio.getId()
					+ "/imagens";
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
		return "redirect:/area-da-empresa/meus-anuncios/" + anuncio.getTituloNaUrl() + "/" + anuncio.getId()
				+ "/imagens";
	}

}
