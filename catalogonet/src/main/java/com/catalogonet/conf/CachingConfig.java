package com.catalogonet.conf;

import net.sf.ehcache.config.CacheConfiguration;

import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.CachingConfigurerSupport;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.cache.interceptor.KeyGenerator;
import org.springframework.cache.interceptor.SimpleKeyGenerator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@EnableCaching
public class CachingConfig extends CachingConfigurerSupport {

	@Bean(destroyMethod = "shutdown")
	public net.sf.ehcache.CacheManager ehCacheManager() {

		net.sf.ehcache.config.Configuration config = new net.sf.ehcache.config.Configuration();

		// cache de categorias
		CacheConfiguration cacheCategorias = new CacheConfiguration();
		cacheCategorias.setName("cacheCategorias");
		cacheCategorias.setMemoryStoreEvictionPolicy("LRU");
		cacheCategorias.setMaxEntriesLocalHeap(5000);
		// adiciona cache de categorias
		config.addCache(cacheCategorias);
		
		
		// cache de locais
		CacheConfiguration cacheLocais = new CacheConfiguration();
		cacheLocais.setName("cacheLocais");
		cacheLocais.setMemoryStoreEvictionPolicy("LRU");
		cacheLocais.setMaxEntriesLocalHeap(5000);
		// adiciona cache de categorias
		config.addCache(cacheLocais);

		return net.sf.ehcache.CacheManager.newInstance(config);
	}

	@Bean
	@Override
	public CacheManager cacheManager() {
		return new EhCacheCacheManager(ehCacheManager());
	}

	@Bean
	@Override
	public KeyGenerator keyGenerator() {
		return new SimpleKeyGenerator();
	}

}
