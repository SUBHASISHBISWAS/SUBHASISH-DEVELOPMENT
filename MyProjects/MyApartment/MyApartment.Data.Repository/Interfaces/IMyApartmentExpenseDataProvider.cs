using MyApartment.Core.Model;
using System;
using System.Collections.Generic;
using System.Security.Principal;

namespace MyApartment.Data.Repository
{
    public interface IMyApartmentExpenseDataProvider
    {
        IEnumerable<IMyApartmentExpense> GetAllExpense();

        IEnumerable<IMyApartmentExpense> GetExpenseByType(ExpenseType expenseType);

        IMyApartmentExpense GetExpenseDetailsById(Guid id);

        IMyApartmentExpense UpdateExpense(IMyApartmentExpense updatedExpense);

        IMyApartmentExpense AddNewExpense(IMyApartmentExpense newExpense);

        IMyApartmentExpense DeleteExpense(Guid id);

        IEnumerable<IMyApartmentBeneficiary> GetBenificiries();

        IEnumerable<IMyApartmentRemunerator> GetRemunerators();

        bool IsExpenseExists(Guid id);

        int GetExpenseCount();

        int Commit();
    }
}
