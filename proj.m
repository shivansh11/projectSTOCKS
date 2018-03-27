%Clear screen and all the figures.
clc;

%Load AAPL.cs file for the dataset.
sprintf("Loading stocks file |--> apple.csv")
data = csvread('apple.csv');
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
axis([0, 120, 0, 200]);
for i = 1:m,
scatter(X(i), Y(i), 2, "b", "filled");
pause(0.005);
end;

%Display the normal graph.
title("AAPL Stocks");
plot(X, Y);
hold on

%Load features X1, X2, X3, X4
X1 = csvread('iphone.csv');
X1 = X1(:,2);
X2 = csvread('ipad.csv');
X2 = X2(:,2);
X3 = csvread('macbook.csv');
X3 = X3(:,2);
X4 = csvread('samsung.csv');
X4 = X4(:,2);

