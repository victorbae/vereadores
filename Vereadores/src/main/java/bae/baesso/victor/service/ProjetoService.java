package bae.baesso.victor.service;

import java.util.List;

import javax.inject.Inject;

import bae.baesso.victor.banco.ProjetoBanco;
import bae.baesso.victor.model.Projeto;

public class ProjetoService {

	@Inject
	private ProjetoBanco repository;

	public List<Projeto> listar() {
		return repository.listar(Projeto.class, "select proj from Projeto proj");
	}

	public Projeto findOne(Long codProjeto) {
		return repository.findOne(Projeto.class, codProjeto);
	}

	public void excluir(Long codProjeto) {
		repository.excluir(Projeto.class, codProjeto);
	}

	public void salvar(Projeto projeto) {
		repository.salvar(projeto);
	}
}
