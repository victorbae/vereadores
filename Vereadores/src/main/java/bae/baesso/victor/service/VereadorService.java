package bae.baesso.victor.service;

import java.util.List;

import javax.inject.Inject;

import bae.baesso.victor.banco.VereadorBanco;
import bae.baesso.victor.model.Vereador;

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
		repository.salvar(vereador);
	}

}
