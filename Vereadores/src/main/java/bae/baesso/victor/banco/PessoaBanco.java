package bae.baesso.victor.banco;

import java.util.List;

import bae.baesso.victor.dao.PessoaDao;
import bae.baesso.victor.model.Pessoa;

public class PessoaBanco implements PessoaDao {

	@Override
	public void salvar(Pessoa dado) {
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
	public Pessoa salvarr(Pessoa dado) {
		salvar(dado);
		Banco.flush();
		return dado;
	}

	@Override
	public void alterar(Pessoa dado) {
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
			Banco.getEntityManager().remove(Banco.getEntityManager().find(Pessoa.class, codigo));
			Banco.getTransaction().commit();
		} catch (Exception e) {
			Banco.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			Banco.desconectar();
		}
	}

	@Override
	public Pessoa findOne(Long cod) {
		Banco.conectar();
		try {
			return Banco.getEntityManager().find(Pessoa.class, cod);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			Banco.desconectar();
		}
	}

	@Override
	public List<Pessoa> listar() {
		Banco.conectar();

		try {
			return Banco.getEntityManager().createQuery("select pess from Pessoa pess", Pessoa.class).getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			Banco.desconectar();
		}
	}

}
