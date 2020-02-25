import { Injectable } from '@angular/core';
import { IExpense } from './Expences';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import {Observable, throwError, of} from 'rxjs'
import {catchError,tap} from 'rxjs/operators'


@Injectable({
  providedIn: 'root'
})
export class ExpenseService {

  private expenseUrl="https://localhost:5001/api/expenses"
  constructor(private http : HttpClient) {

  }

  getExpenses() : Observable<IExpense []>{

    return this.http.get<IExpense[]>(this.expenseUrl).pipe(
      tap(data=>console.log('All Data : '+JSON.stringify(data))),catchError(this.handleError));

  }

  postExpense(expense : IExpense): Observable<any>{
    //return of(expense);
    return this.http.post('https://putsreq.com/lglZpuOPGWwIxfr7TD2N',expense);
  }

  private handleError(err: HttpErrorResponse){

    return throwError(err.error);
  }
}
