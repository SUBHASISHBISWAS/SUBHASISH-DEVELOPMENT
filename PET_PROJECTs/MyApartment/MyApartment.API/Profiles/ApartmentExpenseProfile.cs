using AutoMapper;
using MyApartment.API.Model;
using MyApartment.Core.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyApartment.API.Profiles
{
    public class ApartmentExpenseProfile :Profile
    {
        public ApartmentExpenseProfile()
        {
            CreateMap<MyApartmentExpense, MyApartmentExpenseDto>().
                ForMember(dest=>dest.DateOfTransaction,
                opt=>opt.MapFrom(src=>src.TransactionDate));
        }
    }
}
