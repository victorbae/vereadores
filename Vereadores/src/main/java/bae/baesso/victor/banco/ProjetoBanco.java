package bae.baesso.victor.banco;

import java.util.List;

import bae.baesso.victor.dao.ProjetoDao;
import bae.baesso.victor.model.DadosPesquisa;
import bae.baesso.victor.model.Projeto;

public class ProjetoBanco extends Banco implements ProjetoDao {

	@Override
	public void salvar(Projeto dado) {
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
	public void excluir(Long codigo) {
		Banco.conectar();
		Banco.getTransaction().begin();
		try {
			Banco.getEntityManager().remove(Banco.getEntityManager().find(Projeto.class, codigo));
			Banco.getTransaction().commit();
		} catch (Exception e) {
			Banco.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			Banco.desconectar();
		}
	}

	@Override
	public Projeto findOne(Long cod) {
		Banco.conectar();
		try {
			return Banco.getEntityManager().find(Projeto.class, cod);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			Banco.desconectar();
		}
	}

	@Override
	public List<Projeto> listar() {
		Banco.conectar();

		try {
			return Banco.getEntityManager().createQuery("select proj from Projeto proj", Projeto.class).getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			Banco.desconectar();
		}
	}

	@Override
	public void alterar(Projeto dado) {
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
	public List<Projeto> findByPesquisa(DadosPesquisa pesquisa) {
		Banco.conectar();

		try {
			// @formatter:off
			return Banco.getEntityManager()
					.createQuery("select proj from Projeto proj "
							+ "where (proj.nome like :nome or :nome is null) and "
							+ "(proj.vereador.codigo = :codVereador or ( :codVereador is null))", Projeto.class)
					.setParameter("nome", pesquisa.getNomeProjeto() != null ? "%" + pesquisa.getNomeProjeto() + "%" : null)
					.setParameter("codVereador", pesquisa.getCodigoVereador() != null ? pesquisa.getCodigoVereador() : null)
					.getResultList();
			// @formatter:on
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			Banco.desconectar();
		}
	}

}
