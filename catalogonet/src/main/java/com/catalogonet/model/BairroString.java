package com.catalogonet.model;

/** Por algum motivo, quando vou passar a classe Cidade o java script da 
 * pagina novo_anuncio_form não aceita os atributos que n�o s�o strings
 * **/
public class BairroString {

	private String id;
	private String nome;
	
	
	public BairroString(String id, String nome) {
		super();
		this.id = id;
		this.nome = nome;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	
}
