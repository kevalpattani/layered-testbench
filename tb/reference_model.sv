class reference_model;
    logic [3:0] expected_count = 4'd0;

    task calculate(packet p);
        if (!p.reset_n)
            expected_count = 4'd0;
        else if (p.enable)
            expected_count = expected_count + 1'b1;
    endtask
endclass
