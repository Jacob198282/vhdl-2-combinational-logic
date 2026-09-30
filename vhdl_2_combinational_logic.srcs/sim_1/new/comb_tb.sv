`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2026 14:13:54
// Design Name: 
// Module Name: comb_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module comb_tb();
    // Wait time
    localparam DELAY_TIME = 200_000; // 0.2 seconds
    
    // Constants for comparing displayed numbers to these on the display
    localparam NUM_0 = 8'b00000011;
    localparam NUM_1 = 8'b10011111;
    localparam NUM_2 = 8'b00100101;
    localparam NUM_3 = 8'b00001101;
    localparam NUM_4 = 8'b10011001;
    
    // Loop max counter value
    localparam MAX_LOOP = 16;
    // Loop counter
    integer count;
    
    // Declaring test signals
    logic [3:0] sw_i = 0;
    logic [3:0] led7_an_o = 0;
    logic [7:0] led7_seg_o = 0;
    
    comb UUT (
        .sw_i(sw_i),
        .led7_an_o(led7_an_o),
        .led7_seg_o(led7_seg_o)
    );
    
    initial begin
        for (count = 0; count < MAX_LOOP; count = count + 1) begin
            $display("----------------------------------");
            $display("Switch position: %0b", count);
            sw_i <= count;
            // checking if zero is correctly displayed
            if (led7_seg_o == NUM_0 && count == 0) begin
                $display("[SUCCESS] 0 is displayed correctly for %0b switch combination", count);
            // checking if 1 is correctly displayed for all possibilities
            end else if (led7_seg_o == NUM_1 && (count == 1 || count == 2 || count == 4 || count == 8)) begin
                $display("[SUCCESS] 1 is displayed correctly for %0b switch combination", count);
            // checking if 2 is correctly displayed for all possibilities
            end else if (led7_seg_o == NUM_2 && (count == 3 || count == 5 || count == 6 || count == 9 || count == 10 || count == 12)) begin
                $display("[SUCCESS] 2 is displayed correctly for %0b switch combination", count);
            // checking if 3 is correctly displayed for all possibilities;
            end else if (led7_seg_o == NUM_3 && (count == 7 || count == 11 || count == 13 || count == 14)) begin
                $display("[SUCCESS] 3 is displayed correctly for %0b switch combination", count);
            // checking if 4 is correctly displayed
            end else if (led7_seg_o == NUM_4 && count == 15) begin
                $display("[SUCCESS] 4 is displayed correctly for %0b switch combination", count);
            end else begin
                $display("[ERROR] Number of ones not displayed correctly for %0b switch combination", count);
            end;
            #(DELAY_TIME); 
        end  
    end
endmodule
