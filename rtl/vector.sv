module vector #
(
    parameter   DATA_IN_WIDTH     =     32,
    localparam  DATA_OUT_WIDTH    =     DATA_IN_WIDTH >> 2  
)
(
    input   [DATA_IN_WIDTH-1:0]     data,
    output  [DATA_OUT_WIDTH-1:0]    data1,
    output  [DATA_OUT_WIDTH-1:0]    data2,
    output  [DATA_OUT_WIDTH-1:0]    data3,
    output  [DATA_OUT_WIDTH-1:0]    data4
);

    /* 访问部分位 */
    // 1.直接访问 
    assign data1 = data[DATA_OUT_WIDTH-1:0];
    /*
       2.使用 bit 和 width 访问
       [bit+: width] : 从起始 bit 位开始递增，位宽为 width 
       [bit-: width] : 从起始 bit 位开始递减，位宽为 width
    */
    // data2 & data3 结果相同
    assign data2 = data[DATA_OUT_WIDTH-1-:DATA_OUT_WIDTH];
    assign data3 = data[0+:DATA_OUT_WIDTH];
    assign data4 = data[DATA_IN_WIDTH-1-:DATA_OUT_WIDTH];
endmodule