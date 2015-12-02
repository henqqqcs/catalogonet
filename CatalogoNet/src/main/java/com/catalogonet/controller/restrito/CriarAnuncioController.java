package com.catalogonet.controller.restrito;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.catalogonet.anuncio.Anuncio;
import com.catalogonet.anuncio.AnuncioRN;
import com.catalogonet.anuncio.AnuncioValidator;
import com.catalogonet.categoria.Categoria;
import com.catalogonet.categoria.CategoriaRN;
import com.catalogonet.categoria.SubCategoria;
import com.catalogonet.email.MandadorEmail;
import com.catalogonet.imagem.FileMeta;
import com.catalogonet.imagem.ImagemRN;
import com.catalogonet.local.Bairro;
import com.catalogonet.local.Cidade;
import com.catalogonet.local.Estado;
import com.catalogonet.local.LocalRN;
import com.catalogonet.pedido.PedidoRN;
import com.catalogonet.plano.AtribuidorDePlanos;
import com.catalogonet.plano.PlanoAnuncio;
import com.catalogonet.plano.PlanoRN;
import com.catalogonet.plano.StatusPlanoAnuncio;
import com.catalogonet.produto.PrioridadeProduto;
import com.catalogonet.produto.Produto;
import com.catalogonet.produto.ProdutoRN;
import com.catalogonet.usuario.Usuario;
import com.catalogonet.usuario.UsuarioRN;
import com.catalogonet.util.ImageUtils;

@Controller
@RequestMapping("/area-da-empresa/criar-anuncio")
@SessionAttributes({ "usuario", "anuncio", "planoAnuncio" })
public class CriarAnuncioController {

	@Autowired
	private UsuarioRN usuarioRN;

	@Autowired
	private AnuncioRN anuncioRN;

	@Autowired
	private PlanoRN planoRN;

	@Autowired
	private ProdutoRN produtoRN;

	@Autowired
	private CategoriaRN categoriaRN;

	@Autowired
	private LocalRN localRN;

	@Autowired
	private PedidoRN pedidoRN;

	@Autowired
	private ImagemRN imagemRN;

	@Autowired
	private MandadorEmail mandadorEmail;

	@Autowired
	private AnuncioValidator anuncioValidator;

	@Autowired
	private ImageUtils imageUtils;

	@InitBinder("anuncio")
	public void dataBinding(WebDataBinder binder) {
		binder.setValidator(anuncioValidator);
	}

	@Autowired
	private AtribuidorDePlanos atribuidorDePlanos;

	/**
	 * 1- passo - escolher o plano a ser aplicado ao anuncio
	 */
	@RequestMapping(value = { "", "/informacoes" })
	public String anuncioInformacoes(ModelMap map) {

		Anuncio anuncio = new Anuncio();
		map.put("anuncio", anuncio);
		return "restrito/anuncio/criar_anuncio/anuncio-info";
	}

	@RequestMapping("/informacoes-handle")
	public String anuncioInformacoesHandle(
			@ModelAttribute("anuncio") Anuncio anuncio, Errors errors,
			BindingResult result, ModelMap map) {

		anuncioValidator.validateInformacoes(anuncio, errors);

		if (errors.hasErrors()) {
			System.out.println("RESULT HAS ERRORS");
			map.put("anuncio", anuncio);
			map.put("errors", "errors");
			return "restrito/anuncio/criar_anuncio/anuncio-info";
		}

		map.put("anuncio", anuncio);
		return "redirect:/area-da-empresa/criar-anuncio/localizacao";
	}

	@RequestMapping(value = "/localizacao")
	public String anuncioLocalizacao(ModelMap map) {

		Anuncio anuncio = (Anuncio) map.get("anuncio");
		if (anuncio == null) {
			return "redirect:/area-da-empresa/criar-anuncio/informacoes";
		}

		map.put("anuncio", anuncio);
		return "restrito/anuncio/criar_anuncio/anuncio-localizacao";
	}

	@RequestMapping(value = "/localizacao-handle")
	public String anuncioLocalizacaoHandle(
			@ModelAttribute("anuncio") Anuncio anuncio, Errors errors,
			BindingResult result, ModelMap map) {

		anuncioValidator.validateLocalizacao(anuncio, errors);

		if (result.hasErrors()) {
			System.out.println("RESULT HAS ERRORS");
			map.put("anuncio", anuncio);
			map.put("errors", "errors");
			return "restrito/anuncio/criar_anuncio/anuncio-localizacao";
		}

		String idEsdado = anuncio.getEstado().getId();
		Estado estado = localRN.buscarEstadoPorId(idEsdado);
		anuncio.setEstado(estado);

		Cidade cidade = localRN.buscarCidadePorId(anuncio.getCidade().getId());
		anuncio.setCidade(cidade);

		Bairro bairro = localRN.buscarBairroPorId(anuncio.getBairro().getId());
		anuncio.setBairro(bairro);

		System.out.println("Controller: endenreco: " + anuncio.getEndereco());

		map.put("anuncio", anuncio);
		return "redirect:/area-da-empresa/criar-anuncio/palavras-chave";
	}

