class packet;
    rand bit reset_n;
    rand bit enable;
    logic [3:0] count;

    constraint reset_constraint {
        reset_n dist {1'b1 := 9, 1'b0 := 1};
    }
endclass
