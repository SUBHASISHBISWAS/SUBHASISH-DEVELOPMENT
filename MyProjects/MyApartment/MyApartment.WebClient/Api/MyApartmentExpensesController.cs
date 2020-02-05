using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyApartment.Core.Model;
using MyApartment.Data.Services;

namespace MyApartment.WebClient.Api
{
    [Route("api/[controller]")]
    [ApiController]
    public class MyApartmentExpensesController : ControllerBase
    {
        private readonly MyApartmentDbContext _context;

        public MyApartmentExpensesController(MyApartmentDbContext context)
        {
            _context = context;
        }

        // GET: api/MyApartmentExpenses
        [HttpGet]
        public async Task<ActionResult<IEnumerable<MyApartmentExpense>>> GetExpenses()
        {
            return await _context.Expenses.ToListAsync();
        }

        // GET: api/MyApartmentExpenses/5
        [HttpGet("{id}")]
        public async Task<ActionResult<MyApartmentExpense>> GetMyApartmentExpense(Guid id)
        {
            var myApartmentExpense = await _context.Expenses.FindAsync(id);

            if (myApartmentExpense == null)
            {
                return NotFound();
            }

            return myApartmentExpense;
        }

        // PUT: api/MyApartmentExpenses/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutMyApartmentExpense(Guid id, MyApartmentExpense myApartmentExpense)
        {
            if (id != myApartmentExpense.ExpenseId)
            {
                return BadRequest();
            }

            _context.Entry(myApartmentExpense).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MyApartmentExpenseExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/MyApartmentExpenses
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public async Task<ActionResult<MyApartmentExpense>> PostMyApartmentExpense(MyApartmentExpense myApartmentExpense)
        {
            _context.Expenses.Add(myApartmentExpense);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetMyApartmentExpense", new { id = myApartmentExpense.ExpenseId }, myApartmentExpense);
        }

        // DELETE: api/MyApartmentExpenses/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<MyApartmentExpense>> DeleteMyApartmentExpense(Guid id)
        {
            var myApartmentExpense = await _context.Expenses.FindAsync(id);
            if (myApartmentExpense == null)
            {
                return NotFound();
            }

            _context.Expenses.Remove(myApartmentExpense);
            await _context.SaveChangesAsync();

            return myApartmentExpense;
        }

        private bool MyApartmentExpenseExists(Guid id)
        {
            return _context.Expenses.Any(e => e.ExpenseId == id);
        }
    }
}
