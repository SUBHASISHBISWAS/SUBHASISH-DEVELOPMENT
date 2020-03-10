import { Component, OnInit } from '@angular/core';
import { IExpense } from '../Expences';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'apt-expensedetails',
  templateUrl: './expensedetails.component.html',
  styleUrls: ['./expensedetails.component.css']
})
export class ExpensedetailsComponent implements OnInit {

  pageTitle: string = 'Expense Detail';
  expense: IExpense;
  constructor(private router: Router, private route: ActivatedRoute) {


   }

  ngOnInit(): void {

    let expenseId=+this.route.snapshot.paramMap.get('expenseId');
    console.log("ExpenseId :: "+expenseId);
  }

  onBack(): void {
    this.router.navigate(['/products']);
  }
}
