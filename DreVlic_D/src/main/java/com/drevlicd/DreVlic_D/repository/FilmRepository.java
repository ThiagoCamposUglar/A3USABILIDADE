package com.drevlicd.DreVlic_D.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;
import com.drevlicd.DreVlic_D.model.Filme;

@Repository
public interface FilmRepository extends JpaRepository<Filme, Long>{
    List<Filme> findByNomeContains(@PathVariable String name);
}