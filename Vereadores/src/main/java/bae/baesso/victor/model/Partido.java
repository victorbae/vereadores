package bae.baesso.victor.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Partido implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6564390202334781358L;
	@Id
	@GeneratedValue
	private Long codigo;
	private Integer numero;
	private String nome;
	private String sigla;
}
