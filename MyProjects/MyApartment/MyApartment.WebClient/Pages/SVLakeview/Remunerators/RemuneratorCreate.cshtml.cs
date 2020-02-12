using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using MyApartment.Core.Model;
using MyApartment.Data.Services;

namespace MyApartment.WebClient
{
    public class RemuneratorCreateModel : PageModel
    {
        private readonly MyApartment.Data.Services.MyApartmentDbContext _context;

        public RemuneratorCreateModel(MyApartment.Data.Services.MyApartmentDbContext context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
            return Page();
        }

        [BindProperty]
        public MyApartmentRemunerator MyApartmentRemunerator { get; set; }

        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Remunerators.Add(MyApartmentRemunerator);
            await _context.SaveChangesAsync();

            return RedirectToPage("./RemuneratorIndex");
        }
    }
}
