using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using MyApartment.Core.Model;
using MyApartment.Data.Services;

namespace MyApartment.WebClient
{
    public class IndexModel : PageModel
    {
        private readonly MyApartment.Data.Services.MyApartmentDbContext _context;

        public IndexModel(MyApartment.Data.Services.MyApartmentDbContext context)
        {
            _context = context;
        }

        public IList<MyApartmentBeneficiary> MyApartmentBeneficiary { get;set; }

        public async Task OnGetAsync()
        {
            MyApartmentBeneficiary = await _context.Benificiries.ToListAsync();
        }
    }
}
