import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Filme } from '../models/filme';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class FilmesService {
  baseUrl = environment.apiUrl;

  constructor(private http: HttpClient) { }

  getFilmes(){
    return this.http.get<Filme[]>(this.baseUrl);
  }

  getFilmeById(id: String){
    return this.http.get<Filme>(`${this.baseUrl}/${id}`);
  }

  createFilme(filme: Filme){
    return this.http.post(this.baseUrl, filme);
  }

  updateFilme(filme: Filme){
    return this.http.put(this.baseUrl, filme);
  }

  deleteFilme(id: String){
    return this.http.delete(`${this.baseUrl}/${id}`);
  }
}
