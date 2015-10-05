package com.catalogonet.util;

import java.awt.Dimension;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.Transparency;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.catalogonet.imagem.FileMeta;

@Component
public class ImageUtils {

	private static final int LOGOTIPO_LARGURA = 100; //100X80
	private static final int LOGOTIPO_ALTURA = 80;
	private static final int FOTO_LARGURA_MAX = 600;
	private static final int FOTO_ALTURA_MAX = 500; //600X500
	

	public byte[] redimensionarImagemLogotipo(MultipartFile file) throws Exception {
		
		BufferedImage bufferedImage = convertBytesToBufferedImage(file.getBytes());
		BufferedImage resizedImage = redimensionarImagem(bufferedImage, LOGOTIPO_LARGURA, LOGOTIPO_ALTURA, true);
		return converBufferedImageToByteArray(resizedImage);
		
	}

	public byte[] alterarQualidadeDaImagem(MultipartFile file)
			throws Exception {
		BufferedImage bufferedImage = convertBytesToBufferedImage(file.getBytes());
		Dimension dimesion = pegarDimensaoImagem(bufferedImage.getWidth(), bufferedImage.getHeight(), FOTO_LARGURA_MAX, FOTO_ALTURA_MAX);
		Double width = dimesion.getWidth();
		Double height = dimesion.getHeight();
		
		int largura = width.intValue();
		int altura = height.intValue();
		
		BufferedImage resizedImage = redimensionarImagem(bufferedImage, largura, altura, true);
		return converBufferedImageToByteArray(resizedImage);
	}
	
	public byte[] alterarQualidadeDaImagem(BufferedImage bufferedImage)
			throws Exception {
		
		Dimension dimesion = pegarDimensaoImagem(bufferedImage.getWidth(), bufferedImage.getHeight(), FOTO_LARGURA_MAX, FOTO_ALTURA_MAX);
		Double width = dimesion.getWidth();
		Double height = dimesion.getHeight();
		
		int largura = width.intValue();
		int altura = height.intValue();
		
		BufferedImage resizedImage = redimensionarImagem(bufferedImage, largura, altura, true);
		return converBufferedImageToByteArray(resizedImage);
	}
	
	public byte[] transformarEmThumbnail(MultipartFile file)
			throws Exception {
		
		BufferedImage bufferedImage = convertBytesToBufferedImage(file.getBytes());
		Dimension dimesion = pegarDimensaoImagem(bufferedImage.getWidth(), bufferedImage.getHeight(), LOGOTIPO_LARGURA, LOGOTIPO_ALTURA);
		Double width = dimesion.getWidth();
		Double height = dimesion.getHeight();
		
		int largura = width.intValue();
		int altura = height.intValue();
		
		BufferedImage resizedImage = redimensionarImagem(bufferedImage, largura, altura, true);
		return converBufferedImageToByteArray(resizedImage);
		
	}
	
	public byte[] transformarEmThumbnail(BufferedImage bufferedImage)
			throws Exception {
		
		Dimension dimesion = pegarDimensaoImagem(bufferedImage.getWidth(), bufferedImage.getHeight(), LOGOTIPO_LARGURA, LOGOTIPO_ALTURA);
		Double width = dimesion.getWidth();
		Double height = dimesion.getHeight();
		
		int largura = width.intValue();
		int altura = height.intValue();
		
		BufferedImage resizedImage = redimensionarImagem(bufferedImage, largura, altura, true);
		return converBufferedImageToByteArray(resizedImage);
		
	}
	
	private Dimension pegarDimensaoImagem(int largura, int altura, int larguraMax, int alturaMax) {

	    int original_width = largura;
	    int original_height = altura;
	    int bound_width = larguraMax;
	    int bound_height = alturaMax;
	    int new_width = original_width;
	    int new_height = original_height;

	    // first check if we need to scale width
	    if (original_width > bound_width) {
	        //scale width to fit
	        new_width = bound_width;
	        //scale height to maintain aspect ratio
	        new_height = (new_width * original_height) / original_width;
	    }

	    // then check if we need to scale even with the new height
	    if (new_height > bound_height) {
	        //scale height to fit instead
	        new_height = bound_height;
	        //scale width to maintain aspect ratio
	        new_width = (new_height * original_width) / original_height;
	    }

	    return new Dimension(new_width, new_height);
	}

