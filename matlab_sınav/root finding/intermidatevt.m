function intermidatevt(a, b)
% Intermediate Value Theorem
% Inputs:
% f: function handle of the function to be evaluated
% a: lower bound of the interval
% b: upper bound of the interval

% Evaluate the function at the endpoints of the interval
fa = f(a);
fb = f(b);

% Check if the function changes sign between the endpoints
if fa * fb < 0
    disp('The function has at least one root in the given interval.')
else
    disp('The function does not have a root in the given interval.')
end

end