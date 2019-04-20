package bae.baesso.victor.controller;

import java.util.List;

import javax.inject.Inject;

import bae.baesso.victor.model.DadosPesquisa;
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

	@Get("/")
	public void index() {
		result.redirectTo(this).listar();
	}

	@Get("/listar")
	public List<Projeto> listar() {
		result.include("vereadores", vereadorService.listar());
		return service.listar();
	}

	@Get("/excluir/{codVereador}/{codProjeto}")
	public void excluir(Long codVereador, Long codProjeto) {
		service.excluir(codProjeto);
		result.include("vereador", vereadorService.findOne(codVereador));
		result.redirectTo(VereadorController.class).novo();
	}

	@Post("/salvar")
	public void salvar(Projeto projeto) {
		service.salvar(projeto);
		result.include("vereador", vereadorService.findOne(projeto.getVereador().getCodigo()));
		result.redirectTo(VereadorController.class).novo();
	}

	@Post("/pesquisar")
	public void pesquisar(DadosPesquisa pesquisa) {
		result.redirectTo(this).listar(service.pesquisar(pesquisa));
	}

	@Get("/pesquisar")
	public void listar(List<Projeto> projetos) {
		result.include("vereadores", vereadorService.listar());
		result.include("projetoList", projetos);
	}

}
