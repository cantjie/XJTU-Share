class A {
    xx:Int <- 1;
    yy:Int;
    zz:Int;
    main():Object{
        zz <- {let xx:Int<- 1, yy:Int<- 2 in xx+yy; }
    };
};

Class BB__ inherits A {
};
