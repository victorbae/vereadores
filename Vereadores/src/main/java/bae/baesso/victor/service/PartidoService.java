package bae.baesso.victor.service;

import java.util.List;

import javax.inject.Inject;

import bae.baesso.victor.banco.PartidoBanco;
import bae.baesso.victor.model.Partido;

public class PartidoService {

	@Inject
	private PartidoBanco repository;

	public List<Partido> listar() {
		return repository.listar();
	}

	public Partido findOne(Long codPartido) {
		return repository.findOne(codPartido);
	}

	public void excluir(Long codPartido) {
		repository.excluir(codPartido);
	}

	public void salvar(Partido partido) {
		repository.salvar(partido);
	}
}
