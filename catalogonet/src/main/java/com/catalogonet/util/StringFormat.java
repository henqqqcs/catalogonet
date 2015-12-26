package com.catalogonet.util;

import java.text.Normalizer;
import java.util.regex.Pattern;

public class StringFormat {

	private static final Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
	
	public static String formatarStringParaAlgoritmoDeBusca(String str) {
		str = removeEspacosEmBrancoEColocaToLowerCase(str);
		str = removerAcentos(str);
		str = removerNaoAlphaNumericos(str);
		return str;
	}
	
	public static String formatarStringParaUrl(String str) {
		str = removeEspacosEmBrancoEColocaToLowerCase(str);
		str = removerAcentos(str);
		str = removerNaoAlphaNumericos(str);
		return replaceEspacosEmBrancoPorTracos(str);
	}
	
	public static String replaceEspacosEmBrancoPorTracos(String str) {
		return str.trim().replaceAll(" ", "-");
	}
	
	public static String removeEspacosEmBrancoEColocaToLowerCase(String str) {
		return str.trim().toLowerCase();
	}
	
	public static String removerAcentos (String str) {
		String nfdNormalizedString = Normalizer.normalize(str, Normalizer.Form.NFD);
		str = pattern.matcher(nfdNormalizedString).replaceAll("");
		return str;
	}
	
	public static String removerNaoAlphaNumericos(String str) {
		return str.replaceAll("[^A-Za-z0-9 ]", " ").replaceAll("\\s+", " ").trim();
	}
	

	
}
