module vector_detect_divide #(
    parameter  VECTOR_WIDTH     = 16,
    localparam VECTOR_SUB_WIDTH = VECTOR_WIDTH >> 1
) (
    input  [VECTOR_WIDTH-1:0] seq,
    output [VECTOR_WIDTH-1:0] pos
);

    wire [1:0][VECTOR_SUB_WIDTH-1:0] sub_pos;

    generate
        if (VECTOR_WIDTH == 2) begin
            assign pos = { seq[1], seq[1] ? 1'b0 : seq[0] };
        end else begin
            vector_detect_divide #(
                .VECTOR_WIDTH(VECTOR_SUB_WIDTH)
            ) vector_detect_0 (
                .seq(seq[0+:VECTOR_SUB_WIDTH]),
                .pos(sub_pos[0])
            );

            vector_detect_divide #(
                .VECTOR_WIDTH(VECTOR_SUB_WIDTH)
            ) vector_detect_1 (
                .seq(seq[VECTOR_WIDTH-1-:VECTOR_SUB_WIDTH]),
                .pos(sub_pos[1])
            );

            assign pos[VECTOR_WIDTH-1-:VECTOR_SUB_WIDTH] = sub_pos[1];
            assign pos[0+:VECTOR_SUB_WIDTH] = sub_pos[1] ? 'b0 : sub_pos[0];
        end
    endgenerate

endmodule
