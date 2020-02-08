using MyApartment.Core.Model.Models.Interfaces;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace MyApartment.Core.Model
{
    public class MyApartmentRemunerator : IMyApartmentRemunerator
    {
        [Key]
        public Guid RemuneratorId { get; set; }

        [Required]
        [MaxLength(50)]
        public string FirstName { get; set; }

        [Required]
        [MaxLength(50)]
        public string LastName { get; set; }

        [Required]
        public DateTimeOffset DateOfBirth { get; set; }

        public IEnumerable<MyApartmentExpense> Expenses { get; set; }
            = new List<MyApartmentExpense>();
    }
}
