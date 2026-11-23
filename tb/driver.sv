class driver;
    virtual counter_if vif;
    mailbox #(packet) gen2drv;

    function new(virtual counter_if vif, mailbox #(packet) gen2drv);
        this.vif = vif;
        this.gen2drv = gen2drv;
    endfunction

    task run();
        packet p;
        forever begin
            gen2drv.get(p);
            @(negedge vif.clk);
            vif.reset_n = p.reset_n;
            vif.enable = p.enable;
        end
    endtask
endclass
