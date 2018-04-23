%Clear screen and all the figures.
clc;

%Load AAPL.cs file for the dataset.
sprintf("Loading stocks file |--> AAPL.csv")
data = csvread('AAPL.csv');
sprintf("Success!")

%Capture 5th column of AAPL (close price)
Y = data(:,5);

%m is the no. of training examples. Y is the stock price vector.
m = length(Y);
%remove header from the close price
Y = Y(2:m)
m = m - 1

%Let vector X represent the days.
X = [1:m];
X = X'; 

%Now plotting the dataset.
sprintf('Plotting stock prices')
figure
hold on
xlabel('Days (2015 - 2018)');
ylabel('Price ($)');
axis([0, 750, 0, 200]);

%Display the normal graph.
title("AAPL Stocks");
plot(X, Y, "linewidth", 2, "color", 'b');
hold on

%Load features X1, X2, X3, X4
X1 = csvread('Iphone.csv');
X1 = X1(:,2);
X2 = csvread('Ipad.csv');
X2 = X2(:,2);
X3 = csvread('MacBook.csv');
X3 = X3(:,2);
X4 = csvread('Samsung.csv');
X4 = X4(:,2);

%Setting the degree and nature of features
X4 = X4 .* (-1);
X4 = X4 .* 3;
X3 = X3 .* 1;
X2 = X2 .* 2;
X1 = X1 .* 200;

%Composing features into one matrix
XX = [ones(m,1), X1, X2, X3, X4];
theta = zeros(5, 1);

thet = pinv(XX'*XX)*XX'*Y
TRX = XX*thet;

hold on

%Gradient descent settings
iterations = 3000;
alpha = 0.001;

fprintf('\nTesting the cost funtion J...\n')
J = computeCost(XX, Y, theta);
fprintf('With theta = [0;0;0;0;0]\nCost computed = %f\n', J);
fprintf('Program paused. Press enter to continue.\n');
pause;
thet

load IPhone1.txt
load impactIPhone.txt
preIphone = IPhone1 * impactIPhone;

load IPad1.txt
load impactIPad.txt
preIpad = IPad1 * impactIPad;

load MacBook1.txt
load impactMacBook.txt
preMacBook = MacBook1 * impactMacBook;

load Samsung1.txt
load impactSamsung.txt
preSamsung = Samsung1 * impactSamsung;

newX = [1, preIphone, preIpad, preMacBook, preSamsung]

fprintf('\nRunning Gradient Descent ...\n')
% run gradient descent
%[theta, J_history] = gradientDescent(XX, Y, theta, alpha, iterations);

% print theta to screen
fprintf('Theta found by gradient descent:\n');
fprintf('%f\n', thet);

tuner = 1.14;

for j = 601:m
TRX(j) = TRX(j) * 1.14;
end

plot(X, TRX, "linewidth", 1)
plot(X(650:m), TRX(650:m), "linewidth", 1, 'g')
scatter(X(m), TRX(m), 100, "g", "filled")
scatter(X(m), Y(m), 100, "b", "filled")
legend ({"Actual", "Training", "Prediction"}, "location", "east");
tune = 1.48

fprintf('Press enter for prediction...\n\n')
pause;

fprintf('Prediction for tomorrow : $%f\n', newX * thet * tune
)

%J_history
