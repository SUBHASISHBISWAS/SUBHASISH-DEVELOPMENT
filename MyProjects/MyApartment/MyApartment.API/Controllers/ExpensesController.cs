using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MyApartment.API.Model;
using MyApartment.Data.Repository;

namespace MyApartment.API.Controllers
{
    [Route("api/expenses")]
    [ApiController]
    public class ExpensesController : ControllerBase
    {
        private readonly IMyApartmentExpenseDataProvider apartmentExpenseData;
        private readonly IMapper mapper;

        public ExpensesController(IMyApartmentExpenseDataProvider apartmentExpenseData,
            IMapper mapper)
        {
            this.apartmentExpenseData = apartmentExpenseData;
            this.mapper = mapper;
        }

        [HttpGet]
        public ActionResult<IEnumerable<MyApartmentExpenseDto>> GetExpenses()
        {
            var expenses = apartmentExpenseData.GetAllExpense();
            var expensesDto = mapper.Map<IEnumerable<MyApartmentExpenseDto>>(expenses);
            return Ok(expensesDto);

            //return new JsonResult(expenses);
        }

        [HttpGet("{expenseId:guid}")]
        public ActionResult<MyApartmentExpenseDto> GetExpensesById(Guid expenseId)
        {
            var expense = apartmentExpenseData.GetExpenseDetailsById(expenseId);
            if (expense!=null)
            {
                var expenseDto = mapper.Map<IEnumerable<MyApartmentExpenseDto>>(expense);
                return Ok(expenseDto);
            }
            return NotFound();
        }
    }
}