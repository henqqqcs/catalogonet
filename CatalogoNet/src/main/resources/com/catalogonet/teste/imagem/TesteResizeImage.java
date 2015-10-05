package com.catalogonet.teste.imagem;

import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.Transparency;
import java.awt.image.BufferedImage;

public class TesteResizeImage {

	public static void main(String[] args) throws Exception {

//		BufferedImage img = ImageIO.read(new File(
//				"C:\\Users\\Henrique\\Pictures\\teste\\rest.jpg"));
		
		
		
//		byte[] novaImagem = ImageUtils.transformarEmThumbnail(img);
//		
//		BufferedImage bufferedImage = ImageUtils.convertBytesToBufferedImage(novaImagem);
		
		
//		ImageIO.write(bufferedImage, "jpg", new File("C:\\Users\\Henrique\\Pictures\\teste\\resized-image.png"));

	}

	public static BufferedImage getScaledInstance(BufferedImage img, int targetWidth,
			int targetHeight, boolean higherQuality) {
		
		int type = (img.getTransparency() == Transparency.OPAQUE) ? BufferedImage.TYPE_INT_RGB
				: BufferedImage.TYPE_INT_ARGB;
		BufferedImage ret = (BufferedImage) img;
		int w, h;
		if (higherQuality) {
			// Use multi-step technique: start with original size, then
			// scale down in multiple passes with drawImage()
			// until the target size is reached
			w = img.getWidth();
			h = img.getHeight();
		} else {
			// Use one-step technique: scale directly from original
			// size to target size with a single drawImage() call
			w = targetWidth;
			h = targetHeight;
		}

		do {
			if (higherQuality && w > targetWidth) {
				w /= 2;
				if (w < targetWidth) {
					w = targetWidth;
				}
			}

			if (higherQuality && h > targetHeight) {
				h /= 2;
				if (h < targetHeight) {
					h = targetHeight;
				}
			}

			BufferedImage tmp = new BufferedImage(w, h, type);
			Graphics2D g2 = tmp.createGraphics();
			g2.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
			g2.drawImage(ret, 0, 0, w, h, null);
			g2.dispose();

			ret = tmp;
		} while (w != targetWidth || h != targetHeight);

		return ret;
	}

}
