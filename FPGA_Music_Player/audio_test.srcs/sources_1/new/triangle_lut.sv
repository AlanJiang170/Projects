`timescale 1ns / 1ps

module triangle_lut (
    input  logic [23:0] addr,
    output logic [23:0] data
);

    // no more sine LUT, triangle wave is goated

    always_comb begin
        if (addr < 24'd8388608)
            data = addr;
        else
            data = 24'd16777215 - addr;
    end
    
endmodule

