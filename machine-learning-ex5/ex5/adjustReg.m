function adjustReg(X_poly, X, y, X_poly_val, yval, mu, sigma, theta, p, m)
    lambda_vec = [0 1 3 100];
    for i = 1:length(lambda_vec)
        lambda = lambda_vec(i);
        [theta] = trainLinearReg(X_poly, y, lambda);

        % Plot training data and fit
        if (i == 1)
            figure;
        end
        subplot(2, 2, i);
        plot(X, y, 'rx', 'MarkerSize', 10, 'LineWidth', 1.5);
        plotFit(min(X), max(X), mu, sigma, theta, p);
        xlabel('Change in water level (x)');
        ylabel('Water flowing out of the dam (y)');
        title (sprintf('(lambda = %f)', lambda));
        
    end
    savePlot('../../figure/ex5-6 Polynomial regression fit on different lambdas.png');
    
    for i = 1:length(lambda_vec)
        lambda = lambda_vec(i);
        if (i == 1)
            figure;
        end
        [error_train, error_val] = ...
            learningCurve(X_poly, y, X_poly_val, yval, lambda);
        
        subplot(2, 2, i);
        plot(1:m, error_train, 1:m, error_val);
        title(sprintf('(lambda = %f)', lambda));
        xlabel('Number of training examples')
        ylabel('Error')
        axis([0 13 0 100])
    end
    savePlot('../../figure/ex5-7 Learning curve for polynomial regression on different lambdas.png');
    
  
end
