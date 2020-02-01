using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SVLakeview.Model.Core;

namespace MyApartment.Data.Services
{
    public class InMememoryExpenseData : IMyApartmentExpenseData
    {
        private IEnumerable<Expense> _expences;
        public InMememoryExpenseData()
        {
            _expences = new List<Expense>()
            {
                new Expense
                {
                    ExpenseType = ExpenseType.Generator,
                    ExpAmount = 2000,
                    ExpDescription = "Generator",
                    Id = 1

                },

                new Expense{
                    ExpenseType = ExpenseType.None,
                    ExpAmount = 2000,
                    ExpDescription = "General Perpose",
                    Id = 1

                },
                new Expense{
                    ExpenseType = ExpenseType.Water,
                    ExpAmount = 2000,
                    ExpDescription = "Water Man",
                    Id = 1

                },

            };

            
        }
        public IEnumerable<Expense> GetAllExpense()
        {
            return _expences;
        }

        public IEnumerable<Expense> GetExpenseByType(ExpenseType expenseType)
        {
            return from e in _expences
                orderby e.ExpAmount
                where e.ExpenseType == expenseType
                select e;
        }
    }
}
