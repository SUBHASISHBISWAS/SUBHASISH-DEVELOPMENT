using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;
using MyApartment.Core.Model;


namespace MyApartment.Data.Services
{
    public class MyApartmentDbContext :DbContext
    {
        public MyApartmentDbContext(DbContextOptions<MyApartmentDbContext> options):
            base(options)
        {
                
        }
        public  DbSet<MyApartmentExpense> Expenses { get; set; }
        public DbSet<MyApartmentBeneficiary> Benificiries { get; set; }
        public DbSet<MyApartmentRemunerator> Renumerators { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            //optionsBuilder.UseSqlServer(Configuration.GetConnectionString("SVLakeview"));
            //optionsBuilder.UseSqlServer("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=SVLakeviewApartment;Integrated Security=True;");
        }
    }
}
