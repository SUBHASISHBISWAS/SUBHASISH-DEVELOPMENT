using System;
using System.Collections.Generic;
using System.Text;

namespace SwigyDataRepository.Data
{
    public class Restaurant
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public CuisineType Cuisine { get; set; }
    }
}
