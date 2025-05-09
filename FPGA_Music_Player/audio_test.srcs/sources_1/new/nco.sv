`timescale 1ns / 1ps

module nco (
    input  logic         clk,
    input  logic         rst,
    input  logic [23:0]  phase_inc,
    output logic [23:0]   wave_out
);
    logic [23:0] phase_acc;

    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            phase_acc <= 24'd0;
        else
            phase_acc <= phase_acc + phase_inc;
    end

    triangle_lut lut (
        .addr(phase_acc),
        .data(wave_out)
    );
endmodule
