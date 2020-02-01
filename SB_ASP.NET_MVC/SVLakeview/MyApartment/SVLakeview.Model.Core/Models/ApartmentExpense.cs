using MyApartment.Model.Core.Models;
using System;

namespace MyApartment.Model.Core.Models
{
   
    public class MyApartmentExpense : IMyApartmentExpense
    {
        private DateTime _transactionDate;
        public int ExpenseId { get; set; }
        public string ExpenseDescription { get; set; }
        public double ExpenseAmount { get; set; }
        public ExpenseType ExpenseType { get; set; }
        public DateTime TransactionDate 
        {
            get
            {
                return _transactionDate;
            }
            set
            {
                _transactionDate = DateTime.Now;
            }
        }
        public string Payee { get; set; }
        public string Payer { get; set; }
    }
}
