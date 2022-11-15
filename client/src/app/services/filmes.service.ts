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
}
