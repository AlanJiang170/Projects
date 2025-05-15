`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2025 07:50:00 PM
// Design Name: 
// Module Name: sim_top
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


module sim_top;
// Testbench signals
    logic clk;
    logic rst;
    logic btn;
    logic audio_out;

    // Instantiate the DUT
    audio_top_module dut (
        .clk(clk),
        .rst(rst),
        .btn(btn),
        .audio_out_l(audio_out)
    );

    // Clock generation: 100 MHz (10 ns period)
    always #5 clk = ~clk;

    // Optional: File to dump waveform
    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, sim_top);
    end

    // Test sequence
    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        btn = 0;

        // Hold reset for a few cycles
        #100;
        rst = 0;

        // Run for a few beats without button press
        repeat (500_000) @(posedge clk);  // ~5 ms

        // Activate button to test extra tone
        btn = 1;
        repeat (500_000) @(posedge clk);  // ~5 ms

        // Deactivate button
        btn = 0;
        repeat (500_000) @(posedge clk);  // ~5 ms

        $finish;
    end
endmodule
