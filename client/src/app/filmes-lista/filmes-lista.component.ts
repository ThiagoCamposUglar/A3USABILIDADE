import { Component, OnInit } from '@angular/core';
import { Filme } from '../models/filme';
import { FilmesService } from '../services/filmes.service';

@Component({
  selector: 'app-filmes-lista',
  templateUrl: './filmes-lista.component.html',
  styleUrls: ['./filmes-lista.component.css']
})
export class FilmesListaComponent implements OnInit {
  filmes: Filme[] = [];

  constructor(private filmesService: FilmesService) { }

  ngOnInit(): void {
    this.getFilmes();
    
  }

  getFilmes(){
    this.filmesService.getFilmes().subscribe({
      next: response => {
        this.filmes = response;
        console.log(response);
      },
      error: error => {
        console.log(error);
      }
    })
  }

}
