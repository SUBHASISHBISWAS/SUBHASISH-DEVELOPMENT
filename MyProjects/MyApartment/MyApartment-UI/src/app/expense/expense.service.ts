import { Injectable } from '@angular/core';
import { IExpense, IRemunerator, IBeneficiary } from './Expences';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import {Observable, throwError, of} from 'rxjs'
import {catchError,tap} from 'rxjs/operators'


@Injectable({
  providedIn: 'root'
})
export class ExpenseService {

  private expenseUrl="https://localhost:5001/api/expenses"
  private benificieriesUrl="https://localhost:5001/api/SVLakeview/AddExpense/Benificiries"
  private remuneratorsUrl="https://localhost:5001/api/SVLakeview/AddExpense/?handler=SearchRemunerators"
  constructor(private http : HttpClient) {

  }

  getExpenses() : Observable<IExpense []>{

    return this.http.get<IExpense[]>(this.expenseUrl).pipe(
      tap(data=>console.log('All Data : '+JSON.stringify(data))),catchError(this.handleError));

  }

  getRemunarators() : Observable<IRemunerator []>{
    
    return this.http.get<IRemunerator[]>(this.remuneratorsUrl).pipe(
      tap(data=>console.log('All Data : '+JSON.stringify(data))),catchError(this.handleError));

  }

  getBenificiries() : Observable<IBeneficiary []>{

    return this.http.get<IBeneficiary[]>(this.benificieriesUrl).pipe(
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
