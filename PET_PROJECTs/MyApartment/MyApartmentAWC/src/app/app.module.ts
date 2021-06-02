import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { SVLakeviewExpensesComponent } from './svlakeview-expenses/svlakeview-expenses.component';
import { ExpenseComponent } from './expense/expense.component';
import { MyExpenseComponent } from './my-expense/my-expense.component';
import { Expense1Component } from './expense1/expense1.component';
import { MyViewComponent } from './my-view/my-view.component';
import { MyHello } from './my-hello.web/my-hello.web.component';
import { MyHello1 } from './my-hello1.web/my-hello1.web.component';
import { BiswasModule } from './biswas/biswas.module';
import { LoginComponent } from './login/login.component';

@NgModule({
  declarations: [
    AppComponent,
    SVLakeviewExpensesComponent,
    ExpenseComponent,
    MyExpenseComponent,
    Expense1Component,
    MyViewComponent,
    MyHello.WebComponent,
    MyHello1.WebComponent,
    LoginComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BiswasModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
