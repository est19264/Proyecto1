//Modulo para FlipFlop de cinco bits
module FlipFlopD5(
    input wire reset, clk,
    input wire [4:0] D,
    output reg [4:0] S);
        always @ (posedge clk, posedge reset) begin
            if (reset) begin
                S <= 5'b0;
            end
            else
                S <= D;
        end
endmodule

//Modulo para FlipFlop de dos bits      
module FlipFlopD2(
    input wire reset, clk,
    input wire [1:0] D,
    output reg [1:0] S);
        always @ (posedge clk, posedge reset) begin
            if (reset) begin
                S <= 2'b0;
            end
            else
                S <= D;
        end
endmodule

//Modulo para FlipFlop de un bits      
module FlipFlopD1(
    input wire reset, clk,
    input wire D,
    output reg S);
        always @ (posedge clk, posedge reset) begin
            if (reset) begin
                S <= 1'b0;
            end
            else
                S <= D;
        end
endmodule

//Modulo para Anti Rebote 1
module antirebote1(
    input wire clk, reset, PB1,   
    output wire out);
    wire Y1, Y2;
    assign Y1 = PB1;
    FlipFlopD1 E1(clk, reset, Y1, Y2);
    assign  Out = (~Y2 & PB1);
endmodule

//Modulo para Anti Rebote 2
module antirebote2(
    input wire clk, reset, PB2,   
    output wire out);
    wire Y1, Y2;
    assign Y1 = PB2;
    FlipFlopD1 E1(clk, reset, Y1, Y2);
    assign  Out = (~Y2 & PB2);
endmodule

//Modulo para Anti Rebote 3
module antirebote3(
    input wire clk, reset, PB3,   
    output wire out);
    wire Y1, Y2;
    assign Y1 = PB3;
    FlipFlopD1 E1(clk, reset, Y1, Y2);
    assign  Out = (~Y2 & PB3);
endmodule



//Modulo de memoria para la variable tipo 
module Memoria1(
    input wire clk, reset, Y,
    input wire [1:0] T,
    output wire T2);
    wire [1:0] E; //Estados actuales
    wire [1:0] EF; //Estados futuros
    
    //Ecuaciones para los estados Futuros
    assign EF[1] = (~E[1] & ~E[0] & T[1] & ~T[0] & ~Y) | (E[1] & ~E[0] & ~T[1] & ~T[0] & ~ Y);
    assign EF[0] = (~E[1] & ~E[0] & ~T[1] & T[0] & ~Y) | (~E[1] & E[0] & ~T[1] & ~T[0] & ~Y);

    //Implementación de FlipFlop tipo D de 2 bits
    FlipFlopD2 R1(clk, reset, EF, E);

    //Ecuaciones para las salidas
    assign T2 = ~E[0];

endmodule

//Modulo de memoria para variable Tamaño
module Memoria2(
    input wire clk, reset, Y,
    input wire [1:0] Ta, 
    output wire [1:0] Ta2);
    wire [1:0] E; //Estados actuales
    wire [1:0] EF; //Estados Futuros

    //Ecuaciones para los estados Futuros
    assign EF[1] = (~E[1] & ~E[0] & Ta[1] & ~Y) | (E[1] & ~Ta[1] & ~Ta[0] & ~Y);
    assign EF[0] = (~E[1] & ~E[0] & Ta[0] & ~Y) | (E[0] & ~Ta[1] & ~Ta[0] & ~Y);

    //Ecuaciones para las salidas
    assign Ta2[1] = (E[1] & E[0]);
    assign Ta2[0] = ~E[0];



    //Implementación de FlipFlop tipo D de 2 bits
    FlipFlopD2 R2(clk, reset, EF, E);

endmodule

//Modulo de memoria para variable Principal
module Memoria3(
    input wire clk, reset, Y, 
    input wire [1:0] P, 
    output wire [1:0] P2);
    wire [1:0] E; //Estados actuales
    wire [1:0] EF; //Estados Futuros

    //Ecuaciones para los estados Futuros
    assign EF[1] = (~E[1] & ~E[0] & P[1] & ~Y) | (E[1] & ~P[1] & ~P[0] & ~Y);
    assign EF[0] = (~E[1] & ~E[0] & P[0] & ~Y) | (E[0] & ~P[1] & ~P[0] & ~Y);
    
    //Ecuaciones para las salidas
    assign P2[1] = (E[1] & E[0]);
    assign P2[0] = ~E[0];

    //Implementación de FlipFlop tipo D de 2 bits
    FlipFlopD2 R3(clk, reset, EF, E);


