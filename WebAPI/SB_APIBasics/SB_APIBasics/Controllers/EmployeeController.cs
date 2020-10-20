using APIDataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SB_APIBasics.Controllers
{
    public class EmployeeController : ApiController
    {

        public IEnumerable<Employee> Get()
        {
            using (EmployeeDBEntities entity=new EmployeeDBEntities())
            {
                return entity.Employees.ToList();
            }
        }
        public IEnumerable<Employee> Get(int id)
        {
            using (EmployeeDBEntities entity = new EmployeeDBEntities())
            {
                return entity.Employees.Where(e=>e.ID==id);
            }
        }
    }
}
