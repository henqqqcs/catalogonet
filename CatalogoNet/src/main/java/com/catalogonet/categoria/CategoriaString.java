package com.catalogonet.categoria;


/** Por algum motivo, quando vou passar a classe Cateogira o java script da 
 * pagina novo_anuncio_form nao aceita os atributos que nao sao strings
 * **/
public class CategoriaString {

	private String id;
	private String nome;
	
	
	public CategoriaString(String id, String nome) {
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
