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



@NgModule({
  declarations: [
    AppComponent,
    ExpenseComponent,
    ExpenseListComponent,
    ConvertToSpacePipe,
    StartratingComponent,
    WelcomeComponent,
    ExpensedetailsComponent,
    AddexpenseComponent,
  ],
  imports: [
    BrowserModule,
    FormsModule,
    AppRoutingModule,
    HttpClientModule,
    RouterModule.forRoot(
      [
      {path: 'expense', component:ExpenseComponent},
      {path: 'expenses', component:ExpenseListComponent},
      {path:'welcome', component:WelcomeComponent},
      {path: 'expenseDetails/:expenseId', component:ExpensedetailsComponent},
      {path: '', redirectTo:'welcome', pathMatch:'full'},
      {path: '**', redirectTo:'welcome', pathMatch:'full'}
    ])
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
