/// [1] Infix & Postfix & Perfix
//     Infix   :    x + y
//     Postfix :    xy +
//     Perfix  :    + xy


/// 1. Postfix
//        - convert Infix to Postfix for the computer can understand
//        - Evalution The Postfix to solve the equation
using Postfix;
namespace Postfix
{
    class ToPostfix
    {
        // Properties
        // ASCII Code
        // '^',   -->  94
        // '*',   -->  42
        // '/',   -->  47
        // '+',   -->  43
        // '-'    -->  45
        private int[] expressionsAscii = new int[]{
            94,42,47,43,45
        };
        // mapping
        private Dictionary<char, int> mapping = new Dictionary<char, int>{
            {'^' , 2},
            {'*' , 1},
            {'/' , 1},
            {'+' , 0},
            {'-' , 0},
            {'(' , -1},
        };
        Stack<Char> operators = new Stack<char>();
        private string equation;

        /// Constructor 
        public ToPostfix(String equation)
        {
            this.equation = equation;
        }

        /// Methods
        public String convertedEquation()
        {
            String converted = "";
            for (int i = 0; i < equation.Length; i++)
            {
                char chara = equation[i];
                if (chara == ' ')
                {
                    continue;
                }
                else if (char.IsLetterOrDigit(chara))
                {
                    if (char.IsLetter(chara))
                    {
                        converted = converted + chara + " ";

                    }
                    else
                    {
                        while (char.IsDigit(chara))
                        {
                            converted = converted + chara;
                            i += 1;
                            if (i >= equation.Length )break;
                            chara = equation[i];
                        }
                        i--;
                        converted += " ";
                    }
                }
                else
                {
                    if (chara == '(')
                    {
                        operators.Push(chara);
                    }
                    else if (chara == ')')
                    {
                        while (operators.Peek() != '(')
                        {
                            // To pop the stack until '('
                            converted = converted + operators.Pop() + " ";
                        }
                        // To remove '('
                        operators.Pop();
                    }
                    else if (expressionsAscii.Contains(chara))
                    {

                        while (operators.Count > 0 && mapping[chara] <= mapping[operators.Peek()])
                        {
                            converted = converted + operators.Pop() + " ";
                        }
                        operators.Push(chara);
                    }
                    else
                    {
                        Console.WriteLine("There are other sympols which are uncommon ");
                    }
                }
            }
            while (operators.Count > 0)
            {
                converted = converted + operators.Pop() + " ";
                // Console.WriteLine($"the equation {converted}");
            }
            return converted;
        }
    }
    class FormPostfix
    {
        private string exp;
        private Stack<int> operand = new Stack<int>();
        public FormPostfix(string equation)
        {
            this.exp = equation;
        }
        public int solve()
        {

            for (int i = 0; i < exp.Length; i++)
            {
                char c = exp[i];

                if (c == ' ')
                {
                    continue;
                }
                else if (char.IsDigit(c))
                {
                    int n = 0;

                    // store the num in stack even cosist of multi-digits,
                    // ex: 12 , 35 , ...
                    while (char.IsDigit(c))
                    {
                        // int(c) convert the digit to ascii code
                        // digit -->  ascii
                        // 0     -->   48
                        // 1     -->   49
                        // so, you should substruct 48 to convert 49 to 1
                        n = n * 10 + (int)(c) - 48;
                        i++;
                        c = exp[i];
                    }
                    i--;
                    operand.Push(n);
                }

                else
                {
                    int val1 = operand.Pop();
                    int val2 = operand.Pop();

                    switch (c)
                    {
                        case '+':
                            operand.Push(val2 + val1);
                            break;

                        case '-':
                            // note, you start with val2 
                            // becaseu it's the push into stack before val1
                            operand.Push(val2 - val1);
                            break;

                        case '/':
                            operand.Push(val2 / val1);
                            break;

                        case '*':
                            operand.Push(val2 * val1);
                            break;
                        case '^':
                            operand.Push(val2 ^ val1);
                            break;
                    }
                }
            }
            // the result is the only value inside the stack
            return operand.Pop();
        }
    }

}
namespace MainNamespace
{
    class Program
    {
        static void Main(String[] args)
        {
            ToPostfix p1 = new ToPostfix("1 + 2");
            Console.WriteLine(p1.convertedEquation());                  // 1 2 +
            
            ToPostfix p2 = new ToPostfix("(100 + 200) / 2 * 5 + 7");
            Console.WriteLine(p2.convertedEquation());                  // 100 200 + 2 / 5 * 7 + 

            FormPostfix p3 = new FormPostfix("100 200 + 2 / 5 * 7 +");
            Console.WriteLine(p3.solve());                              // 757

        }
    }
}
