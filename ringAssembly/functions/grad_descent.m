function [copt,fopt,niter] = grad_descent(cTot,cInit,f,alpha)
%GRAD_DESCENT 



%% parameters

% step size ( 0.33 causes instability, 0.2 quite accurate)
%alpha = 0.001;

% termination tolerance
tol = cTot*10^-8;

% maximum number of allowed iterations
maxiter = 1000;

% minimum allowed perturbation
dxmin = cTot*10^-8;


%%

% initialize gradient norm, optimization vector, iteration counter, perturbation
x = cInit;
gnorm = norm(double(subs(f,x))); 
niter = 0; dx = inf;

% gradient descent algorithm:
while and(gnorm>=tol, and(niter <= maxiter, dx >= dxmin))
    % calculate gradient:
    g = double(subs(f,x));
    gnorm = norm(g); %abs value of deviation
    % take step:
    xnew = x + alpha*g; %- to find minimum
    % check step
    if ~isfinite(xnew)
        display(['Number of iterations: ' num2str(niter)])
        warning('x is inf or NaN');
        x = cInit;
        break;
    end
    % update termination metrics
    niter = niter + 1;
    dx = norm(xnew-x);
    x = xnew;
    
end

copt = x;
fopt = double(subs(f,x));
niter = niter - 1;

