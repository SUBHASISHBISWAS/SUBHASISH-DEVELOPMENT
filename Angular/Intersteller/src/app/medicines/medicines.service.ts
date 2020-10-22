import { Injectable } from '@angular/core';
import { IMedicine } from './Medicine';
import {HttpClient, HttpErrorResponse} from '@angular/common/http'
import { Observable, throwError } from 'rxjs';

import {catchError,tap} from 'rxjs/operators';

@Injectable({
  providedIn :'root'
})
export class MedicinesService
{
  private medicineUrl='api/medicines/medicines.json'

  constructor(private httpClient: HttpClient)
  {

  }

  getMedicines(): Observable<IMedicine[]>
  {
    return this.httpClient.get<IMedicine[]>(this.medicineUrl).
    pipe(tap(data=>console.log(JSON.stringify(data))),
    catchError(this.handleError));
  }

  private handleError(err: HttpErrorResponse){
    let errMessage=err.error.message;
    return throwError(errMessage);
  }

}
