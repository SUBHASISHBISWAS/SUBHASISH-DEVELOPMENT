using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using MyApartment.Core.Model;
using MyApartment.Data.Services;

namespace MyApartment.WebClient
{
    public class RemuneratorEditModel : PageModel
    {
        private readonly MyApartment.Data.Services.MyApartmentDbContext _context;

        public RemuneratorEditModel(MyApartment.Data.Services.MyApartmentDbContext context)
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

        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Attach(MyApartmentRemunerator).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MyApartmentRemuneratorExists(MyApartmentRemunerator.RemuneratorId))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return RedirectToPage("./Index");
        }

        private bool MyApartmentRemuneratorExists(Guid id)
        {
            return _context.Remunerators.Any(e => e.RemuneratorId == id);
        }
    }
}
