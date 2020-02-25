import { Component, OnInit } from '@angular/core';
import { IExpense } from '../Expences';
import { ExpenseService } from '../expense.service';
import { throwError } from 'rxjs';


@Component({
  selector: 'apt-expenses',
  templateUrl: './expense-list.component.html',
  styleUrls: ['./expense-list.component.css'],
  providers:[ExpenseService]
})
export class ExpenseListComponent implements OnInit {

  pageTitle:string ="SvLakeView Expenses"
  imageWidth:number=50;
  imageMargin:number=2;
  showImage:boolean=true;
  errorMessage:string;
  expenses: IExpense[] ;
  filteredExpenses:IExpense[];


  private _listFilter : string;
  public get listFilter() : string {
    return this._listFilter;
  }
  public set listFilter(value : string) {
    this._listFilter = value;
    this.filteredExpenses=this.listFilter ?
    this.performFilter(this.listFilter) : this.expenses
  }


  constructor(private expenseService : ExpenseService)
  {

  }

  ngOnInit(): void {

    this.expenseService.getExpenses().subscribe({
      next: responseExpenses=>
      {
        this.expenses=responseExpenses;
        this.filteredExpenses=this.expenses;
      },
      error: err=>this.errorMessage=err
    });

  }


  toggleImage(): void {
    this.showImage = !this.showImage;
  }

  performFilter(filterBy: string): IExpense[] {
    filterBy = filterBy.toLocaleLowerCase();
    return this.expenses.filter((product: IExpense) =>
      product.expenseDescription.toLocaleLowerCase().indexOf(filterBy) !== -1);
  }

  onStartRatingClickedInStartComponenet(message : string): void{
    this.pageTitle=message;

  }
}


