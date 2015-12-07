package com.catalogonet.negocio;

import java.time.LocalDate;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.catalogonet.dao.interfaces.PlanoDAO;
import com.catalogonet.model.PlanoAnuncio;
import com.catalogonet.model.PrioridadeProduto;
import com.catalogonet.model.Produto;
import com.catalogonet.model.StatusPlanoAnuncio;
import com.catalogonet.model.Usuario;

@Component
@Transactional
public class PlanoRN {

	@Autowired
	private PlanoDAO dao;

	public PlanoAnuncio criarPlanoAnuncio(Usuario usuario, Produto produto) {
		PlanoAnuncio planoAnuncio = new PlanoAnuncio();

		planoAnuncio.setUsuario(usuario);
		planoAnuncio.setProduto(produto);
		planoAnuncio.setStatusPlanoAnuncio(StatusPlanoAnuncio.PLANO_PAGO_AGUARDANDO_APLICACAO);

		planoAnuncio = this.adicionarPlanoAnuncio(planoAnuncio);
		try {
			System.out.println("| -- Criando o Plano anuncio -" + " produto: "
					+ produto.getNome() + " ID do plano: "
					+ planoAnuncio.getId());
			return this.buscarPlanoAnuncioPorId(planoAnuncio.getId());
		} catch (Exception e) {
			System.out.println("Erro ao salvar PlanoAnuncio: ");
			e.printStackTrace();
		}
		return null;
	}


	public void atualizarPlanoStatus(PlanoAnuncio planoAnuncio,
			StatusPlanoAnuncio status) {

		planoAnuncio.setStatusPlanoAnuncio(status);

		// atualizar
		this.atualizarPlanoAnuncio(planoAnuncio);

	}

	/**
	 * Apenas o Atribuidor de Planos pode usar este metodo
	 * @param planoAnuncio
	 */
	public void ativarPlano(PlanoAnuncio planoAnuncio) {
		// setar ativo
		planoAnuncio.setAtivo(true);

		// data de inicio e data final
		LocalDate hoje = LocalDate.now();
		planoAnuncio.setDataInicio(hoje);

		// adiciona 1 ano
		LocalDate dataFinal = hoje.plusYears(1);
		planoAnuncio.setDataFinalizacao(dataFinal);

		// atualizar
		this.atualizarPlanoAnuncio(planoAnuncio);
	}

	public void suspenderPlano(PlanoAnuncio plano) {

		// desativar plano atual
		plano.setAtivo(false);

		// suspender plano atual
		plano.setStatusPlanoAnuncio(StatusPlanoAnuncio.PLANO_SUSPENSO);

		// terminar caso ele ja tenha sido iniciado
		if (plano.getDataFinalizacao() != null) {
			plano.setDataFinalizacao(LocalDate.now());
		}

		// atualizar
		this.atualizarPlanoAnuncio(plano);

	}

	public PlanoAnuncio adicionarPlanoAnuncio(PlanoAnuncio planoAnuncio) {
		// seta data de criacao
		planoAnuncio.setDataCriacao(LocalDate.now());
		return dao.adicionarPlanoAnuncio(planoAnuncio);
	}

	public void atualizarPlanoAnuncio(PlanoAnuncio planoAnuncio) {
		dao.atualizarPlanoAnuncio(planoAnuncio);
	}

	public void removerPlanoAnuncio(Long idPlanoAnuncio) {
		dao.removerPlanoAnuncio(idPlanoAnuncio);
	}

	public PlanoAnuncio buscarPlanoAnuncioPorId(Long idPlanoAnuncio) {
		return dao.buscarPlanoAnuncioPorId(idPlanoAnuncio);
	}

	public List<PlanoAnuncio> listarPlanoAnuncioUsuario(Long idUsuario) {
		return dao.listarPlanoAnuncioUsuario(idUsuario);
	}

	public PlanoAnuncio buscarPlanoAtivoDoAnuncio(Long idAnuncio) {
		return dao.buscarPlanoAtivoDoAnuncio(idAnuncio);
	}

	public List<PlanoAnuncio> listarPlanoAnuncioNaoUtilizado(Long idUsuario) {
		return dao.listarPlanoAnuncioNaoUtilizado(idUsuario);
	}

	private PrioridadeProduto verificarTipoDePlano(PlanoAnuncio plano) {
		// gratuito
		if (plano.getProduto().getPrioridadeProduto() == PrioridadeProduto.PRODUTO_GRATUITO) {
			return PrioridadeProduto.PRODUTO_GRATUITO;
		}
		// profissional
		if (plano.getProduto().getPrioridadeProduto() == PrioridadeProduto.PRODUTO_PROFISSIONAL) {
			return PrioridadeProduto.PRODUTO_PROFISSIONAL;
		}
		// ultimate
		if (plano.getProduto().getPrioridadeProduto() == PrioridadeProduto.PRODUTO_ULTIMATE) {
			return PrioridadeProduto.PRODUTO_ULTIMATE;
		}
		// erro?
		return null;
	}

	public String pegarPaginaDeConfirmacaoDeCadastro(PlanoAnuncio plano) {

		PrioridadeProduto tipoDePlano = verificarTipoDePlano(plano);

		// gratuito
		if (tipoDePlano == PrioridadeProduto.PRODUTO_GRATUITO) {
			return "confirmacao-gratuito-temporario";
		}

		// profissional ou ultimate
		if ((tipoDePlano == PrioridadeProduto.PRODUTO_PROFISSIONAL)
				|| (tipoDePlano == PrioridadeProduto.PRODUTO_ULTIMATE)) {

			// plano pago
			if (plano.getStatusPlanoAnuncio() == StatusPlanoAnuncio.PLANO_PAGO_AGUARDANDO_APLICACAO) {
				return "confirmacao-plano-pago";
			} else {
				return "confirmacao-aguardando-pagamento";
			}

		}

		return null;
	}
}
