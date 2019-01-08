function [lambda_vec, error_train, error_val, error_test] = ...
    computeTestError(X, y, Xval, yval, Xtest, ytest)


% Selected values of lambda (you should not change this)
lambda_vec = [0 0.001 0.003 0.01 0.03 0.1 0.3 1 3 10]';

% You need to return these variables correctly.
error_train = zeros(length(lambda_vec), 1);
error_val = zeros(length(lambda_vec), 1);
error_test = zeros(length(lambda_vec), 1);

for i = 1:length(lambda_vec)
    lambda = lambda_vec(i);
    [theta_train] = trainLinearReg(X, y, lambda);
    % Set lambda to 0 when compute error
    [error_train(i), grad] = linearRegCostFunction(X, y, theta_train, 0);
    [error_val(i), grad] = linearRegCostFunction(Xval, yval, theta_train, 0); 
    [error_test(i), grad] = linearRegCostFunction(Xtest, ytest, theta_train, 0); 
end








% =========================================================================

end
