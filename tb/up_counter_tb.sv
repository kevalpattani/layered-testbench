module up_counter_tb;
    import counter_tb_pkg::*;
    counter_if vif();
    mailbox #(packet) gen2drv;
    mailbox #(packet) mon2scb;
    generator gen;
    driver drv;
    monitor mon;
    scoreboard scb;

    up_counter dut (
        .clk(vif.clk), .reset_n(vif.reset_n),
        .enable(vif.enable), .count(vif.count)
    );

    initial begin
        vif.clk = 0;
        forever #5 vif.clk = ~vif.clk;
    end

    initial begin
        vif.reset_n = 0;
        vif.enable = 0;
        gen2drv = new();
        mon2scb = new();
        gen = new(gen2drv);
        drv = new(vif, gen2drv);
        mon = new(vif, mon2scb);
        scb = new(mon2scb);
        fork
            gen.run();
            drv.run();
            mon.run();
            scb.run();
        join_none
        #215;
        $finish;
    end
endmodule
