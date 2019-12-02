players = 1000000;
turns = 100;
for player = 1:players
score = 0;
for turn = 1:turns
score = score+randi([0 1],1,1);
end
scoreList(player) = score;
end

for i = 1:100
totals(i)=0;
end
for player = 1:players
totals(scoreList(player)) = totals(scoreList(player)) + 1;
end

input = (1:100)
plot(input,totals(input))