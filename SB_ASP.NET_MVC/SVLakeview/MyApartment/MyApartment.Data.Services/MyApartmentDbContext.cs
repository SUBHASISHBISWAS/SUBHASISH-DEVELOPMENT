using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;
using MyApartment.Model.Core.Models;

namespace MyApartment.Data.Services
{
    public class MyApartmentDbContext :DbContext
    {
        public MyApartmentDbContext(DbContextOptions<MyApartmentDbContext> options):
            base(options)
        {
                
        }
        public  DbSet<IMyApartmentExpense> Expenses { get; set; }
    }
}
