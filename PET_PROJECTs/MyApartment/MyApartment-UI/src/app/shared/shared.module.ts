import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { StartratingComponent } from './startrating/startrating.component';
import { ConvertToSpacePipe } from './convert-to-space.pipe';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { AppRoutingModule } from '../app-routing.module';
import { HttpClientModule } from '@angular/common/http';



@NgModule({
  declarations: 
  [
    StartratingComponent,
    ConvertToSpacePipe
  ],
  imports: 
  [
    CommonModule,
    BrowserModule,
    FormsModule,
    AppRoutingModule,
    HttpClientModule,
  ],
  exports:
  [
    StartratingComponent,
    ConvertToSpacePipe
  ]
})
export class SharedModule { }
