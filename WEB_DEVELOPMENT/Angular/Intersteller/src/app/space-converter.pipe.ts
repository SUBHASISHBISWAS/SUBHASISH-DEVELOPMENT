import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'spaceConverter'
})
export class SpaceConverterPipe implements PipeTransform {

  transform(value: string, character :string): string {
    return value.replace(character,' ');
  }

}
