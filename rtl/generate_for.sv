module generate_for #
(
    parameter DATA_IN_NUM   =   16,
    parameter DATA_OUT_NUM  =   32,
    parameter DATA_WIDTH    =   32
)
(
    input   [DATA_IN_NUM-1:0][DATA_WIDTH-1:0]   data_in,
    input   [DATA_IN_NUM-1:0][DATA_OUT_NUM-1:0] data_sel,
    output  [DATA_OUT_NUM-1:0][DATA_WIDTH-1:0]  data_out
);

    generate 
        for(genvar i = 0; i < DATA_OUT_NUM; i = i + 1) begin
            for(genvar j = 0; j < DATA_IN_NUM; j = j + 1) begin
                if(1'b1) begin
                    assign data_out[i] = data_in[j];
                end
            end
        end
    endgenerate

endmodule