module vector_detect_r2l #(
    parameter VECTOR_WIDTH       = 16,
    parameter VECTOR_DETECT_MODE = 0
) (
    input  [VECTOR_WIDTH-1:0] seq,
    output [VECTOR_WIDTH-1:0] pos
);

    localparam  VECTOR_DETECT_CASEZ = 0, 
                VECTOR_DETECT_DIVDE = 1, 
                VECTOR_DETECT_COMPL = 2,
                VECTOR_DETECT_SHIFT_OR = 3;

    wire [VECTOR_WIDTH-1:0] seq_trans;
    wire [VECTOR_WIDTH-1:0] pos_trans;

    generate
        for (genvar i = 0; i < VECTOR_WIDTH; i = i + 1) begin
            assign seq_trans[i] = seq[VECTOR_WIDTH-1-i];
            assign pos[i] = pos_trans[VECTOR_WIDTH-1-i];
        end
    endgenerate

    generate
        if (VECTOR_DETECT_MODE == VECTOR_DETECT_CASEZ) begin
            vector_detect_casez vector_detect_casez_inst (
                .seq(seq_trans),
                .pos(pos_trans)
            );
        end else if (VECTOR_DETECT_MODE == VECTOR_DETECT_DIVDE) begin
            vector_detect_divide #(
                .VECTOR_WIDTH(VECTOR_WIDTH)
            ) vector_detect_divde_inst (
                .seq(seq_trans),
                .pos(pos_trans)
            );
        end else if (VECTOR_DETECT_MODE == VECTOR_DETECT_COMPL) begin
            vector_detect_compl #(
                .VECTOR_WIDTH(VECTOR_WIDTH)
            ) vector_detect_compl_inst (
                .seq(seq_trans),
                .pos(pos_trans)
            );
        end else if (VECTOR_DETECT_MODE == VECTOR_DETECT_SHIFT_OR) begin
            vector_detect_shift_or #(
                .VECTOR_WIDTH(VECTOR_WIDTH)
            ) vector_detect_shift_xor_inst (
                .seq(seq_trans),
                .pos(pos_trans)
            );
        end
    endgenerate

endmodule
