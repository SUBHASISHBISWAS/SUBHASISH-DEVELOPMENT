using Microsoft.AspNetCore.Mvc;
using MyApartment.Core.Model;
using MyApartment.Data.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyApartment.WebClient
{
    public class ExpenseCountViewComponent : ViewComponent
    {
        private readonly IMyApartmentExpenseDataProvider apartmentExpenseDataProvider;

        public ExpenseCountViewComponent(IMyApartmentExpenseDataProvider apartmentExpenseDataProvider)
        {
            this.apartmentExpenseDataProvider = apartmentExpenseDataProvider;
        }

        public IViewComponentResult Invoke()
        {
            int count = apartmentExpenseDataProvider.GetExpenseCount();
            return View(count);
        }
    }
}
