import { Component, Input, OnInit } from '@angular/core';
import { Filme } from '../models/filme';
import { Router, ActivatedRoute, ParamMap } from '@angular/router';
import { FilmesService } from '../services/filmes.service';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';

@Component({
  selector: 'app-filme-edit',
  templateUrl: './filme-edit.component.html',
  styleUrls: ['./filme-edit.component.css']
})
export class FilmeEditComponent implements OnInit {
  filme!: Filme;
  id!: string;
  form!: FormGroup;

  constructor(private route: ActivatedRoute, private router: Router,private filmesService: FilmesService, private formBuilder: FormBuilder) { }

  ngOnInit(): void {
    this.createForm();
    this.editForm();
  }

  private editForm() {
    const param = this.route.snapshot.paramMap.get('id');
    if(param){
      this.id = param;
      this.getFilme(this.id);
    }
  }

  private createForm() {
    this.form = this.formBuilder.group({
      id: [undefined],
      nome: [''],
      preco: [undefined],
      quant: [undefined],
      urlImagem: [undefined]
    });
  }

  getFilme(id: string){
    this.filmesService.getFilmeById(id).subscribe({
      next: response => {
        this.filme = response
        this.form.get('nome')?.setValue(this.filme.nome);
        this.form.get('preco')?.setValue(this.filme.preco);
        this.form.get('quant')?.setValue(this.filme.quant);
        this.form.get('urlImagem')?.setValue(this.filme.urlImagem);
        this.form.get('id')?.setValue(this.filme.id);
      },
      error: error => console.log(error)
    });
  }

  createFilme(){
    let filme = this.form.getRawValue() as Filme;
    this.filmesService.createFilme(filme).subscribe({
      next: response => {
        window.alert('Filme cadastrado com sucesso!');
        this.router.navigate(['']);
    },
      error: error => console.log(error) 
    })
  }

  updateFilme(){
    let filme = this.form.getRawValue() as Filme;
    this.filmesService.updateFilme(filme).subscribe({
      next: response => {
        window.alert('Filme alterado com sucesso!')
        this.router.navigate([''])
      },
      error: error => console.log(error)
    });
  }

  deleteFilme(){
    this.filmesService.deleteFilme(this.id).subscribe({
      next: response => {
        window.alert('Filme excluído com sucesso!')
        this.router.navigate([''])
      },
      error: error => console.log(error)
    });
  }

}
