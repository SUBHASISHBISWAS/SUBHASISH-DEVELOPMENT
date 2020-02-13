import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { SVLakeviewExpensesComponent } from './svlakeview-expenses/svlakeview-expenses.component';

@NgModule({
  declarations: [
    AppComponent,
    SVLakeviewExpensesComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
