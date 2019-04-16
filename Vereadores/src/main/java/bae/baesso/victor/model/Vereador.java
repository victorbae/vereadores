package bae.baesso.victor.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Vereador implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 72516528141744963L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long codigo;

	private Date dataAssociacao;

	@ManyToOne
	private Partido partido;

	@OneToMany
	private List<Projeto> projetos;

	@OneToOne(fetch = FetchType.EAGER)
	private Pessoa pessoa;

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
