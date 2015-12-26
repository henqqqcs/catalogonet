package com.catalogonet.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.catalogonet.model.Usuario;
import com.catalogonet.negocio.UsuarioRN;

@Controller
@RequestMapping("/adminadmin/usuarios")
public class AdminUsuariosController {

	@Autowired
	private UsuarioRN usuarioRN;

	// @Autowired
	// private AnuncioRN anuncioRN;
	//
	// @Autowired
	// private PedidoRN pedidoRN;
	//
	// @Autowired
	// private PlanoRN planoRN;

	// private final String PAG_BUSCA = "redirect:/adminadmin/usuarios/busca";

	@RequestMapping("/busca")
	public String usuariosBusca(ModelMap map) {
		return "admin/usuario/busca-usuario";
	}

	@RequestMapping(value = "/busca-nome-handle", method = RequestMethod.GET)
	public String buscaUsuarioNome(@RequestParam String nome, ModelMap map) {

		List<Usuario> listaUsuarios = usuarioRN.buscarPorNome(nome);
		int tamanho = listaUsuarios.size();

		// coloca dependencias
		map.put("listaUsuarios", listaUsuarios);
		map.put("resultado", tamanho);
		return "admin/usuario/busca-usuario";
	}

	@RequestMapping(value = "/busca-email-handle", method = RequestMethod.GET)
	public String buscaUsuarioEmail(@RequestParam String email, ModelMap map) {

		List<Usuario> listaUsuarios = usuarioRN.buscarPorParteEmail(email);
		int tamanho = listaUsuarios.size();

		// coloca dependencias
		map.put("listaUsuarios", listaUsuarios);
		map.put("resultado", tamanho);
		return "admin/usuario/busca-usuario";
	}

	@RequestMapping(value = "/busca-cpf-handle", method = RequestMethod.GET)
	public String buscaUsuarioCPF(@RequestParam String cpf, ModelMap map) {

		List<Usuario> listaUsuarios = usuarioRN.buscarPorParteCPF(cpf);
		int tamanho = listaUsuarios.size();

		// coloca dependencias
		map.put("listaUsuarios", listaUsuarios);
		map.put("resultado", tamanho);
		return "admin/usuario/busca-usuario";
	}

	@RequestMapping(value = "/usuario-info", method = RequestMethod.GET)
	public String buscaUsuarioInfo(@RequestParam Long id, ModelMap map) {

		Usuario usuario = usuarioRN.buscarPorId(id);
		map.put("usuario", usuario);

		// //lista de planos
		// List<PlanoAnuncio> listaPlanos =
		// planoRN.listarPlanoAnuncioUsuario(id);
		// map.put("listaPlanos", listaPlanos);
		// //lista pedidos
		// List<Pedido> listaPedidos = pedidoRN.listarPedidoUsuario(id);
		// map.put("listaPedidos", listaPedidos);
		// //lista anuncios
		// List<Anuncio> listaAnuncios = anuncioRN.listarAnunciosUsuario(id);
		// map.put("listaAnuncios", listaAnuncios);

		return "admin/usuario/info-usuario";
	}

	@RequestMapping(value = "/editar-usuario", method = RequestMethod.GET)
	public String usuarioEditar(@RequestParam Long id, ModelMap map) {
		Usuario usuario = usuarioRN.buscarPorId(id);
		map.put("usuario", usuario);
		return "admin/usuario/atualizar-usuario";
	}

	@RequestMapping("/atualizar-usuario-handle")
	public String atualizarUsuarioHandle(@ModelAttribute Usuario u, ModelMap map) {

		Usuario usuario = usuarioRN.buscarPorId(u.getId());

		usuario.setNome(u.getNome());
		usuario.setCpf(u.getCpf());
		usuario.setCnpj(u.getCnpj());
		usuario.setTelefone1(u.getTelefone1());
		usuario.setTelefone2(u.getTelefone2());
		usuario.setEndereco(u.getEndereco());

		usuarioRN.atualizar(usuario);
		return "redirect:/adminadmin/usuarios/usuario-info?id=" + usuario.getId();
	}

}
