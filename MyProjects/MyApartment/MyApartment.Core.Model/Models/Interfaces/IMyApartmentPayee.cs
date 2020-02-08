using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace MyApartment.Core.Model
{
    public interface IMyApartmentBeneficiary
    {
        Guid BeneficiaryId { get; set; }
        string FirstName { get; set; }
        string LastName { get; set; }
        string Address { get; set; }
        IEnumerable<MyApartmentExpense> Expenses { get; set; }

    }
}
