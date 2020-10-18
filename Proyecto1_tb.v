module testbench();
reg clk, reset, PB1, PB2, PB3;
reg [1:0] A;
wire T2, Ac2, B2;
wire [1:0] Ta2;
wire [1:0] P2;

initial begin 
    clk <= 1;
    forever #5 clk = ~clk;
end

//Se llama a mi main
main M1(clk, reset, PB1, PB2, PB3, A, T2, Ac2, B2, Ta2, P2);

initial begin
    #2
    $display("\n");
    $display("Bienvenido a Diego's");
    $display("clk reset PB1 PB2 PB3 A");
    $monitor("%b  %b  %b  %b  %b  %b", clk, reset, PB1, PB2, PB3, A);

    //Opción de menú 1
    #2 reset = 1;
    #2 reset = 0;
    #4 PB1 = 1; PB2 = 0; PB3 = 0; A = 2'b00;
    #4 PB1 = 1; PB2 = 0; PB3 = 0; A = 2'b00;
    #4 PB1 = 0; PB2 = 0; PB3 = 0; A = 2'b01;
    #4 PB1 = 0; PB2 = 0; PB3 = 0; A = 2'b01;
    #4 PB1 = 1; PB2 = 0; PB3 = 0; A = 2'b00;
    #4 PB1 = 1; PB2 = 0; PB3 = 0; A = 2'b00;
    #4 PB1 = 0; PB2 = 1; PB3 = 0; A = 2'b00;

    //Opción de menú 2
    #2 reset = 1;
    #2 reset = 0;
    #4 PB1 = 1; PB2 = 0; PB3 = 0; A = 2'b00;
    #4 PB1 = 0; PB2 = 1; PB3 = 0; A = 2'b00;
    #4 PB1 = 0; PB2 = 0; PB3 = 0; A = 2'b10;
    #4 PB1 = 0; PB2 = 0; PB3 = 0; A = 2'b10;
    #4 PB1 = 0; PB2 = 1; PB3 = 0; A = 2'b00;
    #4 PB1 = 0; PB2 = 1; PB3 = 0; A = 2'b00;
    #4 PB1 = 0; PB2 = 1; PB3 = 0; A = 2'b00;

    //Opcion de menú 3
    #2 reset = 1;
    #2 reset = 0;
    #4 PB1 = 1; PB2 = 0; PB3 = 0; A = 2'b00;
    #4 PB1 = 0; PB2 = 1; PB3 = 0; A = 2'b00;
    #4 PB1 = 0; PB2 = 0; PB3 = 0; A = 2'b11;
    #4 PB1 = 0; PB2 = 0; PB3 = 0; A = 2'b11;
    #4 PB1 = 0; PB2 = 1; PB3 = 0; A = 2'b00;
    #4 PB1 = 1; PB2 = 0; PB3 = 0; A = 2'b00;
    #4 PB1 = 0; PB2 = 1; PB3 = 0; A = 2'b00;
    
    //Opcion de menú 4
    #2 reset = 1;
    #2 reset = 0;
    #4 PB1 = 1; PB2 = 0; PB3 = 0; A = 2'b00;
    #4 PB1 = 1; PB2 = 0; PB3 = 0; A = 2'b00;
    #4 PB1 = 0; PB2 = 0; PB3 = 0; A = 2'b01;
    #4 PB1 = 0; PB2 = 0; PB3 = 0; A = 2'b10;
    #4 PB1 = 1; PB2 = 0; PB3 = 0; A = 2'b00;
    #4 PB1 = 0; PB2 = 1; PB3 = 0; A = 2'b00;
    #4 PB1 = 0; PB2 = 1; PB3 = 0; A = 2'b00;

    //Opcion de menú 5
    #2 reset = 1;
    #2 reset = 0;
    #4 PB1 = 1; PB2 = 0; PB3 = 0; A = 2'b00;
    #4 PB1 = 1; PB2 = 0; PB3 = 0; A = 2'b00;
    #4 PB1 = 0; PB2 = 0; PB3 = 0; A = 2'b11;
    #4 PB1 = 0; PB2 = 0; PB3 = 0; A = 2'b10;
    #4 PB1 = 0; PB2 = 1; PB3 = 0; A = 2'b00;
    #4 PB1 = 1; PB2 = 0; PB3 = 0; A = 2'b00;
    #4 PB1 = 0; PB2 = 1; PB3 = 0; A = 2'b00;

    //Opcion de menú cancelado en el estado "principal"
    #2 reset = 1;
    #2 reset = 0;
    #4 PB1 = 1; PB2 = 0; PB3 = 0; A = 2'b00;
    #4 PB1 = 0; PB2 = 1; PB3 = 0; A = 2'b00;
    #4 PB1 = 0; PB2 = 0; PB3 = 0; A = 2'b01;
    #4 PB1 = 0; PB2 = 0; PB3 = 1; A = 2'b00;
    #4 PB1 = 0; PB2 = 0; PB3 = 0; A = 2'b00;
    #4 PB1 = 0; PB2 = 0; PB3 = 0; A = 2'b00;
    #4 PB1 = 0; PB2 = 0; PB3 = 0; A = 2'b00;

    //Opcion de menú cancelado en el estado "Acompañamiento"
    #2 reset = 1;
    #2 reset = 0;
    #4 PB1 = 1; PB2 = 0; PB3 = 0; A = 2'b00;
    #4 PB1 = 0; PB2 = 1; PB3 = 0; A = 2'b00;
    #4 PB1 = 0; PB2 = 0; PB3 = 0; A = 2'b01;
    #4 PB1 = 0; PB2 = 0; PB3 = 0; A = 2'b10;
    #4 PB1 = 0; PB2 = 0; PB3 = 1; A = 2'b00;
    #4 PB1 = 0; PB2 = 0; PB3 = 0; A = 2'b00;
    #4 PB1 = 0; PB2 = 0; PB3 = 0; A = 2'b00;

end

initial
    #240 $finish;

initial begin
    $dumpfile ("Proyecto1_tb.vcd");
    $dumpvars(0, testbench);
end 
endmodule
