import { Component, OnInit } from '@angular/core';
import { Filme } from '../models/filme';
import { FilmesService } from '../services/filmes.service';

@Component({
  selector: 'app-body',
  templateUrl: './body.component.html',
  styleUrls: ['./body.component.css']
})
export class BodyComponent implements OnInit {
  filmes: Filme[] = [];

  constructor(private filmesService: FilmesService) { }

  ngOnInit(): void {
    this.getFilmes();
  }

  getFilmes(){
    this.filmesService.getFilmes().subscribe({
      next: response => this.filmes = response,
      error: error => console.log(error)
    });
  }

}
