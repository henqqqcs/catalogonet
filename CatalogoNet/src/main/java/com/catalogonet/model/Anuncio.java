package com.catalogonet.model;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import com.catalogonet.converter.LocalDatePersistenceConverter;
import com.catalogonet.util.StringFormat;

@Entity
@Table(name = "anuncio")
public class Anuncio implements Serializable {

	private static final long serialVersionUID = 1L;

	@Deprecated
	public Anuncio() {
	}

	public Anuncio(String titulo, Plano plano, Usuario usuario) {
		this.setTitulo("Anúncio" + " - " + plano.getNomePlano());
		this.plano = plano;
		this.prioridadeProduto = plano.getPrioridadeProduto();
		this.usuario = usuario;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_anuncio")
	private Long id;
	private boolean ativo;

	/**
	 * Utilizado para saber se os anuncios gratuitos ja foram aprovados
	 */
	private boolean verificado;
	private boolean aprovado;

	// @Column(unique = true)
	@Size(min = 5, max = 50)
	private String titulo;

	@Size(min = 5, max = 55)
	private String tituloNaUrl;

	private int prioridadeProduto;

	@Basic(fetch = FetchType.EAGER)
	@Lob
	@Size(max = 2048)
	private String descricao;

	@Basic(fetch = FetchType.EAGER)
	@Lob
	@Column(length = 1024)
	private String descricaoHtml;

	/** Contato **/
	@Size(min = 10, max = 16)
	private String telefone1;
	private String telefone2;
	private String email;

	private String site;
	private String facebook;
	private String twitter;
	private String instagram;
	private String googleplus;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "estado_id")
	private Estado estado;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "cidade_id")
	private Cidade cidade;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "bairro_id")
	private Bairro bairro;

	@Column(name = "end_endereco")
	@Size(max = 50)
	private String endereco;

	@Size(max = 30)
	@Column(name = "end_complemento")
	private String complemento;

	@Column(name = "end_cep")
	@Size(max = 10)
	private String cep;

	private String mapLatitude;
	private String mapLongitude;

	@Convert(converter = LocalDatePersistenceConverter.class)
	@Column(name = "data_criacao")
	private LocalDate dataCriacao;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "usuario_id", nullable = false)
	private Usuario usuario;

	@OneToOne(fetch = FetchType.LAZY)
	private Plano plano;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "categoria_id")
	private Categoria categoria;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "sub_categoria_id")
	private SubCategoria subCategoria;

	@Basic(fetch = FetchType.LAZY)
	@Lob
	@Column(columnDefinition = "mediumblob")
	private byte[] logotipo;

	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name = "anuncio_id", referencedColumnName = "id_anuncio")
	private List<FileMeta> listaImagens = new ArrayList<FileMeta>();

	@ElementCollection(fetch = FetchType.EAGER)
	@CollectionTable(name = "anuncio_tags")
	private List<String> tags = new ArrayList<String>();

	public String getEmail() {
		return email;
	}

	public boolean isAtivo() {
		return ativo;
	}

	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSite() {
		return site;
	}

	public void setSite(String site) {
		this.site = site;
	}

	public String getFacebook() {
		return facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}

	public String getTwitter() {
		return twitter;
	}

	public void setTwitter(String twitter) {
		this.twitter = twitter;
	}

	public String getInstagram() {
		return instagram;
	}

	public void setInstagram(String instagram) {
		this.instagram = instagram;
	}

	public String getGoogleplus() {
		return googleplus;
	}

	public void setGoogleplus(String googleplus) {
		this.googleplus = googleplus;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.setTituloNaUrl(titulo);
		this.titulo = titulo.toUpperCase();
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.setDescricaoHtml(descricao);
		this.descricao = descricao;
	}

	public Cidade getCidade() {
		return cidade;
	}

	public void setCidade(Cidade cidade) {
		this.cidade = cidade;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Plano getPlano() {
		return plano;
	}

	public void setPlano(Plano plano) {
		this.prioridadeProduto = plano.getPrioridadeProduto();
		this.plano = plano;
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	public byte[] getLogotipo() {
		return logotipo;
	}

	public void setLogotipo(byte[] logotipo) {
		this.logotipo = logotipo;
	}

	public String getTelefone1() {
		return telefone1;
	}

	public void setTelefone1(String telefone1) {
		this.telefone1 = telefone1;
	}

	public String getTelefone2() {
		return telefone2;
	}

	public void setTelefone2(String telefone2) {
		this.telefone2 = telefone2;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public int getPrioridadeProduto() {
		return prioridadeProduto;
	}

	public LocalDate getDataCriacao() {
		return dataCriacao;
	}

	public void setDataCriacao(LocalDate dataCriacao) {
		this.dataCriacao = dataCriacao;
	}

	public Estado getEstado() {
		return estado;
	}

	public void setEstado(Estado estado) {
		this.estado = estado;
	}

	public String getTituloNaUrl() {
		return tituloNaUrl;
	}

	private void setTituloNaUrl(String tituloNaUrl) {
		this.tituloNaUrl = StringFormat.formatarStringParaUrl(tituloNaUrl);
	}

	public Bairro getBairro() {
		return bairro;
	}

	public void setBairro(Bairro bairro) {
		this.bairro = bairro;
	}

	public String getDescricaoHtml() {
		return descricaoHtml;
	}

	public void setDescricaoHtml(String descricaoHtml) {
		this.descricaoHtml = descricaoHtml.replace("\n", "<br />\n");
	}

	public List<String> getTags() {
		return tags;
	}

	public void setTags(List<String> tags) {
		this.tags = tags;
	}

	public SubCategoria getSubCategoria() {
		return subCategoria;
	}

	public void setSubCategoria(SubCategoria subCategoria) {
		this.subCategoria = subCategoria;
	}

	public boolean isVerificado() {
		return verificado;
	}

	public void setVerificado(boolean verificado) {
		this.verificado = verificado;
	}

	public boolean isAprovado() {
		return aprovado;
	}

	public void setAprovado(boolean aprovado) {
		this.aprovado = aprovado;
	}

	public String getMapLatitude() {
		return mapLatitude;
	}

	public void setMapLatitude(String mapLatitude) {
		this.mapLatitude = mapLatitude;
	}

	public String getMapLongitude() {
		return mapLongitude;
	}

	public void setMapLongitude(String mapLongitude) {
		this.mapLongitude = mapLongitude;
	}

	public List<FileMeta> getListaImagens() {
		return listaImagens;
	}

	public void setListaImagens(List<FileMeta> listaImagens) {
		this.listaImagens = listaImagens;
	}

}
