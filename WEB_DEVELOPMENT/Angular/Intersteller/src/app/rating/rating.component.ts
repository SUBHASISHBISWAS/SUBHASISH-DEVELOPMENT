import { Component, OnChanges, Input, Output ,EventEmitter, SimpleChanges } from '@angular/core';

@Component({
  selector: 'app-rating',
  templateUrl: './rating.component.html',
  styleUrls: ['./rating.component.css']
})
export class RatingComponent implements OnChanges {

  starWidth: number;
  @Input() rating :number;
  @Output() ratingClicked:EventEmitter<string>=new EventEmitter<string>();

  constructor() { }

  ngOnChanges(changes: SimpleChanges): void {
    this.starWidth=this.rating * 75 /5;
  }

  onClick():void
  {
    this.ratingClicked.emit(`The rating ${this.rating} was clicked`);
  }


}
