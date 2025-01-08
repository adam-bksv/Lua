math.randomseed(os.time())
local balls = {}
for i = 1, 10 do
    balls[i] = {x = math.random(0, 100), y = math.random(0, 100), vx = math.random(-5, 5), vy = math.random(-5, 5), r = math.random(1, 5)}
end

function distance(a, b)
    return math.sqrt((a.x - b.x)^2 + (a.y - b.y)^2)
end

function updateBall(ball, dt)
    ball.x = ball.x + ball.vx * dt
    ball.y = ball.y + ball.vy * dt
    if ball.x < 0 or ball.x > 100 then ball.vx = -ball.vx end
    if ball.y < 0 or ball.y > 100 then ball.vy = -ball.vy end
end

function checkCollisions()
    for i = 1, #balls do
        for j = i + 1, #balls do
            if distance(balls[i], balls[j]) < balls[i].r + balls[j].r then
                balls[i].vx, balls[j].vx = balls[j].vx, balls[i].vx
                balls[i].vy, balls[j].vy = balls[j].vy, balls[i].vy
            end
        end
    end
end

for t = 1, 100 do
    for i, ball in ipairs(balls) do
        updateBall(ball, 0.1)
    end
    checkCollisions()
    for _, ball in ipairs(balls) do
        print(string.format("Ball at (%.2f, %.2f)", ball.x, ball.y))
    end
end
