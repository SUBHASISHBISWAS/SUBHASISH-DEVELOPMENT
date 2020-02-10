using System;
using System.Collections.Generic;

namespace MyApartment.Core.Model
{
    public interface IMyApartmentExpense
    {
        Guid ExpenseId { get; set; }
        string ExpenseDescription { get; set; }
        double ExpenseAmount { get; set; }
        ExpenseType ExpenseType { get; set; }
        DateTime TransactionDate { get; set; }
        string Payee { get; set; }
        string Payer { get; set; }
        MyApartmentRemunerator Remunerator { get; set; }
        Guid RemuneratorId { get; set; }
        MyApartmentBeneficiary Beneficiary { get; set; }
        Guid BeneficiaryId { get; set; }

        //IEnumerable<MyApartmentBeneficiary> Remunerators { get; set; }
        //MyApartmentBeneficiary Beneficiary { get; set; }

    }
}
