import { Component, OnInit, OnChanges, Input, Output, EventEmitter } from '@angular/core';


@Component({
  selector: 'apt-startrating',
  templateUrl: './startrating.component.html',
  styleUrls: ['./startrating.component.css']
})
export class StartratingComponent implements OnInit, OnChanges {

  constructor() { }

  @Input() rating:number;

  @Output() notifyProducList : EventEmitter<string> = new EventEmitter<string>();

  starWidth:number;

  ngOnInit(): void {
  }
  ngOnChanges(): void {
    this.starWidth=this.rating * 75/5;
  }

  onStartRatingClick():void {
    console.log((this.rating) +' Star Rating Was Clicked');
    this.notifyProducList.emit((this.rating) +' Star Rating Was Clicked');
  }


}
