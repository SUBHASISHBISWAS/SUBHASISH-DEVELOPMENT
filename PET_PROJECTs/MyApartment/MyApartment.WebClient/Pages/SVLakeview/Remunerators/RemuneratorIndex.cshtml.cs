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
    public class RemuneratorIndexModel : PageModel
    {
        private readonly MyApartment.Data.Services.MyApartmentDbContext _context;

        public RemuneratorIndexModel(MyApartment.Data.Services.MyApartmentDbContext context)
        {
            _context = context;
        }

        public IList<MyApartmentRemunerator> MyApartmentRemunerator { get;set; }

        public async Task OnGetAsync()
        {
            MyApartmentRemunerator = await _context.Remunerators.ToListAsync();
        }
    }
}
