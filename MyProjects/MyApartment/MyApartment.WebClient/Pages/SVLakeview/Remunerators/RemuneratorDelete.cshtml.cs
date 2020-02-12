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
    public class RemuneratorDeleteModel : PageModel
    {
        private readonly MyApartment.Data.Services.MyApartmentDbContext _context;

        public RemuneratorDeleteModel(MyApartment.Data.Services.MyApartmentDbContext context)
        {
            _context = context;
        }

        [BindProperty]
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

        public async Task<IActionResult> OnPostAsync(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            MyApartmentRemunerator = await _context.Remunerators.FindAsync(id);

            if (MyApartmentRemunerator != null)
            {
                _context.Remunerators.Remove(MyApartmentRemunerator);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
