using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using MyApartment.Data.Services;
using MyApartment.Model.Core.Models;

namespace MyApartment
{
    public class EditExpenseModel : PageModel
    {
        private readonly IMyApartmentExpenseDataProvider _myExpenseDataProvider;

        public EditExpenseModel(IMyApartmentExpenseDataProvider myExpenseDataProvider)
        {
            this._myExpenseDataProvider = myExpenseDataProvider;
        }
        public IMyApartmentExpense Expense { get; set; }
        
        public IActionResult OnGet(int expenseId)
        {
            Expense = _myExpenseDataProvider.GetExpenseDetailsById(expenseId);
            if (Expense == null)
            {
                return RedirectToPage("./NotFound");
            }
            return Page();
        }
    }
}