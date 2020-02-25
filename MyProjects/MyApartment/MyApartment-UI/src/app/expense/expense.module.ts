import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ExpenseComponent } from './expense.component';
import { ExpenseListComponent } from './expense-list/expense-list.component';
import { ExpensedetailsComponent } from './expensedetails/expensedetails.component';
import { AddexpenseComponent } from './addexpense/addexpense.component';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { AppRoutingModule } from '../app-routing.module';
import { HttpClientModule } from '@angular/common/http';
import { SharedModule } from '../shared/shared.module';
import { RouterModule } from '@angular/router';



@NgModule({
  declarations: [
    ExpenseComponent,
    ExpenseListComponent,
    ExpensedetailsComponent,
    AddexpenseComponent,
  ],
  imports: [
    CommonModule,
    BrowserModule,
    FormsModule,
    AppRoutingModule,
    HttpClientModule,
    SharedModule,
    RouterModule.forChild
    ([
      {path: 'expense', component:ExpenseComponent},
      {path: 'expenses', component:ExpenseListComponent},
      {path: 'addexpense', component:AddexpenseComponent},
      {path: 'expenseDetails/:expenseId', component:ExpensedetailsComponent},
    ])
  ]
})
export class ExpenseModule { }
