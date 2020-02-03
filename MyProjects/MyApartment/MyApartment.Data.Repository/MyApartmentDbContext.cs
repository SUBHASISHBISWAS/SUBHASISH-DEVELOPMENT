using MyApartment.Core.Model;

namespace MyApartment.Data.Repository
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
