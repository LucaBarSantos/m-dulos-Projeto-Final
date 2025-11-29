module dicas(
    input  senhaA,
    input  senhaB,
    input  tentativaA,
    input  tentativaB,
    input  modoB,   // 0 = comparando senha A, 1 = senha B

    output paridade,        // para HEX7
    output reg [1:0] comp   // para HEX6
);

// Parte 1: Parid

assign paridade = senhaA[3] ^ senhaA[2] ^ senhaA[1] ^ senhaA[0] ^
                  senhaB[2] ^ senhaB[1] ^ senhaB[0];

// PARTE 2: COMPARADOR
// comp:
// 00 = menor
// 01 = maior
// 10 = igual

always @(*) begin
    if (!modoB) begin
        // comparando senha A (4 bits)
        if      (tentativaA > senhaA) comp = 2'b01;  
        else if (tentativaA < senhaA) comp = 2'b00;  
        else                           comp = 2'b10; 
    end else begin
        // comparando senha B (3 bits)
        if      (tentativaB > senhaB) comp = 2'b01;
        else if (tentativaB < senhaB) comp = 2'b00;
        else                           comp = 2'b10;
    end
end

endmodule

