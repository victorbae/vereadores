package bae.baesso.victor.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Projeto implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 546581396068901361L;
	@Id
	@GeneratedValue
	private Long codigo;
	private String nome;
	private boolean aprovado;
	private boolean apresentado;

}
