import { Component, OnInit } from '@angular/core';
import {FormGroup, FormControl}  from '@angular/forms'
import { IExpenses } from '../Expences';

@Component({
  selector: 'apt-addexpense',
  templateUrl: './addexpense.component.html',
  styleUrls: ['./addexpense.component.css']
})
export class AddexpenseComponent implements OnInit {

  addExpenseFormGrop: FormGroup
  constructor() { }

  ngOnInit(): void {
  }

}
