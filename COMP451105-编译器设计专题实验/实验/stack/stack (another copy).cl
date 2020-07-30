class Cons inherits List {
	xcar : Int;
	xcdr : List;
	isNil() : Bool { false };
	init(hd : Int, tl : List) : Cons {
		{
			xcar <- hd;
			xcdr <- tl;
			self;
		}
					}
...
};

class Main inherits IO {
main() : SELF_TYPE {
		{
			
		out_string("\n");
		}
	};
};

