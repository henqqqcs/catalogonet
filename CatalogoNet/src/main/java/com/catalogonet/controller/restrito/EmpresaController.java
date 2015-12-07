
package com.catalogonet.controller.restrito;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.catalogonet.model.Anuncio;
import com.catalogonet.model.Pedido;
import com.catalogonet.model.PlanoAnuncio;
import com.catalogonet.model.Usuario;
import com.catalogonet.negocio.AnuncioRN;
import com.catalogonet.negocio.PedidoRN;
import com.catalogonet.negocio.PlanoRN;
import com.catalogonet.negocio.UsuarioRN;

@Controller
@RequestMapping("/area-da-empresa")
@SessionAttributes("usuario")
public class EmpresaController {

	@Autowired
	private UsuarioRN usuarioRN;

	@Autowired
	private AnuncioRN anuncioRN;

	@Autowired
	private PedidoRN pedidoRN;

	@Autowired
	private PlanoRN planoRN;

	@RequestMapping(value = { "", "/", "/home" })
	public String areaDaEmpresaHome(ModelMap map) {

		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		map.put("usuario", usuario);

		int numMax = 5;

		// lista de planos
		List<PlanoAnuncio> listaPlanoAnuncio = planoRN.listarPlanoAnuncioUsuario(usuario.getId());
		if (!listaPlanoAnuncio.isEmpty()) {
			if (listaPlanoAnuncio.size() >= numMax)
				listaPlanoAnuncio = listaPlanoAnuncio.subList(0, (numMax - 1));
		}
		map.put("listaPlanoAnuncio", listaPlanoAnuncio);

		// lista de anuncios
		List<Anuncio> listaAnuncios = anuncioRN.listarAnunciosUsuario(usuario.getId());
		if (!listaAnuncios.isEmpty()) {
			if (listaAnuncios.size() >= numMax)
				listaAnuncios = listaAnuncios.subList(0, (numMax - 1));
		}
		map.put("listaAnuncios", listaAnuncios);

		// lista de pedidos
		List<Pedido> listaPedidos = pedidoRN.listarPedidoUsuario(usuario.getId());
		if (!listaPedidos.isEmpty()) {
			if (listaPedidos.size() >= numMax)
				listaPedidos = listaPedidos.subList(0, (numMax - 1));
		}
		map.put("listaPedidos", listaPedidos);

		return "restrito/home";
	}

	@RequestMapping("/meus-anuncios")
	public String meusAnuncios(ModelMap map) {

		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		if (usuario != null) {
			List<Anuncio> lista = anuncioRN.listarAnunciosUsuario(usuario.getId());
			map.put("listaAnuncios", lista);
		} else {
			return "redirect:/login";
		}
		return "restrito/meus_anuncios";
	}

	@RequestMapping("/meus-pedidos")
	public String areaDaEmpresaMeusPedidos(ModelMap map) {
		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		List<Pedido> listaPedidos = pedidoRN.listarPedidoUsuario(usuario.getId());
		map.put("listaPedidos", listaPedidos);
		return "restrito/meus_pedidos";
	}

	@RequestMapping("/meus-cupons")
	public String meusCupons(ModelMap map) {
		return "restrito/meus_cupons";
	}

	@RequestMapping("/meus-planos")
	public String areaDaEmpresaMeusPlanos(ModelMap map) {
		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		List<PlanoAnuncio> listaPlanos = planoRN.listarPlanoAnuncioUsuario(usuario.getId());

		map.put("listaPlanos", listaPlanos);
		return "restrito/meus_planos";
	}

}
