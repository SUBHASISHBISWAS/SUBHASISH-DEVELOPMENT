import { DemoMaterialModule } from './../material-module';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ExpenseComponent } from './expense.component';
import { ExpenseListComponent } from './expense-list/expense-list.component';
import { ExpensedetailsComponent } from './expensedetails/expensedetails.component';
import { AddexpenseComponent } from './addexpense/addexpense.component';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AppRoutingModule } from '../app-routing.module';
import { HttpClientModule } from '@angular/common/http';
import { SharedModule } from '../shared/shared.module';
import { RouterModule } from '@angular/router';
import { ExpenseRoutingModule } from '../expense/expense-routing.module';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatNativeDateModule } from '@angular/material/core';



@NgModule({
  declarations: [
    ExpenseComponent,
    ExpenseListComponent,
    ExpensedetailsComponent,
    AddexpenseComponent,
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    FormsModule,
    HttpClientModule,
    DemoMaterialModule,
    MatNativeDateModule,
    ReactiveFormsModule,
    SharedModule,
    
    RouterModule.forChild
    ([
      {path: 'expense', component:ExpenseComponent},
      {path: 'expenses', component:ExpenseListComponent},
      {path: 'addexpense', component:AddexpenseComponent},
      {path: 'expenseDetails/:expenseId', component:ExpensedetailsComponent},
    ]),
    
    //ExpenseRoutingModule,
  ]
})
export class ExpenseModule { }
