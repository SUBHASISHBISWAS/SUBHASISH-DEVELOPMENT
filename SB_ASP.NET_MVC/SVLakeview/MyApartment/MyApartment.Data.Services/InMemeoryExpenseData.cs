using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MyApartment.Model.Core;
using MyApartment.Model.Core.Models;

namespace MyApartment.Data.Services
{
    public class InMememoryExpenseDataProvider : IMyApartmentExpenseDataProvider
    {
        private List<IMyApartmentExpense> _expences;
        public InMememoryExpenseDataProvider()
        {
            _expences = new List<IMyApartmentExpense>()
            {
                new MyApartmentExpense
                {
                    ExpenseType = ExpenseType.Generator,
                    ExpenseAmount = 2000,
                    ExpenseDescription = "Generator",
                    ExpenseId = Guid.NewGuid(),
                    TransactionDate=DateTime.Now,
                    Payee="Manjesh",
                    Payer="SUBHASISH"

                },

                new MyApartmentExpense{
                    ExpenseType = ExpenseType.None,
                    ExpenseAmount = 2000,
                    ExpenseDescription = "General Perpose",
                    ExpenseId = Guid.NewGuid(),
                    TransactionDate=DateTime.Now,
                    Payee="Manjesh",
                    Payer="SUBHASISH"

                },
                new MyApartmentExpense{
                    ExpenseType = ExpenseType.Water,
                    ExpenseAmount = 2000,
                    ExpenseDescription = "Water Man",
                    ExpenseId = Guid.NewGuid(),
                    TransactionDate=DateTime.Now,
                    Payee="Manjesh",
                    Payer="SUBHASISH"

                },

            };

            
        }
        public IEnumerable<IMyApartmentExpense> GetAllExpense()
        {
            return _expences;
        }

        public IEnumerable<IMyApartmentExpense> GetExpenseByType(ExpenseType expenseType)
        {
            return from e in _expences
                orderby e.ExpenseAmount
                   where e.ExpenseType == expenseType
                select e;
        }

        public IMyApartmentExpense GetExpenseDetailsById(Guid id)
        {
            return _expences.SingleOrDefault(e => e.ExpenseId == id);
        }

        public IMyApartmentExpense UpdateExpense(IMyApartmentExpense updatedExpense)
        {
            var expense = _expences.SingleOrDefault(e => e.ExpenseId == updatedExpense.ExpenseId);
            if (expense == null) return null;
            expense.ExpenseDescription = updatedExpense.ExpenseDescription;
            expense.ExpenseAmount = updatedExpense.ExpenseAmount;
            expense.ExpenseType = updatedExpense.ExpenseType;
            expense.Payee = updatedExpense.Payee;
            expense.Payer = updatedExpense.Payer;
            expense.TransactionDate = updatedExpense.TransactionDate;

            return expense;
        }

        public IMyApartmentExpense AddNewExpense(IMyApartmentExpense newExpense)
        {
            _expences.Add(newExpense);
            return newExpense;
        }

        public int Commit()
        {
            return 0;
        }
    }
}
