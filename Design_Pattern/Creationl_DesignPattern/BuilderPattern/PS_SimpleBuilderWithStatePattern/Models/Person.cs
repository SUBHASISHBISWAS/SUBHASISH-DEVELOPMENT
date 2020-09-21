using System;
using BuilderDemo.Interfaces;

namespace BuilderDemo.Models
{
    public class Person : IUser
    {
        public string Name { get; }
        public string Surname { get; }

        public Person(string name, string surname)
        {
            if (string.IsNullOrEmpty(name))
                throw new ArgumentException();
            if (string.IsNullOrEmpty(surname))
                throw new ArgumentException();

            this.Name = name;
            this.Surname = surname;
        }

        public void SetIdentity(IUserIdentity identity) { }

        public bool CanAcceptIdentity(IUserIdentity identity) =>
            identity is IdentityCard;

        public override string ToString() => $"{this.Name} {this.Surname}";

    }
}
