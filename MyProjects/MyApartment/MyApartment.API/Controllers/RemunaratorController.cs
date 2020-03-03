using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyApartment.API.Model;
using MyApartment.Core.Model;
using MyApartment.Data.Repository;
using MyApartment.Data.Repository.Interfaces;

namespace MyApartment.API.Controllers
{
    [Route("api/SVLakeview/AddExpense/Benificiries")]
    [ApiController]
    public class RemuneratorController : ControllerBase
    {
        private readonly IMyApartmentExpenseDataProvider _myExpenseDataProvider;
        
        
        public RemuneratorController(IMyApartmentExpenseDataProvider myExpenseDataProvider)
        {
            _myExpenseDataProvider = myExpenseDataProvider;
        }

        [HttpGet]
        public ActionResult<IEnumerable<MyApartmentBeneficiary>> OnGetBenificiries()
        {
            return Ok(_myExpenseDataProvider.GetBenificiries());
        }

        public JsonResult OnGetSearchBenificiries(string benificiryName)
        {

            var benificiries = (from benificiary in _myExpenseDataProvider.GetBenificiries()
                                where benificiary.FirstName.StartsWith(benificiryName)
                                select new { benificiary.FirstName, benificiary.BeneficiaryId });

            return new JsonResult(benificiries);
        }

        public JsonResult OnGetSearchRemunerators(string remuneratorName)
        {

            var remunerators = (from remunerator in _myExpenseDataProvider.GetRemunerators()
                                where remunerator.FirstName.StartsWith(remuneratorName)
                                select new { remunerator.FirstName, remunerator.RemuneratorId }).ToList();

            return new JsonResult(remunerators);
        }
    }
}