	@RequestMapping(value = "/palavras-chave")
	public String anuncioPalavrasChave(ModelMap map) {

		Anuncio anuncio = (Anuncio) map.get("anuncio");
		if (anuncio == null) {
			return "redirect:/area-da-empresa/criar-anuncio/informacoes";
		}
		map.put("anuncio", anuncio);

		return "restrito/anuncio/criar_anuncio/anuncio-palavras-chave";
	}

	@RequestMapping(value = "/palavras-chave-handle")
	public String anuncioPalavrasChaveHandle(
			@ModelAttribute("anuncio") Anuncio anuncio, Errors errors,
			BindingResult result, ModelMap map) {

		// validate tags
		anuncioValidator.validateTags(anuncio, errors);

		if (result.hasErrors()) {
			map.put("anuncio", anuncio);
			map.put("errors", "errors");
			return "restrito/anuncio/criar_anuncio/anuncio-palavras-chave";
		}

		map.put("anuncio", anuncio);
		return "redirect:/area-da-empresa/criar-anuncio/categoria";
	}

	@RequestMapping(value = "/categoria")
	public String anuncioCategoria(ModelMap map) {

		Anuncio anuncio = (Anuncio) map.get("anuncio");
		if (anuncio == null) {
			return "redirect:/area-da-empresa/criar-anuncio/informacoes";
		}

		return "restrito/anuncio/criar_anuncio/anuncio-categoria";
	}

	@RequestMapping(value = "/categoria-handle")
	public String anuncioCategoriaHandle(
			@ModelAttribute("anuncio") @Valid Anuncio anuncio,
			BindingResult result, ModelMap map) {

		// colocar categoria
		Categoria categoria = categoriaRN.buscarCategoriaPorId(anuncio
				.getCategoria().getId());
		anuncio.setCategoria(categoria);

		// colocar subcategoria
		SubCategoria subCategoria = categoriaRN.buscarSubCategoriaPorId(anuncio
				.getSubCategoria().getId());
		anuncio.setSubCategoria(subCategoria);

		map.put("anuncio", anuncio);
		return "redirect:/area-da-empresa/criar-anuncio/imagens";

	}

	@RequestMapping(value = "/imagens")
	public String anuncioImagens(ModelMap map) {

		Anuncio anuncio = (Anuncio) map.get("anuncio");
		if (anuncio == null) {
			return "redirect:/area-da-empresa/criar-anuncio/informacoes";
		}

		return "restrito/anuncio/criar_anuncio/anuncio-imagens";
	}

	@RequestMapping(value = "/imagens-handle")
	public String anuncioImagensHandle(
			@RequestParam(value = "logotipo", required = false) MultipartFile logotipo,
			@RequestParam("file") MultipartFile[] files, ModelMap map) {

		Anuncio anuncio = (Anuncio) map.get("anuncio");
		if (anuncio == null) {
			return "redirect:/area-da-empresa/criar-anuncio/informacoes";
		}

		// salvar logotipo
		byte[] logotipoByteArray = imageUtils.tratarLogotipo(logotipo);
		if (logotipoByteArray != null) {
			anuncio.setLogotipo(logotipoByteArray);
		}

		// tratar imagens
		List<FileMeta> listaImagens = imageUtils.tratarImagens(files);

		// adicionar no banco
		imagemRN.adicionarListaImagens(listaImagens);

		// adicionar na lista do anuncio
		// sera que funciona?
		for (FileMeta imagem : listaImagens) {
			FileMeta file = imagemRN.buscarPorId(imagem.getId());
			anuncio.getListaImagens().add(file);
		}

		// salvar anuncio
		finalizarCriacao(anuncio, map);

		map.put("anuncio", anuncio);
		return "redirect:/area-da-empresa/criar-anuncio/plano";
	}

	@RequestMapping(value = "/plano")
	public String anuncioPlano(ModelMap map) {

		Anuncio anuncio = (Anuncio) map.get("anuncio");
		if (anuncio == null) {
			return "redirect:/area-da-empresa/criar-anuncio/informacoes";
		}

		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);

		List<PlanoAnuncio> listaPlanos = planoRN
				.listarPlanoAnuncioNaoUtilizado(usuario.getId());
		map.put("listaPlanos", listaPlanos);

