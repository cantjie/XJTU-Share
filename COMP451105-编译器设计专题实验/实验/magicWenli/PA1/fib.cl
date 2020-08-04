(*
	Author：magicwenli
	Date：20200723
	Fibonacci sequence
*)

class Main inherits IO {

	num :Int;
	x : Int <- 1;

	prompt() : Int
	{
		{
			out_string(">");
			in_int();
		}
	};


	main() : SELF_TYPE {
	{
		out_string("Enter Number:\n");
		num  <- prompt();
		out_string("The Fibonacci sequence of ");
		out_int(num);
		out_string(" is:\n");

		while x < num+1 loop
                    { 
						out_int(func(x));
						out_string("\n");
                        x <- x +1;
                    }
                  pool;
		self;
	}
	};

func(n:Int) : Int {
	{
		let sum:Int <- 0 in {
			if n = 1 then sum <- 1 else 
			if n = 2 then sum <- 1 else
			sum <- func(n-1)+func(n-2)
			fi fi;
			sum;
			};
	}
	
};

};