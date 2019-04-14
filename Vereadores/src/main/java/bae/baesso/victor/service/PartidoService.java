package bae.baesso.victor.service;

import java.util.List;

import javax.inject.Inject;

import bae.baesso.victor.banco.PartidoBanco;
import bae.baesso.victor.model.Partido;

public class PartidoService {

	@Inject
	private PartidoBanco repository;

	public List<Partido> listar() {
		return repository.listar(Partido.class, "select par from Partido par");
	}

	public Partido findOne(Long codPartido) {
		return repository.findOne(Partido.class, codPartido);
	}

	public void excluir(Long codPartido) {
		repository.excluir(Partido.class, codPartido);
	}

	public void salvar(Partido partido) {
		repository.salvar(partido);
	}
}
