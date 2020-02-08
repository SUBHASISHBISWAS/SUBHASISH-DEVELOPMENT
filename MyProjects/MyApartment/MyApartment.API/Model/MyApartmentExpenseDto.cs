using MyApartment.Core.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyApartment.API.Model
{
    public class MyApartmentExpenseDto
    {
        private DateTime _transactionDate;
        public Guid ExpenseId { get; set; }
        public string ExpenseDescription { get; set; }
        public double ExpenseAmount { get; set; }
        public ExpenseType ExpenseType { get; set; }
        public DateTime DateOfTransaction
        {
            get;set;
        }
        public string Payee { get; set; }
        public string Payer { get; set; }
    }
}
