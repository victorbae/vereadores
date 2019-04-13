package bae.baesso.victor.banco;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

public class Banco {

	protected EntityManagerFactory emf = null;
	protected EntityManager em = null;
	protected EntityTransaction et = null;

	public void conectar() {
		emf = Persistence.createEntityManagerFactory("MinhaPersistencia");
		em = emf.createEntityManager();
	}

	public void desconectar() {
		em.close();
		emf.close();
	}
}
