import { Component, OnInit } from '@angular/core';
import { IExpenses } from '../Expences';
import { ExpenseService } from '../expense.service';


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
  expenses: IExpenses[] ;
  filteredExpenses:IExpenses[];


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

    this.expenses=this.expenseService.getExpenses();
    this.filteredExpenses=this.expenses;
  }


  toggleImage(): void {
    this.showImage = !this.showImage;
  }

  performFilter(filterBy: string): IExpenses[] {
    filterBy = filterBy.toLocaleLowerCase();
    return this.expenses.filter((product: IExpenses) =>
      product.expenseDescription.toLocaleLowerCase().indexOf(filterBy) !== -1);
  }

  onStartRatingClickedInStartComponenet(message : string): void{
    this.pageTitle=message;

  }
}


