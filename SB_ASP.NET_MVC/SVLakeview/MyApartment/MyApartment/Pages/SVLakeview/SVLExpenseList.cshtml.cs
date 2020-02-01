using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Configuration;
using MyApartment.Data.Services;
using SVLakeview.Model.Core;

namespace MyApartment.Pages.SVLakeview
{
    public class SVLExpenseListModel : PageModel
    {
        private readonly IConfiguration _configuration;
        private readonly IMyApartmentExpenseData _apartmentExpenseData;



        public SVLExpenseListModel(IConfiguration configuration, IMyApartmentExpenseData apartmentExpenseData)
        {
            _configuration = configuration;
            _apartmentExpenseData = apartmentExpenseData;
        }
        public string Message { get; set; }

        public IEnumerable<Expense> Expenses { get; set; }
        public void OnGet(string searchTerm)
        {
            if (searchTerm==null)
            {
                Expenses = _apartmentExpenseData.GetAllExpense();
            }
            else
            {
                if (searchTerm.Equals("Generator"))
                {
                    Expenses = _apartmentExpenseData.GetExpenseByType(ExpenseType.Generator);
                }

                if (searchTerm.Equals("None"))
                {
                    
                }
                Expenses = _apartmentExpenseData.GetExpenseByType(ExpenseType.None);
            }
            
            Message = _configuration["ConfigurationMessage"];
        }
    }
}