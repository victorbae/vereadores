package bae.baesso.victor.dao;

import java.util.List;

import bae.baesso.victor.banco.Banco;

public abstract class GenericDao<T> extends Banco implements CrudDao<T> {

	@Override
	public void salvar(T dado) {
		conectar();
		et = em.getTransaction();
		et.begin();

		try {
			em.persist(dado);
			et.commit();
		} catch (Exception e) {
			et.rollback();
			e.printStackTrace();
		} finally {
			desconectar();
		}

	}

	@Override
	public void alterar(T dado) {
		conectar();
		et = em.getTransaction();
		et.begin();

		try {
			em.merge(dado);
			et.commit();
		} catch (Exception e) {
			et.rollback();
			e.printStackTrace();
		} finally {
			desconectar();
		}
	}

	@Override
	public void excluir(Class<T> dado, Long codigo) {
		conectar();
		et = em.getTransaction();
		et.begin();

		try {
			em.remove(em.find(dado, codigo));
			et.commit();
		} catch (Exception e) {
			et.rollback();
			e.printStackTrace();
		} finally {
			desconectar();
		}
	}

	@Override
	public T findOne(Class<T> classs, Long cod) {
		conectar();
		try {
			return em.find(classs, cod);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			desconectar();
		}
	}

	@Override
	public List<T> listar(Class<T> classs, String query) {
		conectar();

		try {
			return em.createNamedQuery(query, classs).getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			desconectar();
		}
	}

}