package bae.baesso.victor.banco;

import java.util.List;

import bae.baesso.victor.dao.PartidoDao;
import bae.baesso.victor.model.Partido;

public class PartidoBanco implements PartidoDao {

	@Override
	public void salvar(Partido dado) {
		Banco.conectar();
		Banco.getTransaction().begin();

		try {
			Banco.getEntityManager().persist(dado);
			Banco.getTransaction().commit();
		} catch (Exception e) {
			Banco.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			Banco.desconectar();
		}

	}

	@Override
	public void alterar(Partido dado) {
		Banco.conectar();
		Banco.getTransaction().begin();

		try {
			Banco.getEntityManager().merge(dado);
			Banco.getTransaction().commit();
		} catch (Exception e) {
			Banco.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			Banco.desconectar();
		}
	}

	@Override
	public void excluir(Long codigo) {
		Banco.conectar();
		Banco.getTransaction().begin();
		try {
			Banco.getEntityManager().remove(Banco.getEntityManager().find(Partido.class, codigo));
			Banco.getTransaction().commit();
		} catch (Exception e) {
			Banco.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			Banco.desconectar();
		}
	}

	@Override
	public Partido findOne(Long cod) {
		Banco.conectar();
		try {
			return Banco.getEntityManager().find(Partido.class, cod);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			Banco.desconectar();
		}
	}

	@Override
	public List<Partido> listar() {
		Banco.conectar();

		try {
			return Banco.getEntityManager().createNamedQuery("select part from Partido part", Partido.class)
					.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			Banco.desconectar();
		}
	}

}