		return "restrito/anuncio/criar_anuncio/anuncio-plano";
	}

	@RequestMapping(value = "/plano-existente-handle", method = RequestMethod.POST)
	public String anuncioPlanoExistenteHandle(
			@RequestParam(required = false) Long idPlano,
			RedirectAttributes redirectAttributes, ModelMap map) {

		Anuncio anuncio = (Anuncio) map.get("anuncio");
		if (anuncio == null) {
			return "redirect:/area-da-empresa/criar-anuncio/informacoes";
		}

		if (idPlano == null) {
			return "redirect:/area-da-empresa/criar-anuncio/informacoes";
		}

		// buscar plano
		PlanoAnuncio plano = planoRN.buscarPlanoAnuncioPorId(idPlano);

		// verifica status
		if (plano.getStatusPlanoAnuncio() == StatusPlanoAnuncio.PLANO_PAGO_AGUARDANDO_APLICACAO) {
			//ativar anuncio
			atribuidorDePlanos.ativarPlano(plano, anuncio);
		} else {
			//apenas faz  aligacao
			atribuidorDePlanos.atribuir(plano, anuncio);
		}

		// verifica qual a pagina de retorno
		// aguardando pagamento?
		// processo concluido?
		// aguardando aprovacao?
		String pagina = planoRN.pegarPaginaDeConfirmacaoDeCadastro(plano);

		System.out
				.println("|--------------------------------------------------");
		System.out
				.println("|-- pagina de confirmarmacao de anuncio: " + pagina);

		redirectAttributes.addFlashAttribute("paginaConfirmacao", pagina);

		// redirecionar para pagina de anuncio pronto
		return "redirect:/area-da-empresa/criar-anuncio/obrigado";
	}

	@RequestMapping(value = "/plano-novo-handle")
	public String anuncioPlanoNovoHandle(
			@RequestParam(required = false) Long idProduto,
			RedirectAttributes redirectAttributes, ModelMap map) {

		Anuncio anuncio = (Anuncio) map.get("anuncio");
		anuncio = anuncioRN.buscarAnuncioPorTituloInteiro(anuncio.getTitulo());
		if (anuncio == null) {
			return "redirect:/area-da-empresa/criar-anuncio/informacoes";
		}
		if (idProduto == null) {
			return "redirect:/area-da-empresa/criar-anuncio/informacoes";
		}

		// buscar produto
		Produto produto = produtoRN.buscarPorId(idProduto);

		// busca usuario
		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);

		// criar plano, salva no banco
		//PlanoAnuncio plano = planoRN.criarPlanoAnuncio(usuario, produto,
		//		anuncio);

		// prioridade
		anuncio.setPrioridadeProduto(produto.getPrioridadeProduto()
				.getPrioridadeProduto());

		// atualizar
		anuncioRN.atualizar(anuncio);

		// atribuir plano
		//atribuidorDePlanos.atribuir(plano, anuncio);

		// eh gratuito?
		if (produto.getPrioridadeProduto() == PrioridadeProduto.PRODUTO_GRATUITO) {
			// String pagina =
			// planoRN.pegarPaginaDeConfirmacaoDeCadastro(plano);
			// redirectAttributes.addFlashAttribute("paginaConfirmacao",
			// pagina);
			// redirecionar para pagina de anuncio pronto
			return "redirect:/area-da-empresa/criar-anuncio/obrigado";
		} else {
			return "redirect:/pagamento/carrinho?idProduto=" + produto.getId()
					+ "&fromCriarAnuncio=true";
		}

	}

	@RequestMapping(value = "/obrigado")
	public String anuncioObrigado(ModelMap map) {

		String paginaConfirmacao = (String) map.get("paginaConfirmacao");
		if (paginaConfirmacao == null) {
			paginaConfirmacao = "confirmacao-gratuito-temporario";
		}

		//pago vem do fluxo de pagamento
		if (map.get("pago") != null) {
			paginaConfirmacao = "confirmacao-plano-pago";
		} 
		
		return "restrito/anuncio/criar_anuncio/finalizacao/" + paginaConfirmacao;
	}

	// ==================================================================
	// ============================== HELPERS ===========================
	// ==================================================================

	private void finalizarCriacao(Anuncio anuncio, ModelMap map) {
		// pega o plano que esta na session
		// PlanoAnuncio plano = (PlanoAnuncio) map.get("planoAnuncio");

		// seta usuario
		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		anuncio.setUsuario(usuario);

		// salva o anuncio
		anuncioRN.adicionar(anuncio);

		// manda email de anuncio cadastrado
		// mandrillMandadorEmail.mandarEmailAnuncioCriado(usuarioRN.pegaUsuarioNaSessao(map),
		// anuncio);
	}

}
