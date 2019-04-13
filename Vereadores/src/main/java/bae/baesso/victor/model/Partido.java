package bae.baesso.victor.model;

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
@Entity(name = "PARTIDO")
public class Partido {

	@Id
	@GeneratedValue
	private Long codigo;
	private Integer numero;
	private String nome;
}
