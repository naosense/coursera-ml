function [error_train, error_val] = ...
    randomLearningCurve(X, y, Xval, yval, lambda)

% Number of training examples
m = size(X, 1);
n = 50;
% You need to return these values correctly
error_train = zeros(m, n);
error_val   = zeros(m, n);

r = randperm(m);

for t = 1:n
    for i = 1:m
        selected = r(1:i);
        [theta_train] = trainLinearReg(X(selected, :), y(selected), lambda);
        % Set lambda to 0 when compute error
        [error_train(i, t), grad] = linearRegCostFunction(X(selected, :), y(selected), theta_train, 0);
        [error_val(i, t), grad] = linearRegCostFunction(Xval, yval, theta_train, 0);  
    end
end

error_train = mean(error_train, 2);
error_val = mean(error_val, 2);
end
