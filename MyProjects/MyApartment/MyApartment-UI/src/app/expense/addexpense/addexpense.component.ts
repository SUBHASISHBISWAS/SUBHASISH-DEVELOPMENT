import { IRemunerator, IBeneficiary } from './../Expences';
import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import {FormGroup, FormControl, NgForm, NgModel, FormBuilder, Validators}  from '@angular/forms'
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

  remunerators: IExpense[]
  benificiaries: IBeneficiary[]
  picker = new FormControl();

  filteredStates: Observable<State[]>;
  filteredRemunerators: Observable<IExpense[]>;
  filteredBenificiary: Observable<IBeneficiary[]>;
  
  addExpenseForm: FormGroup;

  constructor(private expenseService: ExpenseService, private fb :FormBuilder) 
  {

   this.expenseService.getExpenses().subscribe(result=>this.remunerators = result as IExpense[]);
   this.expenseService.getBenificiries().subscribe(result=>this.benificiaries = result as IBeneficiary[]);

    // this.filteredStates = this.stateCtrl.valueChanges
    //   .pipe(
    //     startWith(''),
    //     map(state => state ? this._filterStates(state) : this.states.slice())
    //   );

      
   }

   ngOnInit(): void {

    this.addExpenseForm=this.fb.group({
      expenseDescriptionCtrl:[''],
      expenseAmountCtrl:['1000',Validators.required],
      beneficiaryCtrl:[null],
      remuneratorCtrl:[null]

    });

    this.filteredRemunerators = this.addExpenseForm.get('remuneratorCtrl').valueChanges
      .pipe(
        startWith(''),
        map(remunarator => remunarator ? this._filterRemunerator(remunarator) : this.remunerators)
      );

      this.filteredBenificiary = this.addExpenseForm.get('beneficiaryCtrl').valueChanges
      .pipe(
        startWith(''),
        map(benificiary => benificiary ? this._filterBenificiary(benificiary) : this.benificiaries)
      );
  }

   private _filterBenificiary(value: string): IBeneficiary[] {
    const filterValue = value.toLowerCase();
    return this.benificiaries.filter(benificiary => benificiary.firstName.toLowerCase().indexOf(filterValue) === 0);
  }

  private _filterRemunerator(value: string): IExpense[] {
    const filterValue = value.toLowerCase();
    return this.remunerators.filter(remunarator => remunarator.expenseDescription.toLowerCase().indexOf(filterValue) === 0);
  }

  private _filterStates(value: string): State[] {
    const filterValue = value.toLowerCase();
    return this.states.filter(state => state.name.toLowerCase().indexOf(filterValue) === 0);
  }

  

  /*
  onSubmit(addExpenseForm : NgForm){
      console.log(addExpenseForm.valid);
      this.expenseService.postExpense(this.expense).subscribe(
        result=>console.log(result),
        error=>console.log(error)
      );
  }
*/
  /*
  onBlur(expenseDescriptionField:NgModel){
    console.log(expenseDescriptionField.valid);
    
  }
*/

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


