`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2025 01:43:56 AM
// Design Name: 
// Module Name: pwm
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pwm (
    input  logic       clk,
    input  logic       rst,
    input  logic [11:0] value,
    output logic       pwm_out
);
    logic [11:0] counter;

    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            counter <= 0;
        else
            counter <= counter + 1;
    end

    assign pwm_out = (counter < value);
endmodule