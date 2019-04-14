package bae.baesso.victor.model;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Vereador extends Pessoa implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 72516528141744963L;

	@Id
	@GeneratedValue
	private Long codigo;

	private LocalDate dataAssociacao;

	@OneToOne
	private Partido partido;

	@OneToMany
	private List<Projeto> projetos;

	public Integer qtdProjetosApresentados() {
		int count = 0;
		for (Projeto projeto : projetos) {
			if (projeto.isApresentado()) {
				count++;
			}
		}
		return count;
	}

	public Integer qtdProjetosAprovados() {
		int count = 0;
		for (Projeto projeto : projetos) {
			if (projeto.isAprovado()) {
				count++;
			}
		}
		return count;
	}
}
