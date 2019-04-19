package bae.baesso.victor.dao;

import java.util.List;

import bae.baesso.victor.model.DadosPesquisa;
import bae.baesso.victor.model.Vereador;

public interface VereadorDao extends CrudDao<Vereador> {

	public List<Vereador> findByPesquisa(DadosPesquisa pesquisa);
}
