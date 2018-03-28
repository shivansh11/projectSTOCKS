%Clear screen and all the figures.
clc;

%Load AAPL.cs file for the dataset.
sprintf("Loading stocks file |--> AAPL.csv")
data = csvread('AAPL1.csv');
sprintf("Success!")

%Capture 3rd and 4th column of the data in vectors Y1 and Y2
Y1 = data(:,3);
Y2 = data(:,4);

%Y1 is high, Y2 is low. Taking element-wise mean of Y1 and Y2.
Y = Y1 .+ Y2;
Y = Y ./ 2;
%m is the no. of training examples. Y is the stock price vector.
m = length(Y);

%Let vector X represent the days.
X = [1:m];
X = X'; 

%Now plotting the dataset.
sprintf('Plotting stock prices')
figure
hold on
xlabel('Days');
ylabel('Price ($)');
title('AAPL Stocks - Plotting data');
axis([0, 300, 0, 200]);
for i = 1:m,
scatter(X(i), Y(i), 2, "b", "filled");
pause(0.005);
end;

%Display the normal graph.
title("AAPL Stocks");
plot(X, Y, "color", 'b');
hold on

%Load features X1, X2, X3, X4
X1 = csvread('iphone1.csv');
X1 = X1(:,2);
X2 = csvread('ipad1.csv');
X2 = X2(:,2);
X3 = csvread('macbook1.csv');
X3 = X3(:,2);
X4 = csvread('samsung1.csv');
X4 = X4(:,2);

%Setting the degree and nature of features
X4 = X4 .* (-1);
%X4 = X4 .^ 2;
%X1 = X1 .^ 3;
%X2 = X2 .^ 2;

X4 = X4 .* 3;
X1 = X1 .* 5;
X2 = X2 .* 3;


%Composing features into one matrix
XX = [ones(m,1), X1, X2, X3, X4];
theta = zeros(5, 1);

thet = pinv(XX'*XX)*XX'*Y
plot(X, XX*thet, '-')
legend('Stocks line','Training line')

hold on

%Gradient descent settings
iterations = 3000;
alpha = 0.00001;

fprintf('\nTesting the cost funtion J...\n')
J = computeCost(XX, Y, theta);
fprintf('With theta = [0;0;0;0;0]\nCost computed = %f\n', J);
fprintf('Program paused. Press enter to continue.\n');
pause;

fprintf('\nRunning Gradient Descent ...\n')
% run gradient descent
[theta, J_history] = gradientDescent(XX, Y, theta, alpha, iterations);

% print theta to screen
fprintf('Theta found by gradient descent:\n');
fprintf('%f\n', theta);

plot(X, XX*theta, '-', 'color', 'g')
J_history




