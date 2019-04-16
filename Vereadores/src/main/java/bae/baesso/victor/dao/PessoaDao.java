package bae.baesso.victor.dao;

import bae.baesso.victor.model.Pessoa;

public interface PessoaDao extends CrudDao<Pessoa> {

	Pessoa salvarr(Pessoa dado);
}
