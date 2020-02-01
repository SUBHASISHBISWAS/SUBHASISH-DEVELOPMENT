using System;
using System.Collections.Generic;
using System.Text;

namespace MyApartment.Model.Core.Models
{
    public interface IMyApartmentExpense
    {
         int ExpenseId { get; set; }
         string ExpenseDescription { get; set; }
         double ExpenseAmount { get; set; }
         ExpenseType ExpenseType { get; set; }
    }
}
