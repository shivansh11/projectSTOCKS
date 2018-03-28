function [theta, J_history] = gradientDescent(XX, Y, theta, alpha, iters)

% Initialize some useful values
m = length(Y); % number of training examples
J_history = zeros(iters, 1);

for iter = 1:iters

temp1 = theta(1) - (alpha * (((XX * theta) - Y)' * XX(:,1)) / m)
temp2 = theta(2) - (alpha * (((XX * theta) - Y)' * XX(:,2)) / m)
temp3 = theta(3) - (alpha * (((XX * theta) - Y)' * XX(:,3)) / m)
temp4 = theta(4) - (alpha * (((XX * theta) - Y)' * XX(:,4)) / m)
temp5 = theta(5) - (alpha * (((XX * theta) - Y)' * XX(:,5)) / m)

theta(1) = temp1;
theta(2) = temp2;
theta(3) = temp3;
theta(4) = temp4;
theta(5) = temp5;
   
J_history(iter) = computeCost(XX, Y, theta);

end

end
