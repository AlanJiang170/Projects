`timescale 1ns / 1ps

// gets the phase accumulation number for the notes
// freq * (2**24) / 1,000,000
//                    ^clock^

module phase_lut (
    input  logic [6:0] note1,
    input  logic [6:0] note2,
    input  logic [6:0] note3,
    output logic [23:0] phase1,
    output logic [23:0] phase2,
    output logic [23:0] phase3
);

    // a lookup table is only required for the 11 unique notes plus a rest.
    // to go down an octave, just divide by 2 (bitshift right)
    logic [23:0] lut [0:12];
    
    initial begin
        lut[0]  = 24'd0;          // rest
        lut[1]  = 24'd29528;      // A6   1
        lut[2]  = 24'd31284;      // A#6
        lut[3]  = 24'd33144;      // B6   3
        lut[4]  = 24'd35115;      // C6   4
        lut[5]  = 24'd37203;      // C#6
        lut[6]  = 24'd39415;      // D6   6
        lut[7]  = 24'd41759;      // D#6
        lut[8]  = 24'd44242;      // E6   8
        lut[9]  = 24'd46873;      // F6   9
        lut[10] = 24'd49660;      // F#6
        lut[11] = 24'd52613;      // G6   B
        lut[12] = 24'd55741;      // G#6
    end
    
    // note[6:4] encodes the octave. note[3:0] encodes the note.
    assign phase1 = lut[note1[3:0]] >> (6 - note1[6:4]);
    assign phase2 = lut[note2[3:0]] >> (6 - note2[6:4]);
    assign phase3 = lut[note3[3:0]] >> (6 - note3[6:4]);
        
endmodule

