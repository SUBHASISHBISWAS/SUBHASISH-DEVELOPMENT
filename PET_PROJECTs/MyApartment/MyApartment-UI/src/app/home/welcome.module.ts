import { AppRoutingModule } from './../app-routing.module';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { WelcomeComponent } from './welcome.component';



@NgModule({
  declarations: [WelcomeComponent],
  imports: 
  [
    CommonModule,
    AppRoutingModule
  ]
})
export class WelcomeModule { }
