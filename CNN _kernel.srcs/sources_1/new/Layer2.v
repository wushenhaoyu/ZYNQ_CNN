module Layer2#(
    parameter LAYER_NO = 2              ,
    parameter INPUT_NUM = 6             ,
    parameter OUTPUT_NUM = 6            ,
    parameter DATA_WIDTH = 16           ,
    parameter INPUT_WIDTH = 8'd28       ,
    parameter WINDOW_WIDTH = 8'd2       ,
    parameter STRIDE = 3'd2                    
)(
        input clk,
        input rst_n,
        input signed   [DATA_WIDTH  * INPUT_NUM - 1 :0]     input_data          ,
        input                                               input_valid         ,
        output                                              out_valid           ,
        output signed  [DATA_WIDTH  * OUTPUT_NUM - 1 :0]    out_data            
    );
    

    average_pooling#(
    .INPUT_WIDTH      (INPUT_WIDTH) ,
    .WINDOW_SIZE      (WINDOW_WIDTH)             ,
    .DATA_SIZE        (DATA_WIDTH * INPUT_NUM)              ,
    .STRIDE           (STRIDE)                                              
    )average_pooling(
    .clk            (clk)                   ,
    .rst_n          (rst_n)                 ,    
    .input_data     (input_data)            ,
    .input_valid    (input_valid)           ,
    .out_valid      (out_valid)             ,
    .out_data       (out_data)
    );

endmodule