endmodule


//Modulo de memoria para la variable Acomp 
module Memoria4(
    input wire clk, reset, Y,
    input wire [1:0] Ac,
    output wire Ac2);
    wire [1:0] E; //Estados actuales
    wire [1:0] EF; //Estados futuros
    
    //Ecuaciones para los estados Futuros
    assign EF[1] = (~E[1] & ~E[0] & Ac[1] & ~Ac[0] & ~Y) | (E[1] & ~E[0] & ~Ac[1] & ~Ac[0] & ~Y);
    assign EF[0] = (~E[1] & ~E[0] & ~Ac[1] & Ac[0] & ~Y) | (~E[1] & E[0] & ~Ac[1] & ~Ac[0] & ~Y);

    //Implementación de FlipFlop tipo D de 2 bits
    FlipFlopD2 R4(clk, reset, EF, E);

    //Ecuaciones para las salidas
    assign Ac2 = ~E[0];

endmodule

//Modulo de memoria para variable Bebida
module Memoria5(
    input wire clk, reset, Y,
    input wire [1:0] B,
    output wire B2);
    wire [1:0] E; //Estados actuales
    wire [1:0] EF; //Estados futuros
    
    //Ecuaciones para los estados Futuros
    assign EF[1] = (~E[1] & ~E[0] & B[1] & ~B[0] & ~Y) | (E[1] & ~E[0] & ~B[1] & ~B[0] & ~Y);
    assign EF[0] = (~E[1] & ~E[0] & ~B[1] & B[0] & ~Y) | (~E[1] & E[0] & ~B[1] & ~B[0] & ~Y);

    //Implementación de FlipFlop tipo D de 2 bits
    FlipFlopD2 R5(clk, reset, EF, E);

    //Ecuaciones para las salidas
    assign B2 = ~E[0];

endmodule


