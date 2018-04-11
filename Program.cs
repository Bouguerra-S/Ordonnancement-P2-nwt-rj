using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ORDO_H1
{
    class Program
    {

        static void Main(string[] args)
        {
            Console.WriteLine("please enter the number of tasks");
            string tasks_number_s = Console.ReadLine();
            int tasks_number;
            tasks_number = Int32.Parse(tasks_number_s);
            int[][] Tasks = new int[tasks_number-1];

            for (int i = 0; i < tasks_number; i++) 
            {
                Console.WriteLine("please enter the processing time of "+(i+1)+" task");
                string p_s = Console.ReadLine();
                int p;
                p = Int32.Parse(p_s);
                Console.WriteLine("please enter the weight of " + (i + 1) + " task");
                string w_s = Console.ReadLine();
                int w;
                w = Int32.Parse(w_s);
                Console.WriteLine("please enter the release date of " + (i + 1) + " task");
                string r_s = Console.ReadLine();
                int r;
                r = Int32.Parse(r_s);
                Tasks[i][0] = p;
                Tasks[i][1] = w;
                Tasks[i][2] = r;

            }
            for (int i = 0; i < tasks_number; i++)
            {
                Console.WriteLine(" " + Tasks[i][0] + " " + Tasks[i][1] + " " + Tasks[i][2]);
            }
                
            Console.ReadLine();
        }
    }
}
