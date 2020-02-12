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
    public class RemuneratorDetailsModel : PageModel
    {
        private readonly MyApartment.Data.Services.MyApartmentDbContext _context;

        public RemuneratorDetailsModel(MyApartment.Data.Services.MyApartmentDbContext context)
        {
            _context = context;
        }

        public MyApartmentRemunerator MyApartmentRemunerator { get; set; }

        public async Task<IActionResult> OnGetAsync(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            MyApartmentRemunerator = await _context.Remunerators.FirstOrDefaultAsync(m => m.RemuneratorId == id);

            if (MyApartmentRemunerator == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
