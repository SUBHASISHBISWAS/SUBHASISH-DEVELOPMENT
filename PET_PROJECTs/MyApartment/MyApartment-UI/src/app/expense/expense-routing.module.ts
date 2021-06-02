import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ExpenseComponent } from './expense.component';
import { ExpenseListComponent } from './expense-list/expense-list.component';
import { AddexpenseComponent } from './addexpense/addexpense.component';
import { ExpensedetailsComponent } from './expensedetails/expensedetails.component';



const routes: Routes =
  [
    {path: 'expense', component:ExpenseComponent},
    {path: 'expenses', component:ExpenseListComponent},
    {path: 'addexpense', component:AddexpenseComponent},
    {path: 'expenseDetails/:expenseId', component:ExpensedetailsComponent},
  ];
@NgModule({
  imports:
    [
      RouterModule.forChild(routes)
    ],
  exports: [RouterModule],
})
export class ExpenseRoutingModule { }
