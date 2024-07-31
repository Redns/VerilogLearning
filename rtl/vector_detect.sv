`define VECTOR_DETECT_CASEZ
`define VECTOR_DETECT_DIVDE
`define VECTOR_DETECT_BINARY_CODE
`define VECTOR_DETECT_SHIFT_XOR

module vector_detect #(
    parameter VECTOR_WIDTH = 8
) (
    input      [VECTOR_WIDTH-1:0] seq,
    output reg [VECTOR_WIDTH-1:0] pos
);

`ifdef VECTOR_DETECT_CASEZ
    always @(*) begin
        casex (seq)
            8'b1xxx_xxxx: pos = 32'b1000_0000;
            8'bx1xx_xxxx: pos = 32'b1000_0000;
            8'bxx1x_xxxx: pos = 32'b1000_0000;
            8'bxxx1_xxxx: pos = 32'b1000_0000;
            8'bxxxx_1xxx: pos = 32'b1000_0000;
            8'bxxxx_x1xx: pos = 32'b1000_0000;
            8'bxxxx_xx1x: pos = 32'b1000_0000;
            8'bxxxx_xxx1: pos = 32'b1000_0000;
            default:      pos = 8'b0000_0000;
        endcase
    end
`elsif VECTOR_DETECT_DIVDE
    pos=8'b0;
`elsif VECTOR_DETECT_BINARY_CODE

`elsif VECTOR_DETECT_SHIFT_XOR
`endif



endmodule
