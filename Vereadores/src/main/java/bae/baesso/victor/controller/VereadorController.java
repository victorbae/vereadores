package bae.baesso.victor.controller;

import java.util.List;

import javax.inject.Inject;

import bae.baesso.victor.model.Vereador;
import bae.baesso.victor.service.VereadorService;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;

@Path("/")
@Controller
public class VereadorController {

	@Inject
	private Result result;
	@Inject
	private VereadorService service;

	@Get("/")
	public void index() {
		result.redirectTo(this).listar();
	}

	@Get("/vereador")
	public void indexTwo() {
		result.redirectTo(this).listar();
	}

	@Get("/vereador/listar")
	public List<Vereador> listar() {
		return service.listar();
	}

	@Get("vereador/editar/{codVereador}")
	public void editar(Long codVereador) {
		Vereador vereador = service.findOne(codVereador);
		result.include("vereador", vereador);
		result.redirectTo(this).novo();
	}

	@Get("/vereador/excluir/{codVereador}")
	public void excluir(Long codVereador) {
		service.excluir(codVereador);
		result.redirectTo(this).listar();
	}

	@Post("/vereador/salvar")
	public void salvar(Vereador vereador) {
		service.salvar(vereador);
		result.redirectTo(this).listar();
	}

	@Get("/vereador/novo")
	public void novo() {
	}

}
