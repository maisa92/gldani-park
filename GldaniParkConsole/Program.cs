using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using TestGldaniParkPos;

namespace GldaniParkConsole
{
    class Program
    {
        static void Main(string[] args)
        {
             
            AttractionCom = "COM1";

            while (RegistrationCom == "")
            {
                CheckRegistration();
            }

            while (AttractionCom == "")
            {
                CheckAttraction();
            }
            Run();
            Console.ReadKey();
        }

        public static string RegistrationCom = "";
        public static string AttractionCom = "";


        static IEnumerable<string> GetComPortList()
        {
            SerialPortGetter getter = new SerialPortGetter();
            return getter.SerialPorts();
        }

        static void CheckRegistration()
        {
            
            AttractionListGenerator generator = new AttractionListGenerator();
            var list = generator.GetAttractionPriceList();
            Factory f = new Factory(list);
            List<string> coms = GetComPortList().ToList();

            foreach (var com in coms)
            {
                bool response = f.CheckRegistrator(com);
                if (response)
                {
                    RegistrationCom = com;
                    Console.WriteLine($"Registration Port is {com}");
                }
            }
        }

        private static void RunRegistration(string com, List<AttractionPriceModel> list)
        {
            Factory f = new Factory(list);
            f.RunRegistrator(com);
        }

        private static void RunAttraction(string com, List<AttractionPriceModel> list)
        {
            Factory f = new Factory(list);
            f.RunAttraction(com);
        }

        static async Task Run()
        {
            AttractionListGenerator generator = new AttractionListGenerator();
            var list = generator.GetAttractionPriceList();

            try
            {
                await Task.Run(() =>
                    {
                        Task task1 = Task.Factory.StartNew(() => RunAttraction(AttractionCom, list));
                        Task task2 = Task.Factory.StartNew(() => RunRegistration(RegistrationCom, list));

                        Task.WaitAll(task1, task2);
                    }
                );
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }


        static void CheckAttraction()
        {
            AttractionListGenerator generator = new AttractionListGenerator();
            var list = generator.GetAttractionPriceList();
            Factory f = new Factory(list);
            List<string> coms = GetComPortList().ToList();

            foreach (var com in coms)
            {
                if (com == RegistrationCom)
                    continue;

                bool response = f.TestAttractionSystem(com);
                if (response)
                {
                    AttractionCom = com;
                    Console.WriteLine($"Attraction Port is {com}");
                }
            }
        }
    }
}