	public BufferedImage convertBytesToBufferedImage(byte[] file) {
		try {
			InputStream in = new ByteArrayInputStream(file);
			BufferedImage originalImage = ImageIO.read(in);
			return originalImage;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public byte[] converBufferedImageToByteArray(BufferedImage image) {

		try {
			// convert BufferedImage to byte array
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ImageIO.write(image, "png", baos);
			baos.flush();
			byte[] imageBytes = baos.toByteArray();
			baos.close();
			
			return imageBytes;
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;

	}

	private BufferedImage redimensionarImagem(BufferedImage img,
			int largura, int altura, boolean altaQualidade) {

		int type = (img.getTransparency() == Transparency.OPAQUE) ? BufferedImage.TYPE_INT_RGB
				: BufferedImage.TYPE_INT_ARGB;
		BufferedImage ret = (BufferedImage) img;
		int w, h;
		if (altaQualidade) {
			// Use multi-step technique: start with original size, then
			// scale down in multiple passes with drawImage()
			// until the target size is reached
			w = img.getWidth();
			h = img.getHeight();
		} else {
			// Use one-step technique: scale directly from original
			// size to target size with a single drawImage() call
			w = largura;
			h = altura;
		}

		do {
			if (altaQualidade && w > largura) {
				w /= 2;
				if (w < largura) {
					w = largura;
				}
			}

			if (altaQualidade && h > altura) {
				h /= 2;
				if (h < altura) {
					h = altura;
				}
			}

			BufferedImage tmp = new BufferedImage(w, h, type);
			Graphics2D g2 = tmp.createGraphics();
			g2.setRenderingHint(RenderingHints.KEY_INTERPOLATION,
					RenderingHints.VALUE_INTERPOLATION_BILINEAR);
			g2.drawImage(ret, 0, 0, w, h, null);
			g2.dispose();

			ret = tmp;
		} while (w != largura || h != altura);

		return ret;
	}

	
	public List<FileMeta> tratarImagens(MultipartFile[] files) {

		List<FileMeta> listaImagens = new ArrayList<FileMeta>();

		try {
			// tratar imagens
			if (files != null && files.length > 0) {

				for (MultipartFile file : files) {
					if (file.getSize() > 0) {
						FileMeta fileMeta = new FileMeta();

						// set imagem
						byte[] imagem = this
								.alterarQualidadeDaImagem(file);
						fileMeta.setImagem(imagem);

						// thumbnail
						byte[] thumbnail = this
								.transformarEmThumbnail(file);
						fileMeta.setThumbnail(thumbnail);

						// nome da imagem
						fileMeta.setFileName(file.getOriginalFilename());

						// extensao
						String type = file.getContentType();
						fileMeta.setFileType(type);

						listaImagens.add(fileMeta);
					}
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return listaImagens;
	}

	public byte[] tratarLogotipo(MultipartFile logotipo) {
		try {
			// salva o logotipo
			if (!logotipo.isEmpty()) {
				byte[] bytes = this.redimensionarImagemLogotipo(logotipo); // logotipo
																					// 100x80
				return bytes;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	// private static byte[] redimensionarImagem(MultipartFile file, int
	// largura, int altura) throws Exception{
	// try {
	//
	// byte[] imageInByte = file.getBytes();
	// InputStream in = new ByteArrayInputStream(imageInByte);
	// BufferedImage originalImage = ImageIO.read(in);
	//
	// int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB :
	// originalImage.getType();
	//
	// BufferedImage resizeImageHintJpg = resizeImageWithHint(originalImage,
	// largura, altura, type);
	// ByteArrayOutputStream baos = new ByteArrayOutputStream();
	// ImageIO.write(resizeImageHintJpg, "jpg", baos);
	// baos.flush();
	// byte[] bytes = baos.toByteArray();
	// baos.close();
	// return bytes;
	// } catch (Exception e) {
	// System.err.println("Erro no redimensionamento da imagem.");
	// throw new RuntimeException("Erro no redimensionamento da imagem.");
	// }
	//
	// }
	//
	// private static BufferedImage resizeImageWithHint(BufferedImage
	// originalImage, int largura, int altura, int type) {
	//
	// BufferedImage resizedImage = new BufferedImage(largura, altura, type);
	// Graphics2D g = resizedImage.createGraphics();
	// g.drawImage(originalImage, 0, 0, largura, altura, null);
	// g.dispose();
	//
	// return resizedImage;
	// }

}
