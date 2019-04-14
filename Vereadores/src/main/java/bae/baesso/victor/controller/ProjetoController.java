package bae.baesso.victor.controller;

import java.util.List;

import javax.inject.Inject;

import bae.baesso.victor.model.Projeto;
import bae.baesso.victor.service.ProjetoService;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;

@Path("/projeto")
@Controller
public class ProjetoController {

	@Inject
	private Result result;
	@Inject
	private ProjetoService service;

	@Get("/")
	public List<Projeto> listar() {
		return service.listar();
	}

	@Get("/editar/{codProjeto}")
	public void editar(Long codProjeto) {
		Projeto projeto = service.findOne(codProjeto);
		result.include("projeto", projeto);
		result.redirectTo(this).novo();
	}

	@Get("/excluir/{codProjeto}")
	public void excluir(Long codProjeto) {
		service.excluir(codProjeto);
		result.redirectTo(this).listar();
	}

	@Post("/salvar")
	public void salvar(Projeto projeto) {
		service.salvar(projeto);
		result.redirectTo(this).listar();
	}

	@Get("/novo")
	public void novo() {
	}

}
