package bae.baesso.victor.dao;

import java.util.List;

public interface CrudDao<T> {

	void salvar(T dado);

	void alterar(T dado);

	void excluir(Long codigo);

	T findOne(Long cod);

	List<T> listar();

}
