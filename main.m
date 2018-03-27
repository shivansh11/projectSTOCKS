%Clear screen and all the figures.
clc;

%Load AAPL.cs file for the dataset.
sprintf("Loading stocks file |--> AAPL.csv")
data = csvread('AAPL.csv');
sprintf("Success!")

%Capture 3rd and 4th column of the data in vectors Y1 and Y2
Y1 = data(:,3);
Y2 = data(:,4);

%Y1 is high, Y2 is low. Taking element-wise mean of Y1 and Y2.
Y = Y1 .+ Y2;
Y = Y ./ 2;

%Dismiss the 1st row of vector Y since it is not the data.
Y = Y(2:505);
m = length(Y);

%m is the no. of training examples. Y is the stock price vector.

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
axis([0, 600, 80, 180]);
for i = 1:m,
scatter(X(i), Y(i), 2, "b", "filled");
pause(0.005);
end;

%Display the normal graph.
title("AAPL Stocks");
plot(X, Y, 2);

