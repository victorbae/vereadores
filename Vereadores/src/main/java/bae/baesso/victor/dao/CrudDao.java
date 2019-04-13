package bae.baesso.victor.dao;

import java.util.List;

public interface CrudDao<T> {

	void salvar(T dado);

	void alterar(T dado);

	void excluir(Class<T> dado, Long codigo);

	T findOne(Class<T> classs, Long cod);

	List<T> listar(Class<T> classs, String query);

}
