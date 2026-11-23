module up_counter (
    input  logic       clk,
    input  logic       reset_n,
    input  logic       enable,
    output logic [3:0] count
);

    always_ff @(posedge clk) begin
        if (!reset_n)
            count <= 4'd0;
        else if (enable)
            count <= count + 1'b1;
    end

endmodule
