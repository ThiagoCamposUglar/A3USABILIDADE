package com.drevlicd.DreVlic_D.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.drevlicd.DreVlic_D.model.Filme;
import com.drevlicd.DreVlic_D.repository.FilmRepository;

@RestController
public class FilmesController {
    
	@Autowired
	private FilmRepository repository;
	
    @CrossOrigin(origins = "http://localhost:4200/")
	@GetMapping("/filmes")
	public ResponseEntity<List<Filme>> getFilmes(@RequestParam(name = "name", required = false) String nome) {
	    if(nome == null) {
	        List<Filme>filmes = repository.findAll();
	        return new ResponseEntity<List<Filme>>(filmes, HttpStatus.OK);
	    }
	    List<Filme>filmes = repository.findByNomeContains(nome);
        return new ResponseEntity<List<Filme>>(filmes, HttpStatus.OK);
	}
	
    @CrossOrigin(origins = "http://localhost:4200/")
	@PostMapping("/filmes")
	@ResponseStatus(code = HttpStatus.CREATED)
	public Filme criarFilme(@RequestBody Filme filme) {
	    return repository.save(filme);
	}
	
    @CrossOrigin(origins = "http://localhost:4200/")
    @GetMapping("/filmes/{id}")
    public ResponseEntity<Filme> getFilmeFindById(@PathVariable Long id) {
        Optional<Filme> filmes = repository.findById(id);
        return new ResponseEntity<Filme>(filmes.get(), HttpStatus.OK);
    }
    
    @CrossOrigin(origins = "http://localhost:4200/")
    @DeleteMapping("/filmes/{id}")
    public ResponseEntity<Object> deletaFilme(@PathVariable Long id) {
        repository.deleteById(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }
    
    @CrossOrigin(origins = "http://localhost:4200/")
    @PutMapping("/filmes")
    public ResponseEntity<Object> compraFilme(@RequestBody Filme filme) {
        Optional<Filme> filmes = repository.findById(filme.getId());
        Filme fmdb = filmes.get();
        fmdb.setQuant(filme.getQuant());
        repository.save(fmdb);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}