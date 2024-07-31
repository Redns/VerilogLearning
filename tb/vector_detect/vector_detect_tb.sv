`timescale 1ns / 1ns

`define VECTOR_WIDTH 16
`define VECTOR_DETECT_MODE `VECTOR_DETECT_COMPL
`define VECTOR_DETECT_CASEZ 0
`define VECTOR_DETECT_DIVDE 1
`define VECTOR_DETECT_COMPL 2
`define VECTOR_DETECT_SHIFT_XOR 3

module vector_detect_tb;

    reg  [`VECTOR_WIDTH-1:0] seq;
    wire [`VECTOR_WIDTH-1:0] pos;

    generate
        if (`VECTOR_DETECT_MODE == `VECTOR_DETECT_CASEZ) begin
            vector_detect_casez vector_detect_casez_inst (
                .seq(seq),
                .pos(pos)
            );
        end else if (`VECTOR_DETECT_MODE == `VECTOR_DETECT_DIVDE) begin
            vector_detect_divide #(
                .VECTOR_WIDTH(`VECTOR_WIDTH)
            ) vector_detect_divde_inst (
                .seq(seq),
                .pos(pos)
            );
        end else if (`VECTOR_DETECT_MODE == `VECTOR_DETECT_COMPL) begin
            vector_detect_compl #(
                .VECTOR_WIDTH(`VECTOR_WIDTH)
            ) vector_detect_compl_inst (
                .seq(seq),
                .pos(pos)
            );
        end else if (`VECTOR_DETECT_MODE == `VECTOR_DETECT_SHIFT_XOR) begin
            vector_detect_shift_xor #(
                .VECTOR_WIDTH(`VECTOR_WIDTH)
            ) vector_detect_shift_xor_inst (
                .seq(seq),
                .pos(pos)
            );
        end
    endgenerate

    initial begin
        for (seq = 0; seq < ~0; seq = seq + 1'b1) begin
            #1;
        end
        #10 $stop;
    end

endmodule
