function J = computeCost(XX, Y, theta)

% Initialize some useful values
m = length(Y); % number of training examples
J = 0;

J = sum(((XX*theta) - Y) .^ 2)/(2*m); 

end
