import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import {HttpClientModule} from '@angular/common/http';

import { AppComponent } from './app.component';
import { MedicinesComponent } from './medicines/medicines.component';
import { FormsModule } from '@angular/forms';
import { SpaceConverterPipe } from './space-converter.pipe';
import { RatingComponent } from './rating/rating.component';



@NgModule({
  declarations: [
    AppComponent,
    MedicinesComponent,
    SpaceConverterPipe,
    RatingComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpClientModule,
    AppRoutingModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
