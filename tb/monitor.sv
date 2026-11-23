class monitor;
    virtual counter_if vif;
    mailbox #(packet) mon2scb;

    function new(virtual counter_if vif, mailbox #(packet) mon2scb);
        this.vif = vif;
        this.mon2scb = mon2scb;
    endfunction

    task run();
        packet p;
        forever begin
            @(posedge vif.clk);
            #1;
            p = new();
            p.reset_n = vif.reset_n;
            p.enable = vif.enable;
            p.count = vif.count;
            mon2scb.put(p);
        end
    endtask
endclass
