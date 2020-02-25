import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import {FormGroup, FormControl, NgForm, NgModel}  from '@angular/forms'
import { IExpense } from '../Expences';
import { ExpenseService } from '../expense.service';
import { Observable } from 'rxjs';
import { startWith, map } from 'rxjs/operators';

@Component({
  selector: 'apt-addexpense',
  templateUrl: './addexpense.component.html',
  styleUrls: ['./addexpense.component.css']
})
export class AddexpenseComponent implements OnInit {

  states: State[] = [
    {
      name: 'Arkansas',
      population: '2.978M',
      // https://commons.wikimedia.org/wiki/File:Flag_of_Arkansas.svg
      flag: 'https://upload.wikimedia.org/wikipedia/commons/9/9d/Flag_of_Arkansas.svg'
    },
    {
      name: 'California',
      population: '39.14M',
      // https://commons.wikimedia.org/wiki/File:Flag_of_California.svg
      flag: 'https://upload.wikimedia.org/wikipedia/commons/0/01/Flag_of_California.svg'
    },
    {
      name: 'Florida',
      population: '20.27M',
      // https://commons.wikimedia.org/wiki/File:Flag_of_Florida.svg
      flag: 'https://upload.wikimedia.org/wikipedia/commons/f/f7/Flag_of_Florida.svg'
    },
    {
      name: 'Texas',
      population: '27.47M',
      // https://commons.wikimedia.org/wiki/File:Flag_of_Texas.svg
      flag: 'https://upload.wikimedia.org/wikipedia/commons/f/f7/Flag_of_Texas.svg'
    }
  ];

  stateCtrl = new FormControl();
  filteredStates: Observable<State[]>;
  
  expenseTypes: IExpenseType[] = [
    {value: '0', viewValue: 'Water'},
    {value: '1', viewValue: 'Electricity'},
    {value: '2', viewValue: 'Plumber'}
  ];

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
  constructor(private expenseService: ExpenseService) 
  {

    this.filteredStates = this.stateCtrl.valueChanges
    .pipe(
      startWith(''),
      map((state: any) => state ? this._filterStates(state) : this.states.slice())
    );
   }

   private _filterStates(value: string): State[] {
    const filterValue = value.toLowerCase();
    return this.states.filter(state => state.name.toLowerCase().indexOf(filterValue) === 0);
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

  /*
  onBlur(expenseDescriptionField:NgModel){
    console.log(expenseDescriptionField.valid);
    
  }
*/

}

export interface State {
  flag: string;
  name: string;
  population: string;
}
interface IExpenseType {
  value: string;
  viewValue: string;
}


