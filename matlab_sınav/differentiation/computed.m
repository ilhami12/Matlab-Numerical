clc 
clear

x = [-2 1 1i*pi/2 -1i*pi];

for i = 1:length(x)
    term = 1;
    sum = term;
    n = 0;
     fprintf(" \n n    |  Computed   |   Actual   |  Absolute Error  \n--------------------------------------------------\n")



    while true
        
        n = n + 1;
       
        term = term * x(i) / n;
        
        sum = sum + term;
        
        actual = exp(x(i));
       
        error = abs(sum - actual);
        
        fprintf(' %d     |   %.6f  |    %.6f   |   %.6f\n', n, sum, actual, error);

       
        if error < 1e-5
            break;
        end

    end

end