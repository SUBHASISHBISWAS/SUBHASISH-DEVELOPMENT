import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import {FormGroup, FormControl, NgForm, NgModel}  from '@angular/forms'
import { IExpense } from '../Expences';
import { ExpenseService } from '../expense.service';

@Component({
  selector: 'apt-addexpense',
  templateUrl: './addexpense.component.html',
  styleUrls: ['./addexpense.component.css']
})
export class AddexpenseComponent implements OnInit {

  expense : IExpense={
    beneficiary:null,
    expenseAmount:null,
    expenseDescription:null,
    expenseId:null,
    benificiaryRating:null,
    expenseType:null,
    transactionDate:null,
    imageUrl:null,
    remunerator:null

  }
  constructor(private expenseService: ExpenseService) {

   }

  ngOnInit(): void {
  }

  onSubmit(addExpenseForm : NgForm){
      console.log(addExpenseForm.valid);
      this.expenseService.postExpense(this.expense).subscribe(
        result=>console.log(result),
        error=>console.log(error)
      );
  }

  onBlur(expenseDescriptionField:NgModel){
    console.log(expenseDescriptionField.valid);
    
  }

}
