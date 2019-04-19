package bae.baesso.victor.service;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import bae.baesso.victor.banco.VereadorBanco;
import bae.baesso.victor.model.DadosPesquisa;
import bae.baesso.victor.model.Vereador;

@Resource
public class VereadorService {

	@Inject
	private VereadorBanco repository;

	public List<Vereador> listar() {
		return repository.listar();
	}

	public Vereador findOne(Long codVereador) {
		return repository.findOne(codVereador);
	}

	public void excluir(Long codVereador) {
		repository.excluir(codVereador);
	}

	public void salvar(Vereador vereador) {

		if (vereador.getCodigo() == null) {
			repository.salvar(vereador);
		} else {
			repository.alterar(vereador);
		}
	}

	public List<Vereador> pesquisar(DadosPesquisa pesquisa) {
		return repository.findByPesquisa(pesquisa);
	}

}
