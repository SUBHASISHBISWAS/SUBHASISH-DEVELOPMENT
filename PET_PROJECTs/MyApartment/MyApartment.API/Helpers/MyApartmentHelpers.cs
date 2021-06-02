using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyApartment.API.Helpers
{
    public static class MyApartmentHelpers
    {
        public static T ToEnum<T>(this string value)
        {
            return (T)Enum.Parse(typeof(T), value, true);
        }

        public static int GetTransactionElapsedTime(this DateTime dateTimeOffset)
        {
            var currentDate = DateTime.UtcNow;
            int age = currentDate.Year - dateTimeOffset.Year;
            if (currentDate<dateTimeOffset.AddYears(age))
            {
                age--;
            }
            return age;
        }
    }
}
