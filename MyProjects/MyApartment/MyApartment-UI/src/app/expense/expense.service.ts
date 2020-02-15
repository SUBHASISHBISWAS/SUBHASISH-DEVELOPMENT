import { Injectable } from '@angular/core';
import { IExpenses } from './Expences';


@Injectable({
  providedIn: 'root'
})
export class ExpenseService {

  constructor() { }

  getExpenses() : IExpenses []
  {
    return [
      {
        "expenseId": 1,
        "expenseDescription": "Garden Cart",
        "expenseAmount": 10000,
        "expenseType":"Water",
        "transactionDate": 15-10-9183,
        "beneficiary": "ASMITA SAHA",
        "remunerator": "SUBHASISH BISWAS",
        "benificiaryRating":2,
        "imageUrl": "assets/images/xbox-controller.png"
      },
      {
        "expenseId": 1,
        "expenseDescription": "Garden Cart",
        "expenseAmount": 10000,
        "expenseType":"Water",
        "transactionDate": 15-10-9183,
        "beneficiary": "ASMITA",
        "remunerator": "SUBHASISH BISWAS",
        "benificiaryRating":5,
        "imageUrl": "assets/images/garden_cart.png"
      }
    ];

  }
}
