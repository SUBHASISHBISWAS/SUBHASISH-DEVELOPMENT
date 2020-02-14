import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { BiswasComponent } from './biswas.component';
import { SubhasishComponent } from './subhasish/subhasish.component';



@NgModule({
  declarations: [BiswasComponent, SubhasishComponent],
  imports: [
    CommonModule
  ]
})
export class BiswasModule { }
