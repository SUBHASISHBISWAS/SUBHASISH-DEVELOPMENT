import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'apt-welcome',
  templateUrl: './welcome.component.html',
  styleUrls: ['./welcome.component.css']
})
export class WelcomeComponent implements OnInit {

  pageTitle:string="";
  constructor() { }

  ngOnInit(): void {
  }

}
