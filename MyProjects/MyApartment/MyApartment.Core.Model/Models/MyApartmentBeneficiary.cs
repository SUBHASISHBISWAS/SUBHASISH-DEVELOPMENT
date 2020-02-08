using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace MyApartment.Core.Model
{
    public class MyApartmentBeneficiary : IMyApartmentBeneficiary
    {
        [Key]
        public Guid BeneficiaryId { get; set; }

        [Required]
        [MaxLength(100)]
        public string FirstName { get; set; }

        [MaxLength(100)]
        public string LastName { get; set; }

        [MaxLength(100)]
        public string Address { get; set; }

        public IEnumerable<MyApartmentExpense> Expenses { get; set; }
           = new List<MyApartmentExpense>();
    }
}