//Modulo de la FSM 
module FSM(
    input wire clk, reset, PB1, PB2, PB3, 
    input wire [1:0] A,
    output wire [1:0] T, 
    output wire [1:0] Ta, 
    output wire [1:0] P, 
    output wire [1:0] Ac, 
    output wire [1:0]B, 
    output wire Y);
    wire [4:0]E; //Estados actuales
    wire [4:0]EF; //Estados futuros
    

    assign EF[4] = (E[4] & ~E[3] & ~E[2] & E[1] & ~E[0] & ~PB1 & ~PB3) | (E[4] & ~E[3] & ~E[2] & ~E[1] & ~PB1 & ~PB2 & ~PB3) | (~E[4] & E[3] & E[2] & E[1] & E[0] & ~PB1 & PB2 & ~PB3) | (~E[4] & E[3] & E[2] & E[1] & E[0] & PB1 & ~PB2 & ~PB3);
    assign EF[3] = (~E[4] & E[3] & ~PB1 & ~PB2 & ~PB3) | (~E[4] & E[2] & E[1] & ~PB1 & ~PB2 & ~PB3) | (~E[4] & E[2] & E[0] & ~PB1 & ~PB2 & ~PB3) | (~E[4] & E[3] & E[2] & ~E[1] & ~E[0] & ~PB1 & ~PB3) | (~E[4] & E[3] & E[2] & ~E[1] & ~E[0] & ~PB2 & ~PB3);
    assign EF[2] = (~E[4] & ~E[2] & E[1] & ~PB1 & ~PB2 & ~PB3) | (~E[4] & E[3] & E[0] & ~PB1 & ~PB2 & ~PB3) | (~E[4] & E[3] & E[2] & ~E[1] & ~E[0] & ~PB1 & ~PB3) | (~E[4] & E[3] & E[2] & ~E[1] & ~E[0] & ~PB2 & ~PB3) | (~E[4] & E[2] & ~E[1] & ~E[0] & ~PB1 & ~PB2 & ~PB3) | (~E[4] & E[3] & E[1] & ~PB1 & ~PB2 & ~PB3);
    assign EF[1] = (E[4] & ~E[3] & ~E[2] & E[1] & ~E[0] & ~PB1 & ~PB3) | (~E[4] & E[3] & E[2] & E[1] & ~PB1 & ~PB2 & ~PB3) | (E[4] & ~E[3] & ~E[2] & ~E[1] & ~PB1 & ~PB2 & ~PB3) | (~E[4] & E[3] & E[2] & E[0] & ~PB1 & ~PB2 & ~PB3) | (~E[4] & ~E[3] & ~E[2] & ~E[1] & E[0] & ~PB1 & PB2 & ~PB3) | (~E[4] & E[3] & E[2] & ~E[1] & ~E[0] & ~PB1 & ~PB2 & ~PB3) | (~E[4] & ~E[3] & ~E[2] & ~E[1] & E[0] & PB1 & ~PB2 & ~PB3) | (~E[4] & ~E[3] & E[2] & ~E[1] & ~E[0] & ~PB1 & ~PB2 & ~PB3 & A[1]) | (~E[4] & E[3] & ~E[2] & ~E[1] & ~E[0] & ~PB1 & ~PB2 & ~PB3 & A[1]);
    assign EF[0] = (~E[4] & E[3] & E[2] & E[1] & E[0] & ~PB1 & ~PB3) | (~E[4] & ~E[3] & ~E[2] & ~E[1] & E[0] & ~PB1 & ~PB3) | (~E[4] & E[3] & E[2] & E[1] & ~PB1 & ~PB2 & ~PB3) | (~E[4] & E[3] & E[2] & E[0] & ~PB1 & ~PB2 & ~PB3) | (E[4] & ~E[3] & ~E[2] & E[1] & ~E[0] & ~PB1 & PB2 & ~PB3) | (~E[4] & E[3] & E[2] & ~E[1] & ~E[0] & PB1 & ~PB2 & ~PB3) | (~E[4] & ~E[3] & ~E[2] & ~E[1] & ~E[0] & PB1 & ~PB2 & ~PB3) | (~E[4] & ~E[3] & E[2] & ~E[1] & ~E[0] & ~PB1 & ~PB2 & ~PB3 & A[0]) | (~E[4] & E[3] & ~E[2] & ~E[1] & ~E[0] & ~PB1 & ~PB2 & ~PB3 & A[0]);

    // Implementación de flip FlopFipo D de cinco bits

    FlipFlopD5 S1(clk, reset, EF, E);
    
    //Ecuaciones para las salidas
    
    assign T[1] = (~E[4] & ~E[3] & ~E[2] & E[1] & ~E[0]);
    assign T[0] = (~E[4] & ~E[3] & ~E[2] & E[1] & E[0]);
    assign Ta[1] = (~E[4] & ~E[3] & E[2] & E[1]);
    assign Ta[0] = (~E[4] & ~E[3] & E[2] & E[0]);
    assign P[1] = (~E[4] & E[3] & ~E[2] & E[1]);
    assign P[0] = (~E[4] & E[3] & ~E[2] & E[0]);
    assign Ac[1] = (~E[4] & E[3] & E[2] & E[1] & ~E[0]);
    assign Ac[0] = (~E[4] & E[3] & E[2] & ~E[1] & E[0]);
    assign B[1] = (E[4] & ~E[3] & ~E[2] & ~E[1] & E[0]);
    assign B[0] = (E[4] & ~E[3] & ~E[2] & ~E[1] & ~E[0]);
    assign Y = (E[4] & ~E[3] & ~E[2] & E[1] & ~E[0]);

endmodule

module main(
    input wire clk, reset, PB1, PB2, PB3, 
    input wire [1:0] A,
    output wire T2, Ac2, B2,
    output wire [1:0] Ta2,
    output wire [1:0] P2);
    wire K1, K2, K3, Y;
    wire [1:0] T;
    wire [1:0] Ta;
    wire [1:0] P;
    wire [1:0] Ac;
    wire [1:0] B;
    antirebote1 J1(clk, reset, PB1, K1);
    antirebote2 J2(clk, reset, PB2, K2);
    antirebote3 J3(clk, reset, PB3, K3);
    FSM I(clk, reset, K1, K2, K3, A, T, Ta, P, Ac, B, Y);
    Memoria1 W(clk, reset, Y, T, T2);
    Memoria2 W1(clk, reset, Y, Ta, Ta2);
    Memoria3 W2(clk , reset, Y, P, P2);
    Memoria4 W3(clk, reset, Y, Ac, Ac2);
    Memoria5 W4(clk, reset, Y, B, B2);
endmodule 


