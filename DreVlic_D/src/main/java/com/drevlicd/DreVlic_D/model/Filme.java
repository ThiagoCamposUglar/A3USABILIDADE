package com.drevlicd.DreVlic_D.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table
public class Filme implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    @Column(name = "nome")
	private String nome;
    
    @Column(name = "preco")
	private double preco;
	
    @Column(name = "quant")
	private int quant;
    
    @Column(name = "id")
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
}