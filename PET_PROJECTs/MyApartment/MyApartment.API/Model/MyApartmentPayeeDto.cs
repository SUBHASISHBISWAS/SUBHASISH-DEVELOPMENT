using MyApartment.Core.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyApartment.API.Model
{
    public class MyApartmentPayeeDto
    {
        public Guid Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public Guid ExpenseId { get; set; }
    }
}
