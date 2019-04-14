package bae.baesso.victor.service;

import java.util.List;

import javax.inject.Inject;

import bae.baesso.victor.banco.VereadorBanco;
import bae.baesso.victor.model.Vereador;

public class VereadorService {

	@Inject
	private VereadorBanco repository;

	public List<Vereador> listar() {
		return repository.listar(Vereador.class, "select ver from Vereador ver");
	}

	public Vereador findOne(Long codVereador) {
		return repository.findOne(Vereador.class, codVereador);
	}

	public void excluir(Long codVereador) {
		repository.excluir(Vereador.class, codVereador);
	}

	public void salvar(Vereador vereador) {
		repository.salvar(vereador);
	}

}
