class generator;
    mailbox #(packet) gen2drv;

    function new(mailbox #(packet) gen2drv);
        this.gen2drv = gen2drv;
    endfunction

    task run();
        packet p;
        for (int i = 0; i < 20; i++) begin
            p = new();
            if (i == 0) begin
                p.reset_n = 0;
                p.enable = 0;
            end else if (!p.randomize()) begin
                $fatal(1, "Packet randomization failed");
            end
            gen2drv.put(p);
        end
    endtask
endclass
