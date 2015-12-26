package com.catalogonet.banco;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.catalogonet.model.Bairro;
import com.catalogonet.model.Cidade;
import com.catalogonet.model.Estado;
import com.catalogonet.negocio.LocalRN;
import com.catalogonet.xml.LocalXmlReader;

@Component
public class PopularLocaisService {

	@Autowired
	private LocalRN localRN;

	public void popularLocais() {

		System.out.println("|-- Populando banco de dados: locais");
		
		LocalXmlReader localXmlReader = new LocalXmlReader();

		// salvar estado
		salvarEstados(localXmlReader.listarEstados());
		salvarCidades(localXmlReader.listarCidades());
		salvarBairros(localXmlReader.listarBairros());

	}

	private void salvarEstados(List<Estado> listarEstados) {
		
		for (Estado e : listarEstados) {
			localRN.adicionarEstado(e);
		}

	}

	private void salvarCidades(List<Cidade> listarCidades) {
		
		Estado estado = localRN.buscarEstadoPorId("DF");
		
		for (Cidade c : listarCidades) {
			c.setEstado(estado);
			localRN.adicionarCidade(c);
		}

	}

	private void salvarBairros(List<Bairro> listarBairros) {
		Estado estado = localRN.buscarEstadoPorId("DF");
		Cidade cidade = localRN.buscarCidadePorId(1l);
		
		for (Bairro b : listarBairros) {
			b.setCidade(cidade);
			b.setEstado(estado);
			localRN.adicionarBairro(b);
		}
		
	}
}
