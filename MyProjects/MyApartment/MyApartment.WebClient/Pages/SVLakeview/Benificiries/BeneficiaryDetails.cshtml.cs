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
    public class BeneficiaryDetailsModel : PageModel
    {
        private readonly MyApartment.Data.Services.MyApartmentDbContext _context;

        public BeneficiaryDetailsModel(MyApartment.Data.Services.MyApartmentDbContext context)
        {
            _context = context;
        }

        public MyApartmentBeneficiary MyApartmentBeneficiary { get; set; }

        public async Task<IActionResult> OnGetAsync(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            MyApartmentBeneficiary = await _context.Benificiries.FirstOrDefaultAsync(m => m.BeneficiaryId == id);

            if (MyApartmentBeneficiary == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
