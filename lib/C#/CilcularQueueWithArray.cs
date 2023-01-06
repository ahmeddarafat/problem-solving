// ------------------ Cilcular Queue With Array -----------------------
// --------------------------------------------------------------------
// [1] The main advantage of using the circular queue is better memory utilization.
// [2] Becauese Linear Queue with array need algorithm to shift elements when dequeuing,
//     That algorithm with notation O(n), so Cilcular Queue optimizes the algorithm
// --------------------------------------------------------------------

namespace App
{
    class CilcularQueue
    {
        /// propirties
        int max, front, rear;
        int turns = 0;
        int[] queue;

        /// constructor
        public CilcularQueue(int max)
        {
            front = -1;
            rear = 0;
            this.max = max;
            queue = new int[max];
        }

        /// methods
        public void enqueue(int value)
        {
            // queue is empty
            if (front == -1)
            {
                front = 0;
                queue[front] = value;
                rear = 1;
                Console.WriteLine($"first,front = {front} ,rear = {rear}, turns = {turns}");
                Console.WriteLine($"enqueue {value}");
            }
            else
            {

                // if fornt or rear becomes bigger than or equal max
                // calculate the different turns between them
                turns -= (int)(front / max);
                turns += (int)(rear / max);

                // if front or rear turns a whole turn 
                // return it's index
                front = front % max;
                rear = rear % max;
                Console.WriteLine($"second,front = {front} ,rear = {rear}, turns = {turns}");
                if (front == rear && turns > 0)
                {
                    // throw expection
                    Console.WriteLine("the queue is full");
                }
                else
                {
                    queue[rear] = value;
                    rear++;
                    Console.WriteLine($"enqueue {value}");
                }
            }
        }
        public int dequeue()
        {
            int value = 0;
            turns -= (int)(front / max);
            turns += (int)(rear / max);
            front = front % max;
            rear = rear % max;
            Console.WriteLine($"third, front = {front} ,rear = {rear}, turns = {turns}");
            if (front != -1 && (front != rear || turns > 0))
            {
                value = queue[front];
                front++;
                Console.WriteLine($"dequeue {value}");

            }
            else
            {
                // throw expection
                Console.WriteLine("the queue is empty");
            }
            return value;
        }
    }
    class Program
    {
        static void Main(String[] args)
        {
            CilcularQueue q1 = new CilcularQueue(5);
            Console.WriteLine("===========================================");
            q1.dequeue();       // "the queue is empty"
            Console.WriteLine("===========================================");
            q1.enqueue(1);      // 1
            q1.enqueue(2);      // 2
            q1.enqueue(3);      // 3
            q1.enqueue(4);      // 4
            q1.enqueue(5);      // 5
            q1.enqueue(6);      // "the queue is full"
            Console.WriteLine("===========================================");
            q1.dequeue();       // 1 
            q1.dequeue();       // 2
            q1.dequeue();       // 3
            q1.dequeue();       // 4
            q1.dequeue();       // 5
            q1.dequeue();       // "the queue is empty"
            Console.WriteLine("===========================================");
            q1.enqueue(1);      // 1
            q1.enqueue(2);      // 2
            q1.enqueue(3);      // 3
            Console.WriteLine("===========================================");
            q1.dequeue();       // 1
            q1.dequeue();       // 2
            Console.WriteLine("===========================================");
            q1.enqueue(4);      // 4
            q1.enqueue(5);      // 5
            Console.WriteLine("===========================================");
            q1.dequeue();       // 3
            q1.dequeue();       // 4
            q1.dequeue();       // 5
            q1.dequeue();       // "the queue is empty"
            Console.WriteLine("===========================================");


            // Outputs:
            // ===========================================
            // third, front = -1 ,rear = 0, turns = 0     
            // the queue is empty
            // ===========================================
            // first,front = 0 ,rear = 1, turns = 0       
            // enqueue 1
            // second,front = 0 ,rear = 1, turns = 0      
            // enqueue 2
            // second,front = 0 ,rear = 2, turns = 0      
            // enqueue 3
            // second,front = 0 ,rear = 3, turns = 0
            // enqueue 4
            // second,front = 0 ,rear = 4, turns = 0
            // enqueue 5
            // second,front = 0 ,rear = 0, turns = 1
            // the queue is full
            // ===========================================
            // third, front = 0 ,rear = 0, turns = 1
            // dequeue 1
            // third, front = 1 ,rear = 0, turns = 1
            // dequeue 2
            // third, front = 2 ,rear = 0, turns = 1
            // dequeue 3
            // third, front = 3 ,rear = 0, turns = 1
            // dequeue 4
            // third, front = 4 ,rear = 0, turns = 1
            // dequeue 5
            // third, front = 0 ,rear = 0, turns = 0
            // the queue is empty
            // ===========================================
            // second,front = 0 ,rear = 0, turns = 0
            // enqueue 1
            // second,front = 0 ,rear = 1, turns = 0
            // enqueue 2
            // second,front = 0 ,rear = 2, turns = 0
            // enqueue 3
            // ===========================================
            // third, front = 0 ,rear = 3, turns = 0
            // dequeue 1
            // third, front = 1 ,rear = 3, turns = 0
            // dequeue 2
            // ===========================================
            // second,front = 2 ,rear = 3, turns = 0
            // enqueue 4
            // second,front = 2 ,rear = 4, turns = 0
            // enqueue 5
            // ===========================================
            // third, front = 2 ,rear = 0, turns = 1
            // dequeue 3
            // third, front = 3 ,rear = 0, turns = 1
            // dequeue 4
            // third, front = 4 ,rear = 0, turns = 1
            // dequeue 5
            // third, front = 0 ,rear = 0, turns = 0
            // the queue is empty
            // ===========================================

        }
    }
}
