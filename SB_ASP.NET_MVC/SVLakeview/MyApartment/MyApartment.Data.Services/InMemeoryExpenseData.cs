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
        private IEnumerable<IMyApartmentExpense> _expences;
        public InMememoryExpenseDataProvider()
        {
            _expences = new List<IMyApartmentExpense>()
            {
                new MyApartmentExpense
                {
                    ExpenseType = ExpenseType.Generator,
                    ExpenseAmount = 2000,
                    ExpenseDescription = "Generator",
                    ExpenseId = 1,
                    TransactionDate=DateTime.Now,
                    Payee="Manjesh",
                    Payer="SUBHASISH"

                },

                new MyApartmentExpense{
                    ExpenseType = ExpenseType.None,
                    ExpenseAmount = 2000,
                    ExpenseDescription = "General Perpose",
                    ExpenseId = 2,
                    TransactionDate=DateTime.Now,
                    Payee="Manjesh",
                    Payer="SUBHASISH"

                },
                new MyApartmentExpense{
                    ExpenseType = ExpenseType.Water,
                    ExpenseAmount = 2000,
                    ExpenseDescription = "Water Man",
                    ExpenseId = 3,
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

        public IMyApartmentExpense GetExpenseDetailsById(int id)
        {
            return _expences.SingleOrDefault(e => e.ExpenseId == id);
        }

    }
}
