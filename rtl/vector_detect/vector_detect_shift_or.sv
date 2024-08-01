module vector_detect_shift_or #(
    parameter VECTOR_WIDTH = 16
) (
    input  [VECTOR_WIDTH-1:0] seq,
    output [VECTOR_WIDTH-1:0] pos
);

    wire [VECTOR_WIDTH-1:0] seq_pre;

    assign seq_pre = { 1'b0, seq[VECTOR_WIDTH-1:1] | seq_pre[VECTOR_WIDTH-1:1] };
    assign pos = seq & (~seq_pre);

endmodule
