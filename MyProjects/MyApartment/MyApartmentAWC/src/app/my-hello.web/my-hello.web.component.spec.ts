import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MyHello.WebComponent } from './my-hello.web.component';

describe('MyHello.WebComponent', () => {
  let component: MyHello.WebComponent;
  let fixture: ComponentFixture<MyHello.WebComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MyHello.WebComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MyHello.WebComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
