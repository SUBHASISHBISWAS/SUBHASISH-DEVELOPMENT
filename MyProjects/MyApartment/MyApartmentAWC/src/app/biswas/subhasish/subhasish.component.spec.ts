import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SubhasishComponent } from './subhasish.component';

describe('SubhasishComponent', () => {
  let component: SubhasishComponent;
  let fixture: ComponentFixture<SubhasishComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SubhasishComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SubhasishComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
