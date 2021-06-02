using AutoMapper;
using MyApartment.API.Model;
using MyApartment.Core.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyApartment.API.Profiles
{
    public class MyApartmentPayeeProfile :Profile
    {
        public MyApartmentPayeeProfile()
        {
            CreateMap<MyApartmentBeneficiary, MyApartmentPayeeDto>();
        }
    }
}
