package com.fpltn.util;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	/* private static SessionFactory sessionFactory; */
	private static final SessionFactory sessionFactory = buildSessionFactory();
	private static SessionFactory buildSessionFactory() {
		// Create the SessionFactory from hibernate.cfg.xml
		return new Configuration().configure().buildSessionFactory();
	}

	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}
//	public static SessionFactory getSessionFactory() {
//		if (sessionFactory == null) {
//			// loads configuration and mappings
//			Configuration configuration = new Configuration();
//			configuration.configure();
//
//			StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().configure();
//			sessionFactory = configuration.buildSessionFactory(builder.build());
//		}
//
//		return sessionFactory;
//	}

	static void shutdown() {
		// Close caches and connection pools
		getSessionFactory().close();
	}
}