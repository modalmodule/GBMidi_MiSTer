module envelope
(
    input clk,
    input en,
    input[3:0] decay,
    input note_on,
    input note_repeat,
    input[6:0] note_start,
    input[6:0] vel_start,
    output[6:0] adjusted_vel
);
reg[25:0] timer = 'b1;
reg started;
reg note_repeat_reg;
reg[6:0] note_reg;
reg[6:0] adjusted_vel_reg;
assign adjusted_vel = adjusted_vel_reg;

always @ (posedge clk) begin
    if (en && decay < 'd4) begin
        if ((note_reg != note_start || note_repeat_reg) && note_on && !started) begin
            started <= 1;
            adjusted_vel_reg <= vel_start;
            timer <= 'b1;
            note_reg <= note_start;
            note_repeat_reg <= 0;
        end
        if (started) begin
            if (adjusted_vel_reg > 1) begin
                timer <= timer + (26'b1<<decay);
                if (timer > 26'd33554431) begin
                    adjusted_vel_reg <= adjusted_vel_reg - 'b1;
                    timer <= 'b1;
                end
            end
            if (note_reg != note_start || note_repeat) begin
                started <= 0;
                note_repeat_reg <= note_repeat;
            end
        end
        if (!note_on) begin
            started <= 0;
            if (note_reg == note_start) note_repeat_reg <= note_repeat;
            note_reg <= 0;
        end
    end
end
endmodule