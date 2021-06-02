using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using MyApartment.Core.Model;
using MyApartment.Data.Repository;

namespace MyApartment.WebClient.Pages.SVLakeview
{
    public class AddExpenseModel : PageModel
    {
        private readonly IMyApartmentExpenseDataProvider _myExpenseDataProvider;
        private readonly IHtmlHelper _htmlHelper;

        public IEnumerable<SelectListItem> ExpenseTypes { get; set; }
        public AddExpenseModel(IMyApartmentExpenseDataProvider myExpenseDataProvider,
        IHtmlHelper htmlHelper)
        {
            _myExpenseDataProvider = myExpenseDataProvider;
            _htmlHelper = htmlHelper;
            Expense=new MyApartmentExpense();
        } 

        [BindProperty]
        public MyApartmentExpense Expense { get; set; }
        
        public IActionResult OnGet()
        {
            ExpenseTypes = _htmlHelper.GetEnumSelectList<ExpenseType>();

            Expense = new MyApartmentExpense
            {
                ExpenseId = Guid.NewGuid()
            };

            _myExpenseDataProvider.AddNewExpense(Expense);
            
            if (Expense == null)
            {
                return RedirectToPage("./NotFound");
            }
            return Page();
        }



        
        public JsonResult OnGetSearchBenificiries(string benificiryName)
        {

            var benificiries = (from benificiary  in _myExpenseDataProvider.GetBenificiries()
                                where benificiary.FirstName.StartsWith(benificiryName)
                                select new { benificiary.FirstName, benificiary.BeneficiaryId });

            return new JsonResult(benificiries);
        }

        public JsonResult OnGetSearchRemunerators(string remuneratorName)
        {

            var remunerators = (from remunerator in _myExpenseDataProvider.GetRemunerators()
                                where remunerator.FirstName.StartsWith(remuneratorName)
                                select new { remunerator.FirstName, remunerator.RemuneratorId }).ToList();

            return new JsonResult(remunerators);
        }


        public IActionResult OnPost()
        {
            

            if (ModelState.IsValid)
            {
                Expense.Payee = "Me";
                Expense = (MyApartmentExpense)_myExpenseDataProvider.AddNewExpense(Expense);
                _myExpenseDataProvider.Commit();
                TempData["TransactionMessage"] = "New Expense Created Successfully!";
                return RedirectToPage("./ExpenseDetails", new { expenseId = Expense.ExpenseId});
            }
            ExpenseTypes = _htmlHelper.GetEnumSelectList<ExpenseType>();
            return Page();
        }
    }
}