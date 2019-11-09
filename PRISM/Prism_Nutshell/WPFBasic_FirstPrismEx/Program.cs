using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using Microsoft.Practices.Unity;
using Microsoft.Practices.Unity.Configuration;

namespace WPFBasic_FirstPrismEx
{
    class Program
    {
        static void Main(string[] args)
        {
            UnityContainer container=new UnityContainer();

            //container.RegisterType<ICalculator, Calculator>();
            //container.RegisterType<IInputService, ConsoleInputService>();
            //container.RegisterType<IOutputService, ConsoleOutputService>();
            //container.RegisterType<IInputPerserService, InputPerserService>();
            //container.RegisterType<ICalculatorReplLoop, CalculatorReplLoop>();

            UnityConfigurationSection configSection =
                (UnityConfigurationSection) ConfigurationManager.GetSection("unity");
            configSection.Configure(container);
            
            ICalculatorReplLoop loop = container.Resolve<ICalculatorReplLoop>();
            loop.Run();
        }

        

       
    }
}
