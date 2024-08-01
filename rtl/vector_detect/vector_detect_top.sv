`define VECTOR_WIDTH 16
`define VECTOR_DETECT_MODE `VECTOR_DETECT_DIVDE
`define VECTOR_DETECT_CASEZ 0
`define VECTOR_DETECT_DIVDE 1
`define VECTOR_DETECT_COMPL 2
`define VECTOR_DETECT_SHIFT_OR 3

module vector_detect_top (
    input                          clk,
    input                          rst_n,
    output reg [`VECTOR_WIDTH-1:0] pos
);

    reg  [`VECTOR_WIDTH-1:0] seq;
    wire [`VECTOR_WIDTH-1:0] pos_w;

    generate
        if (`VECTOR_DETECT_MODE == `VECTOR_DETECT_CASEZ) begin
            vector_detect_casez vector_detect_casez_inst (
                .seq(seq),
                .pos(pos_w)
            );
        end else if (`VECTOR_DETECT_MODE == `VECTOR_DETECT_DIVDE) begin
            vector_detect_divide #(
                .VECTOR_WIDTH(`VECTOR_WIDTH)
            ) vector_detect_divde_inst (
                .seq(seq),
                .pos(pos_w)
            );
        end else if (`VECTOR_DETECT_MODE == `VECTOR_DETECT_COMPL) begin
            vector_detect_compl #(
                .VECTOR_WIDTH(`VECTOR_WIDTH)
            ) vector_detect_compl_inst (
                .seq(seq),
                .pos(pos_w)
            );
        end else if (`VECTOR_DETECT_MODE == `VECTOR_DETECT_SHIFT_OR) begin
            vector_detect_shift_or #(
                .VECTOR_WIDTH(`VECTOR_WIDTH)
            ) vector_detect_shift_xor_inst (
                .seq(seq),
                .pos(pos_w)
            );
        end
    endgenerate

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            seq <= 'b0;
        end else begin
            seq <= seq + 1'b1;
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            pos <= 'b0;
        end else begin
            pos <= pos_w;
        end
    end
endmodule
