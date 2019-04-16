package bae.baesso.victor.banco;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Banco {

	private static EntityManagerFactory emf;
	private static EntityManager em;

	public static EntityManager getEntityManager() {
		return em;
	}

	public static EntityTransaction getTransaction() {
		return em.getTransaction();
	}

	public static void conectar() {
		emf = Persistence.createEntityManagerFactory("PersistenciaVereadores");
		em = emf.createEntityManager();
	}

	public static void desconectar() {
		em.close();
		emf.close();
	}

	public static void flush() {
		Banco.conectar();
		Banco.getTransaction().begin();
		em.flush();
		Banco.desconectar();
	}

}
