using MyApartment.Model.Core;
using MyApartment.Model.Core.Models;
using System;
using System.Collections.Generic;

namespace MyApartment.Data.Services
{
    public interface IMyApartmentExpenseDataProvider
    {
        IEnumerable<IMyApartmentExpense> GetAllExpense();

        IEnumerable<IMyApartmentExpense> GetExpenseByType(ExpenseType expenseType);

        IMyApartmentExpense GetExpenseDetailsById(Guid id);

        IMyApartmentExpense UpdateExpense(IMyApartmentExpense updatedExpense);

        IMyApartmentExpense AddNewExpense(IMyApartmentExpense newExpense);

        int Commit();
    }
}
