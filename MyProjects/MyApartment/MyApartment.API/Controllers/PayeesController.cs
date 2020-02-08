using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MyApartment.API.Model;
using MyApartment.Data.Repository.Interfaces;

namespace MyApartment.API.Controllers
{
    [Route("api/expenses/{expenseId}/payees")]
    [ApiController]
    public class PayeesController : ControllerBase
    {
        private readonly IMyApartmentPayeeDataProvider apartmentPayeeDataProvider;
        private readonly IMapper mapper;

        public PayeesController(IMyApartmentPayeeDataProvider apartmentPayeeDataProvider,
            IMapper mapper)
        {
            this.apartmentPayeeDataProvider = apartmentPayeeDataProvider;
            this.mapper = mapper;
        }


        public ActionResult<IEnumerable<MyApartmentPayeeDto>> GetPayeeForExpense(Guid expenseID)
        {
            return null;
            //return apartmentPayeeDataProvider.GetAllPayees();
        }
    }
}