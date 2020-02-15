import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ExpenseComponent } from './expense/expense.component';
import { ExpenseListComponent } from './expense/expense-list/expense-list.component';
import { ConvertToSpacePipe } from './shared/convert-to-space.pipe';
import { StartratingComponent } from './shared/startrating/startrating.component';



@NgModule({
  declarations: [
    AppComponent,
    ExpenseComponent,
    ExpenseListComponent,
    ConvertToSpacePipe,
    StartratingComponent,
  ],
  imports: [
    BrowserModule,
    FormsModule,
    AppRoutingModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
