using SVLakeview.Model.Core;
using System;
using System.Collections.Generic;

namespace MyApartment.Data.Services
{
    public interface IMyApartmentExpenseData
    {
        IEnumerable<Expense> GetAllExpense();

        IEnumerable<Expense> GetExpenseByType(ExpenseType expenseType);
    }
}
