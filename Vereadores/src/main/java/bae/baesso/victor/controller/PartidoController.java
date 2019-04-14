package bae.baesso.victor.controller;

import java.util.List;

import javax.inject.Inject;

import bae.baesso.victor.model.Partido;
import bae.baesso.victor.service.PartidoService;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;

@Path("/partido")
@Controller
public class PartidoController {

	@Inject
	private Result result;
	@Inject
	private PartidoService service;

	@Get("/")
	public List<Partido> listar() {
		return service.listar();
	}

	@Get("/editar/{codPartido}")
	public void editar(Long codPartido) {
		Partido partido = service.findOne(codPartido);
		result.include("partido", partido);
		result.redirectTo(this).novo();
	}

	@Get("/excluir/{codPartido}")
	public void excluir(Long codPartido) {
		service.excluir(codPartido);
		result.redirectTo(this).listar();
	}

	@Post("/salvar")
	public void salvar(Partido partido) {
		service.salvar(partido);
		result.redirectTo(this).listar();
	}

	@Get("/novo")
	public void novo() {
		// Mapeado para JSP
	}

}
