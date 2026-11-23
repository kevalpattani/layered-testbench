class scoreboard;
    mailbox #(packet) mon2scb;
    reference_model rm;

    function new(mailbox #(packet) mon2scb);
        this.mon2scb = mon2scb;
        this.rm = new();
    endfunction

    task run();
        packet p;
        forever begin
            mon2scb.get(p);
            rm.calculate(p);
            if (p.count !== rm.expected_count)
                $error("Mismatch: reset_n=%0b enable=%0b expected=%0d actual=%0d", p.reset_n, p.enable, rm.expected_count, p.count);
            else
                $display("PASS: reset_n=%0b enable=%0b count=%0d", p.reset_n, p.enable, p.count);
        end
    endtask
endclass
