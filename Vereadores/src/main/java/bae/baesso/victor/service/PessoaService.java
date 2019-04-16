package bae.baesso.victor.service;

import javax.annotation.Resource;
import javax.inject.Inject;

import bae.baesso.victor.banco.PessoaBanco;
import bae.baesso.victor.model.Pessoa;

@Resource
public class PessoaService {

	@Inject
	private PessoaBanco repository;

	public void salvar(Pessoa pessoa) {
		if (pessoa.getCodigo() == null) {
			repository.salvar(pessoa);
		} else {
			repository.alterar(pessoa);
		}

	}

	public Pessoa buscaOuCriaNovaPessoa(Pessoa pessoa) {
		Pessoa pess = new Pessoa();
		pess.setNome(pessoa.getNome());
		if (pessoa.getCodigo() == null) {
			return repository.salvarr(pess);
		} else {
			return repository.findOne(pessoa.getCodigo());
		}

	}
}
