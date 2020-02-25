import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { RouterModule } from '@angular/router'

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ExpenseComponent } from './expense/expense.component';
import { ExpenseListComponent } from './expense/expense-list/expense-list.component';
import { ConvertToSpacePipe } from './shared/convert-to-space.pipe';
import { StartratingComponent } from './shared/startrating/startrating.component';
import { WelcomeComponent } from './home/welcome.component';
import { ExpensedetailsComponent } from './expense/expensedetails/expensedetails.component';
import { AddexpenseComponent } from './expense/addexpense/addexpense.component';
import { ExpenseModule } from './expense/expense.module';
import { WelcomeModule } from './home/welcome.module';



@NgModule({
  declarations: 
  [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    FormsModule,
    AppRoutingModule,
    HttpClientModule,
    RouterModule.forRoot(
      [
      {path:'welcome', component:WelcomeComponent},
      {path: '', redirectTo:'welcome', pathMatch:'full'},
      {path: '**', redirectTo:'welcome', pathMatch:'full'}
    ]),
    ExpenseModule,
    WelcomeModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
