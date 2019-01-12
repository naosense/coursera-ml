function visualizeBoundaryLinearVaries(X, y)

C_vec = [1 10 30 100];
for i = 1:length(C_vec)
    C = C_vec(i);
    model = svmTrain(X, y, C, @linearKernel, 1e-3, 20);
    w = model.w;
    b = model.b;
    xp = linspace(min(X(:,1)), max(X(:,1)), 100);
    yp = - (w(1)*xp + b)/w(2);
    subplot(2, 2, i);
    plotData(X, y);
    hold on;
    plot(xp, yp, '-b'); 
    hold off
    title(sprintf('decision boundary(C = %d)', C));
end
savePlot('../../figure/ex6-3 Linear decision boundary varies C.png');



end
