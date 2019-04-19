package bae.baesso.victor.service;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import bae.baesso.victor.banco.ProjetoBanco;
import bae.baesso.victor.model.Projeto;

@Resource
public class ProjetoService {

	@Inject
	private ProjetoBanco repository;

	public List<Projeto> listar() {
		return repository.listar();
	}

	public Projeto findOne(Long codProjeto) {
		return repository.findOne(codProjeto);
	}

	public void excluir(Long codProjeto) {
		repository.excluir(codProjeto);
	}

	public void salvar(Projeto projeto) {
		if (projeto.temCodigo()) {
			repository.alterar(projeto);
		} else {
			repository.salvar(projeto);
		}
	}

}
