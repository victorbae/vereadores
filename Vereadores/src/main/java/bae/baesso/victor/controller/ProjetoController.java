package bae.baesso.victor.controller;

import javax.inject.Inject;

import bae.baesso.victor.model.Projeto;
import bae.baesso.victor.service.ProjetoService;
import bae.baesso.victor.service.VereadorService;
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
	@Inject
	private VereadorService vereadorService;

	@Get("/editar/{codProjeto}")
	public void editar(Long codProjeto) {
		Projeto projeto = service.findOne(codProjeto);
		result.include("projeto", projeto);
		result.redirectTo(this).novo();
	}

	@Get("/excluir/{codProjeto}")
	public void excluir(Long codVereador, Long codProjeto) {
		service.excluir(codProjeto);
		result.include("vereador", vereadorService.findOne(codVereador));
		result.redirectTo(VereadorController.class).novo();
	}

	@Post("/salvar")
	public void salvar(Long codVereador, Projeto projeto) {
		service.salvar(projeto);
		result.include("vereador", vereadorService.findOne(codVereador));
		result.redirectTo(VereadorController.class).novo();
	}

	@Get("/novo")
	public void novo() {
	}

}
