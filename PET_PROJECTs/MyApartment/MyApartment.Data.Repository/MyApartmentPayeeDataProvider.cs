using MyApartment.Core.Model;
using MyApartment.Data.Repository.Interfaces;
using MyApartment.Data.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MyApartment.Data.Repository
{
    public class MyApartmentPayeeDataProvider : IMyApartmentPayeeDataProvider
    {
        private readonly MyApartmentDbContext apartmentDbContext;

        public MyApartmentPayeeDataProvider(MyApartmentDbContext apartmentDbContext)
        {
            this.apartmentDbContext = apartmentDbContext;
        }
        public IEnumerable<IMyApartmentBeneficiary> GetAllPayees()
        {
            return apartmentDbContext.Benificiries;
        }

        public IMyApartmentBeneficiary GetPayeeById(Guid id)
        {
            return apartmentDbContext.Benificiries.FirstOrDefault(exp => exp.BeneficiaryId == id);
        }
    }
}
