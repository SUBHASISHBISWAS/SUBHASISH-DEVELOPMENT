import { Injectable } from '@angular/core';
import { IExpenses } from './Expences';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import {Observable, throwError} from 'rxjs'
import {catchError,tap} from 'rxjs/operators'


@Injectable({
  providedIn: 'root'
})
export class ExpenseService {

  private expenseUrl="api/products/products.json"
  constructor(private http : HttpClient) {

  }

  getExpenses() : Observable<IExpenses []>{

    return this.http.get<IExpenses[]>(this.expenseUrl).pipe(
      tap(data=>console.log('All Data : '+JSON.stringify(data))),catchError(this.handleError));

  }

  private handleError(err: HttpErrorResponse){

    return throwError(err.error);
  }
}
