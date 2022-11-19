import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { BodyComponent } from './body/body.component';
import { FilmeEditComponent } from './filme-edit/filme-edit.component';

const routes: Routes = [
  {path: '', component: BodyComponent},
  {path: 'filme/:id', component: FilmeEditComponent},
  {path: 'filme', component: FilmeEditComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
