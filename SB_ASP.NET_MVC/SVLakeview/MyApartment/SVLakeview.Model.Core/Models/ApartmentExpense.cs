using MyApartment.Model.Core.Models;
using System;

namespace MyApartment.Model.Core.Models
{
   
    public class MyApartmentExpense : IMyApartmentExpense
    {
        public int ExpenseId { get; set; }
        public string ExpenseDescription { get; set; }
        public double ExpenseAmount { get; set; }
        public ExpenseType ExpenseType { get; set; }
    }
}
