package bae.baesso.victor.banco;

import java.util.List;

import bae.baesso.victor.dao.VereadorDao;
import bae.baesso.victor.model.DadosPesquisa;
import bae.baesso.victor.model.Vereador;

public class VereadorBanco extends Banco implements VereadorDao {

	@Override
	public void salvar(Vereador dado) {
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
	public void alterar(Vereador dado) {
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
			Banco.getEntityManager().remove(Banco.getEntityManager().find(Vereador.class, codigo));
			Banco.getTransaction().commit();
		} catch (Exception e) {
			Banco.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			Banco.desconectar();
		}
	}

	@Override
	public Vereador findOne(Long cod) {
		Banco.conectar();
		try {
			return Banco.getEntityManager().find(Vereador.class, cod);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			Banco.desconectar();
		}
	}

	@Override
	public List<Vereador> listar() {
		Banco.conectar();

		try {
			return Banco.getEntityManager().createQuery("select vers from Vereador vers", Vereador.class)
					.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			Banco.desconectar();
		}
	}

	@Override
	public List<Vereador> findByPesquisa(DadosPesquisa pesquisa) {
		Banco.conectar();

		try {
			// @formatter:off
			return Banco.getEntityManager()
					.createQuery("select vers from Vereador vers "
							+ "where (vers.pessoa.nome like :nome or :nome is null) and "
							+ "(vers.dataAssociacao between :dataInicial and :dataFinal or (:dataInicial is null or :dataFinal is null)) and "
							+ "(vers.partido.codigo = :codPartido or (:codPartido is null))", Vereador.class)
					.setParameter("nome", pesquisa.getNome() != null ? "%" + pesquisa.getNome() + "%" : null)
					.setParameter("dataInicial", pesquisa.getDataInicio() != null ? pesquisa.getDataInicio() : null)
					.setParameter("dataFinal", pesquisa.getDataFim() != null ? pesquisa.getDataFim() : null)
					.setParameter("codPartido", pesquisa.getCodigoPartido() != null ? pesquisa.getCodigoPartido() : null)
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
