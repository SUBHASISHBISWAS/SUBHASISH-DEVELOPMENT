import { Component, OnInit } from '@angular/core';
import { IMedicine } from './Medicine';
import { MedicinesService } from './medicines.service';

@Component({
  selector: 'app-medicines',
  templateUrl: './medicines.component.html',
  styleUrls: ['./medicines.component.css']
})
export class MedicinesComponent implements OnInit {

  myPageTitle :string ="Medicine List";
  imageWidth: number = 50;
  imageMargin: number = 2;
  showImage: boolean = false;
  filteredProducts=[];
  medicines : IMedicine []=[]
  _listFilter :string;
  get listFilter() :string
  {
    return this._listFilter;
  }

  set listFilter(value:string){
    this._listFilter=value;
    this.filteredProducts=this.listFilter ?
    this.performFilter(this.listFilter) : this.medicines
  }

  constructor(private medicineService :MedicinesService)
  {

  }
  performFilter(filterBy: string): IMedicine[]
  {
    filterBy = filterBy.toLocaleLowerCase();
    return this.medicines.filter((product: IMedicine) =>
      product.productName.toLocaleLowerCase().indexOf(filterBy) !== -1);
  }

  onRatingClicked(message: string): void {
    this.myPageTitle = 'Product List: ' + message;
  }
  errorMessage : string =''
  ngOnInit(): void
  {
    this.medicineService.getMedicines().subscribe({
      next : medicines =>
      {
        this.medicines=medicines;
        this.filteredProducts = this.medicines;
      },
      error: err=> this.errorMessage=err
    })
  }

  toggleImage():void{
    this.showImage=!this.showImage;
  }


}
