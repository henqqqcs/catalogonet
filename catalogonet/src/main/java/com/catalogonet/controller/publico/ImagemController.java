package com.catalogonet.controller.publico;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.catalogonet.negocio.ImagemRN;

@Controller
@RequestMapping("/servicos/imagens")
public class ImagemController {

	
	@Autowired
	private ImagemRN imagemRN;

	@RequestMapping(value = "/{anuncioTitulo}/{imageId}")
	@ResponseBody
	public byte[] buscarImagensImagem(@PathVariable String anuncioTitulo, @PathVariable Long imageId)  {
		return imagemRN.buscarImagem(imageId);
	}
	
	@RequestMapping(value = "/thumbnail/{anuncioTitulo}/{imageId}.jpg")
	@ResponseBody
	public byte[] buscarImagens(@PathVariable String anuncioTitulo, @PathVariable Long imageId)  {
		return imagemRN.buscarThumbnail(imageId);
	}
	
	@RequestMapping(value = "/logotipo/{anuncioTitulo}/{idAnuncio}.jpg")
	@ResponseBody
	public byte[] buscarLogotipo(@PathVariable String anuncioTitulo, @PathVariable Long idAnuncio)  {
		return imagemRN.buscarLogotipo(idAnuncio);
	}
	
}
