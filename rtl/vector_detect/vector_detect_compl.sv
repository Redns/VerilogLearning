module vector_detect_compl #(
    parameter VECTOR_WIDTH = 16
) (
    input  [VECTOR_WIDTH-1:0] seq,
    output [VECTOR_WIDTH-1:0] pos
);

    wire [VECTOR_WIDTH-1:0] seq_trans;
    wire [VECTOR_WIDTH-1:0] pos_trans = (~seq_trans + 1'b1) & seq_trans;

    generate
        for (genvar i = 0; i < VECTOR_WIDTH; i = i + 1) begin
            assign seq_trans[i] = seq[VECTOR_WIDTH-1-i];
        end
    endgenerate

    generate
        for (genvar i = 0; i < VECTOR_WIDTH; i = i + 1) begin
            assign pos[i] = pos_trans[VECTOR_WIDTH-1-i];
        end
    endgenerate

endmodule
