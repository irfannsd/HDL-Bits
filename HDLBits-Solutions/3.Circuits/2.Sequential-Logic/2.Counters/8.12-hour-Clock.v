module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output reg [7:0] mm,
    output reg [7:0] ss
);

    // Helper function to increment BCD
    function [7:0] bcd_inc(input [7:0] val, input [7:0] max);
        begin
            if (val[3:0] == 4'd9) begin
                bcd_inc[3:0] = 4'd0;
                bcd_inc[7:4] = val[7:4] + 1;
            end else begin
                bcd_inc[3:0] = val[3:0] + 1;
                bcd_inc[7:4] = val[7:4];
            end
        end
    endfunction

    always @(posedge clk) begin
        if (reset) begin
            ss <= 8'h00;
            mm <= 8'h00;
            hh <= 8'h12;
            pm <= 1'b0;
        end else if (ena) begin
            // Seconds Logic
            if (ss == 8'h59) begin
                ss <= 8'h00;
                // Minutes Logic
                if (mm == 8'h59) begin
                    mm <= 8'h00;
                    // Hours Logic
                    if (hh == 8'h11) begin
                        hh <= 8'h12;
                        // Toggle PM at 11:59:59 -> 12:00:00
                        pm <= ~pm;
                    end else if (hh == 8'h12) begin
                        hh <= 8'h01;
                    end else begin
                        hh <= bcd_inc(hh, 8'h12);
                    end
                end else begin
                    mm <= bcd_inc(mm, 8'h59);
                end
            end else begin
                ss <= bcd_inc(ss, 8'h59);
            end
        end
    end

endmodule