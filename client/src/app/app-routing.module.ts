import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { FilmesListaComponent } from './filmes-lista/filmes-lista.component';

const routes: Routes = [
  {path: '', component: FilmesListaComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
