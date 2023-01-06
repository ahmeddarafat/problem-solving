// Parentheses with stack

using App;
namespace App
{
    class Parentheses
    {
        public bool areBracketsBalance(char[] brackets)
        {
            Stack<char> stack = new Stack<char>();
            bool isBalance = false;
            foreach (char c in brackets)
            {
                if (c == '(' || c == '{' || c == '[')
                {
                    stack.Push(c);
                }
                else
                {
                    if (stack.Count != 0 && isMathingPair(stack.Peek(), c))
                    {
                        stack.Pop();

                    }
                    else
                    {
                        isBalance = false;
                        break;
                    }

                }
            }
            if (stack.Count == 0) isBalance = true;
            return isBalance;

        }



        private bool isMathingPair(char c1, char c2)
        {
            if (c1 == '(' && c2 == ')') return true;
            else if (c1 == '{' && c2 == '}') return true;
            else if (c1 == '[' && c2 == ']') return true;
            else return false;
        }

    }
}



namespace MainNamespace
{
    class Program
    {
        static void Main(String[] args)
        {
            char[] exp = { '{', '(', ')', '}', '[', ']' };
            char[] exp2 = { '{', '(', ')', '}', '[', ']' ,'['};
            char[] exp3 = { '{', '(','[' ,')', '}', '[', ']' ,};
            Parentheses p1 = new Parentheses();

            // Function call
            if (p1.areBracketsBalance(exp))            // Balanced
                Console.WriteLine("Balanced ");
            else
                Console.WriteLine("Not Balanced ");

            if (p1.areBracketsBalance(exp2))           // Not Balanced
                Console.WriteLine("Balanced ");
            else
                Console.WriteLine("Not Balanced ");

            if (p1.areBracketsBalance(exp2))           // Not Balanced
                Console.WriteLine("Balanced ");
            else
                Console.WriteLine("Not Balanced ");

        }
    }
}
