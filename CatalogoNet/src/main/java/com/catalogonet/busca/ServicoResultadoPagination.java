package com.catalogonet.busca;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;

@Component
@Scope(value = "session", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ServicoResultadoPagination implements Serializable {

	private static final long serialVersionUID = 1L;

	private Map<String, ResultadoBusca> map = new HashMap<String, ResultadoBusca>();

	public ResultadoBusca pegaResultadoBusca(String buscaID) {
		return map.get(buscaID);
	}

	public void adicionaResultadoBusca(String id, ResultadoBusca resultadoBusca) {
		map.put(id, resultadoBusca);
	}

}
