import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { MedicinesComponent } from './medicines/medicines.component';
import { FormsModule } from '@angular/forms';
import { SpaceConverterPipe } from './space-converter.pipe';

@NgModule({
  declarations: [
    AppComponent,
    MedicinesComponent,
    SpaceConverterPipe
  ],
  imports: [
    BrowserModule,
    FormsModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
