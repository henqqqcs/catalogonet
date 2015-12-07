package com.catalogonet.imagem;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties({ "imagem", "thumbnail" })
@Entity
public class FileMeta {

	@Id
	@GeneratedValue
	private Long id;

	private String fileName;

	@Lob
	@Column(columnDefinition = "mediumblob")
	@Basic(fetch = FetchType.LAZY)
	private byte[] imagem;
	@Lob
	@Basic(fetch = FetchType.LAZY)
	@Column(columnDefinition = "mediumblob")
	private byte[] thumbnail;
	private String fileType;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public byte[] getImagem() {
		return imagem;
	}

	public void setImagem(byte[] imagem) {
		this.imagem = imagem;
	}

	public byte[] getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(byte[] thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

}