import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SVLakeviewExpensesComponent } from './svlakeview-expenses.component';

describe('SVLakeviewExpensesComponent', () => {
  let component: SVLakeviewExpensesComponent;
  let fixture: ComponentFixture<SVLakeviewExpensesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SVLakeviewExpensesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SVLakeviewExpensesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
