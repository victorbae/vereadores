package bae.baesso.victor.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class DadosPesquisa {

	private String nome;
	private String dataInicio;
	private String dataFim;
	private Long codigoPartido;

}
