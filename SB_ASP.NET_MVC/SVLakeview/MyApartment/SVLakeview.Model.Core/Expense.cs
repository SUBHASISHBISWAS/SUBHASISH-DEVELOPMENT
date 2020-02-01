using System;

namespace SVLakeview.Model.Core
{
    public enum ExpenseType
    {
        None,
        Water,
        Generator
    }
    public class Expense
    {
        public int Id { get; set; }
        public string ExpDescription { get; set; }
        public double ExpAmount { get; set; }
        public ExpenseType ExpenseType { get; set; }
    }
}
