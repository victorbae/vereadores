package bae.baesso.victor.dao;

import java.util.List;

import bae.baesso.victor.model.DadosPesquisa;
import bae.baesso.victor.model.Projeto;

public interface ProjetoDao extends CrudDao<Projeto> {

	public List<Projeto> findByPesquisa(DadosPesquisa pesquisa);

}
