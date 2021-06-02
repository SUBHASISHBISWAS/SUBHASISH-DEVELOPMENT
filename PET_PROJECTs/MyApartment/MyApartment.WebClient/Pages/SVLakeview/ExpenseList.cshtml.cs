using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using MyApartment.Core.Model;
using MyApartment.Data.Repository;
using MyApartment.WebClient.Utils;

namespace MyApartment.WebClient.Pages.SVLakeview
{
    public class ExpenseListModel : PageModel
    {
        private readonly IConfiguration _configuration;
        private readonly IMyApartmentExpenseDataProvider _apartmentExpenseDataProvider;
        private readonly ILogger<ExpenseListModel> logger;

        public ExpenseListModel(IConfiguration configuration, 
            IMyApartmentExpenseDataProvider apartmentExpenseData,
            ILogger<ExpenseListModel> logger)
        {
            _configuration = configuration;
            _apartmentExpenseDataProvider = apartmentExpenseData;
            this.logger = logger;
        }
        public string Message { get; set; }

        [BindProperty(SupportsGet =true)]
        public string SearchTerm { get; set; }

         
        public IEnumerable<IMyApartmentExpense> Expenses { get; set; }
        public void OnGet(string searchTerm)
        {
            logger.LogError("Expense Details is Accessed");

            if (searchTerm==null)
            {
                Expenses = _apartmentExpenseDataProvider.GetAllExpense();
            }
            else
            {
                var expenseType = searchTerm.ToEnum<ExpenseType>();
                Expenses = _apartmentExpenseDataProvider.GetExpenseByType(expenseType);
            }

            //Message = _configuration["ConfigurationMessage"];
            Message = "My Message";
        }
    }
}