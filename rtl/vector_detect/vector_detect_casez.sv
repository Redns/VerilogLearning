module vector_detect_casez (
    input      [15:0] seq,
    output reg [15:0] pos
);

    always @(*) begin
        casex (seq)
            16'b1xxx_xxxx_xxxx_xxxx: pos = 16'b1000_0000_0000_0000;
            16'bx1xx_xxxx_xxxx_xxxx: pos = 16'b0100_0000_0000_0000;
            16'bxx1x_xxxx_xxxx_xxxx: pos = 16'b0010_0000_0000_0000;
            16'bxxx1_xxxx_xxxx_xxxx: pos = 16'b0001_0000_0000_0000;
            16'bxxxx_1xxx_xxxx_xxxx: pos = 16'b0000_1000_0000_0000;
            16'bxxxx_x1xx_xxxx_xxxx: pos = 16'b0000_0100_0000_0000;
            16'bxxxx_xx1x_xxxx_xxxx: pos = 16'b0000_0010_0000_0000;
            16'bxxxx_xxx1_xxxx_xxxx: pos = 16'b0000_0001_0000_0000;
            16'bxxxx_xxxx_1xxx_xxxx: pos = 16'b0000_0000_1000_0000;
            16'bxxxx_xxxx_x1xx_xxxx: pos = 16'b0000_0000_0100_0000;
            16'bxxxx_xxxx_xx1x_xxxx: pos = 16'b0000_0000_0010_0000;
            16'bxxxx_xxxx_xxx1_xxxx: pos = 16'b0000_0000_0001_0000;
            16'bxxxx_xxxx_xxxx_1xxx: pos = 16'b0000_0000_0000_1000;
            16'bxxxx_xxxx_xxxx_x1xx: pos = 16'b0000_0000_0000_0100;
            16'bxxxx_xxxx_xxxx_xx1x: pos = 16'b0000_0000_0000_0010;
            16'bxxxx_xxxx_xxxx_xxx1: pos = 16'b0000_0000_0000_0001;
            default:      pos = 8'b0000_0000;
        endcase
    end

endmodule
