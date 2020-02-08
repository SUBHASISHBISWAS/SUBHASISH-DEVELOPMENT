using System;
using System.Collections.Generic;
using System.Text;

namespace MyApartment.Core.Model.Models.Interfaces
{
    public interface IMyApartmentRemunerator
    {
        Guid RemuneratorId { get; set; }
        string FirstName { get; set; }
        string LastName { get; set; }
        DateTimeOffset DateOfBirth { get; set; }
        IEnumerable<MyApartmentExpense> Expenses { get; set; }
    }
}
