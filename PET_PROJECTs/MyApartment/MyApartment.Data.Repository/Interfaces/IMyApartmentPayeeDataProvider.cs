using MyApartment.Core.Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace MyApartment.Data.Repository.Interfaces
{
    public interface IMyApartmentPayeeDataProvider
    {
        IEnumerable<IMyApartmentBeneficiary> GetAllPayees();
        IMyApartmentBeneficiary GetPayeeById(Guid id);
    }
}
