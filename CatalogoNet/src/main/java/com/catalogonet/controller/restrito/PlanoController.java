package com.catalogonet.controller.restrito;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.catalogonet.gerenciador.GerenciadorPlano;
import com.catalogonet.model.Anuncio;
import com.catalogonet.model.PlanoAnuncio;
import com.catalogonet.model.Usuario;
import com.catalogonet.negocio.AnuncioRN;
import com.catalogonet.negocio.PlanoRN;
import com.catalogonet.negocio.UsuarioRN;

@Controller
@RequestMapping("/area-da-empresa/meus-planos")
public class PlanoController {

	
	@Autowired
	private UsuarioRN usuarioRN;
	
	@Autowired
	private GerenciadorPlano gerenciadorDePlano;
	
	@Autowired
	private PlanoRN planoRN;
	
	@Autowired
	private AnuncioRN anuncioRN;
	
	@RequestMapping("/comecar-plano/{idPlano}")
	public String areaDaEmpresaHome(@PathVariable("idPlano") String idPlano, ModelMap map) {
	
		//verifica se o plano pertence ao usuario logado
		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		PlanoAnuncio plano = planoRN.buscarPlanoAnuncioPorId(Long.valueOf(idPlano));
		if (!plano.getUsuario().equals(usuario)) {
			System.out.println("plano.getUsuario().equals(usuario nao retorna equal");
			return "redirect:/area-da-empresa";
		}
		
		//perguntar ao usuario se deseja atribuir a um anuncio ja existente ou criar um novo anuncio
		List<Anuncio> listaAnuncios = anuncioRN.listarAnunciosUsuario(usuario.getId());
		if (listaAnuncios.isEmpty()) {

			//comecar o plano
			gerenciadorDePlano.comecarPlano(plano);
			
			Anuncio anuncio = anuncioRN.buscarAnuncioDoPlano(plano);
			return "redirect:/area-da-empresa/meus-anuncios/" + anuncio.getTituloNaUrl() + "/" + anuncio.getId();
			
		}
		
		//usuario ja possui anuncios
		//perguntar se deve atribuir o plano a um ja existente ou criar um novo anuncio
		map.put("listaAnuncios", listaAnuncios);
		return "restrito/plano/comecar_plano";
	}
	
	
}
