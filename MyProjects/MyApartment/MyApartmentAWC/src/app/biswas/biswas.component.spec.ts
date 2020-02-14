import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { BiswasComponent } from './biswas.component';

describe('BiswasComponent', () => {
  let component: BiswasComponent;
  let fixture: ComponentFixture<BiswasComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ BiswasComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(BiswasComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
