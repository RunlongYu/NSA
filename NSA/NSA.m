
clc;
clear all;
tic;

format long;
format compact;

disp('The NSA runs!');

% Choose the problems to be tested. Please note that for test functions F7
% and F25, the global optima are out of the initialization range. For these
% two test functions, we do not need to judge whether the variable violates
% the boundaries during the evolution after the initialization.
problemSet = 1:25;
for problemIndex = 12 : 12

    problem = problemSet(problemIndex);

    % Define the dimension of the problem
    n = 30;

    switch problem

        case 1

            % lu: define the upper and lower bounds of the variables
            lu = [-100 * ones(1, n); 100 * ones(1, n)];
            % Load the data for this test function
            load sphere_func_data
            A = []; M = []; a = []; alpha = []; b = [];

        case 2

            lu = [-100 * ones(1, n); 100 * ones(1, n)];
            load schwefel_102_data
            A = []; M = []; a = []; alpha = []; b = [];

        case 3

            lu = [-100 * ones(1, n); 100 * ones(1, n)];
            load high_cond_elliptic_rot_data
            A = []; a = []; alpha = []; b = [];

            if n == 2, load elliptic_M_D2,
            elseif n == 10, load elliptic_M_D10,
            elseif n == 30, load elliptic_M_D30,
            elseif n == 50, load elliptic_M_D50,
            end

        case 4

            lu = [-100 * ones(1, n); 100 * ones(1, n)];
            load schwefel_102_data
            A = []; M = []; a = []; alpha = []; b = [];

        case 5

            lu = [-100 * ones(1,n); 100 * ones(1, n)];
            load schwefel_206_data
            M = []; a = []; alpha = []; b = [];

        case 6

            lu = [-100 * ones(1, n); 100 * ones(1, n)];
            load rosenbrock_func_data
            A = []; M = []; a = []; alpha = []; b = [];

        case 7

            lu = [0 * ones(1, n); 600 * ones(1, n)];
            load griewank_func_data
            A = []; a = []; alpha = []; b = [];

            c = 3;
            if n == 2, load griewank_M_D2,
            elseif n == 10, load griewank_M_D10,
            elseif n == 30, load griewank_M_D30,
            elseif n == 50, load griewank_M_D50,
            end

        case 8

            lu = [-32 * ones(1, n); 32 * ones(1, n)];
            load ackley_func_data
            A = []; a = []; alpha = []; b = [];

            if n == 2, load ackley_M_D2,
            elseif n == 10, load ackley_M_D10,
            elseif n == 30, load ackley_M_D30,
            elseif n == 50, load ackley_M_D50,
            end

        case 9

            lu = [-5 * ones(1, n); 5 * ones(1, n)];
            load rastrigin_func_data
            A = []; M = []; a = []; alpha = []; b = [];

        case 10

            lu = [-5 * ones(1, n); 5 * ones(1, n)];
            load rastrigin_func_data
            A = []; a = []; alpha = []; b = [];
            if n == 2, load rastrigin_M_D2,
            elseif n == 10, load rastrigin_M_D10,
            elseif n == 30, load rastrigin_M_D30,
            elseif n == 50, load rastrigin_M_D50,
            end

        case 11

            lu = [-0.5 * ones(1, n); 0.5 * ones(1, n)];
            load weierstrass_data
            A = []; a = []; alpha = []; b = [];
            if n == 2, load weierstrass_M_D2,
            elseif n == 10, load weierstrass_M_D10,
            elseif n == 30, load weierstrass_M_D30,
            elseif n == 50, load weierstrass_M_D50,
            end

        case 12

            lu = [-pi * ones(1, n); pi * ones(1, n)];
            load schwefel_213_data
            A = []; M = []; o = [];

        case 13

            lu = [-3 * ones(1, n); 1 * ones(1, n)];
            load EF8F2_func_data
            A = []; M = []; a = []; alpha = []; b = [];

        case 14

            lu = [-100 * ones(1, n); 100 * ones(1, n)];
            load E_ScafferF6_func_data
            if n == 2, load E_ScafferF6_M_D2,
            elseif n == 10, load E_ScafferF6_M_D10,
            elseif n == 30, load E_ScafferF6_M_D30,
            elseif n == 50, load E_ScafferF6_M_D50,
            end
            A = []; a = []; alpha = []; b = [];

        case 15

            lu = [-5 * ones(1, n); 5 * ones(1, n)];
            load hybrid_func1_data
            A = []; M = []; a = []; alpha = []; b = [];

        case 16

            lu = [-5 * ones(1,n); 5 * ones(1, n)];
            load hybrid_func1_data
            if n == 2, load hybrid_func1_M_D2,
            elseif n == 10, load hybrid_func1_M_D10,
            elseif n == 30, load hybrid_func1_M_D30,
            elseif n == 50, load hybrid_func1_M_D50,
            end
            A = []; a = []; alpha = []; b = [];

        case 17

            lu = [-5 * ones(1, n); 5 * ones(1, n)];
            load hybrid_func1_data
            if n == 2, load hybrid_func1_M_D2,
            elseif n == 10, load hybrid_func1_M_D10,
            elseif n == 30, load hybrid_func1_M_D30,
            elseif n == 50, load hybrid_func1_M_D50,
            end
            A = []; a = []; alpha = []; b = [];

        case 18

            lu = [-5 * ones(1, n); 5 * ones(1, n)];
            load hybrid_func2_data
            if n == 2, load hybrid_func2_M_D2,
            elseif n == 10, load hybrid_func2_M_D10,
            elseif n == 30, load hybrid_func2_M_D30,
            elseif n == 50, load hybrid_func2_M_D50,
            end
            A = []; a = []; alpha = []; b = [];

        case 19

            lu = [-5 * ones(1, n); 5 * ones(1, n)];
            load hybrid_func2_data
            if n == 2, load hybrid_func2_M_D2,
            elseif n == 10, load hybrid_func2_M_D10,
            elseif n == 30, load hybrid_func2_M_D30,
            elseif n == 50, load hybrid_func2_M_D50,
            end
            A = []; a = []; alpha = []; b = [];

        case 20

            lu = [-5 * ones(1, n); 5 * ones(1, n)];
            load hybrid_func2_data
            if n == 2, load hybrid_func2_M_D2,
            elseif n == 10, load hybrid_func2_M_D10,
            elseif n == 30, load hybrid_func2_M_D30,
            elseif n == 50, load hybrid_func2_M_D50,
            end
            A = []; a = []; alpha = []; b = [];

        case 21

            lu = [-5 * ones(1, n); 5 * ones(1, n)];
            load hybrid_func3_data
            if n == 2, load hybrid_func3_M_D2,
            elseif n == 10, load hybrid_func3_M_D10,
            elseif n == 30, load hybrid_func3_M_D30,
            elseif n == 50, load hybrid_func3_M_D50,
            end
            A = []; a = []; alpha = []; b = [];

        case 22

            lu = [-5 * ones(1, n); 5 * ones(1, n)];
            load hybrid_func3_data
            if n == 2, load hybrid_func3_HM_D2,
            elseif n == 10, load hybrid_func3_HM_D10,
            elseif n == 30, load hybrid_func3_HM_D30,
            elseif n == 50, load hybrid_func3_HM_D50,
            end
            A = []; a = []; alpha = []; b = [];

        case 23

            lu = [-5 * ones(1, n); 5 * ones(1, n)];
            load hybrid_func3_data
            if n == 2, load hybrid_func3_M_D2,
            elseif n == 10, load hybrid_func3_M_D10,
            elseif n == 30, load hybrid_func3_M_D30,
            elseif n == 50, load hybrid_func3_M_D50,
            end
            A = []; a = []; alpha = []; b = [];

        case 24

            lu = [-5 * ones(1, n); 5 * ones(1, n)];
            load hybrid_func4_data
            if n == 2, load hybrid_func4_M_D2,
            elseif n == 10, load hybrid_func4_M_D10,
            elseif n == 30, load hybrid_func4_M_D30,
            elseif n == 50, load hybrid_func4_M_D50,
            end
            A = []; a = []; alpha = []; b = [];

        case 25

            lu = [2 * ones(1, n); 5 * ones(1, n)];
            load hybrid_func4_data
            if n == 2, load hybrid_func4_M_D2,
            elseif n == 10, load hybrid_func4_M_D10,
            elseif n == 30, load hybrid_func4_M_D30,
            elseif n == 50, load hybrid_func4_M_D50,
            end
            A = []; a = []; alpha = []; b = [];

    end

    % Record the best results
    outcome = [];

    % Main body
    popsize = 10;

    time = 1;

    % The total number of runs
    totalTime = 1;
 
    while time <= totalTime

        rand('seed', sum(100*clock));
        % Initialize the main population
        p = repmat(lu(1, :), popsize, 1) + rand(popsize, n) .* (repmat(lu(2, :) - lu(1, :), popsize, 1));

        % Evaluate the objective function values
        fit = benchmark_func(p, problem, o, A, M, a, alpha, b);

        % record the best result found so far
        min_f = min(fit);
        sigma = repmat((lu(2,:)-lu(1,:))/popsize, popsize, 1);
        r = 0.99;
        flag = zeros(popsize,1);
        epoch = popsize;
        lambda = ones(popsize,1);
        lambda_sigma = 0.1;
        lambda_range = lambda_sigma;

        % Record the number of function evaluations (FES)
        FES = popsize;
        Gen = 0;

        
        while FES < n * 10000

            % generate a set of new trial individuals
            uSet = p + sigma .* randn(popsize,n);

            % check the boundary constraints
            xl = repmat(lu(1,:), popsize, 1);
            xu = repmat(lu(2,:), popsize, 1);

            pos = uSet < xl;
            uSet(pos) = 2 .* xl(pos) - uSet(pos);
            pos_=uSet(pos) > xu(pos);
            uSet(pos(pos_)) = xu(pos(pos_));

            pos = uSet > xu;
            uSet(pos) = 2 .* xu(pos) - uSet(pos);
            pos_=uSet(pos) < xl(pos);
            uSet(pos(pos_)) = xl(pos(pos_));

            % Evaluate the trial vectors
            fitSet = benchmark_func(uSet, problem, o, A, M, a, alpha, b);
            FES = FES + popsize;
            Gen = Gen + 1;
            disp(['the best result at the ' num2str(Gen) 'th iteration is ' num2str(min_f)]);

            % normalize fitness values
            min_f = min(min_f,min(fitSet));
            tempFit = fit - min_f;
            tempTrialFit = fitSet - min_f;
            normFit = tempFit ./ (tempFit + tempTrialFit);
            normTrialFit = tempTrialFit ./ (tempFit + tempTrialFit);

            % calculate the Bhattacharyya distance
            pCorr = 1e300*ones(popsize);
            trialCorr = 1e300*ones(popsize);

            for i = 1 : popsize
                for j = 1 : popsize
%                     if j ~= i
                    if j ~= i && sigma(j,1) * 10 < sigma(i,1)
                        % BD between the ith parent and the other parents
                        m1 = p(i,:) - p(j,:);
                        c1 = (sigma(i,:).^2 + sigma(j,:).^2)/2;
                        tempD = 0;
                        for k = 1 : n
                            tempD = tempD + log(c1(1,k))-0.5*(log(sigma(i,k).^2)+log(sigma(j,k).^2));
                        end
                        pCorr(i,j) = 1/8 * m1 * diag(1./c1) * m1' + 1/2 * tempD;
                        % BD between the ith offspring and the other parents
                        m2 = uSet(i,:) - p(j,:);
                        trialCorr(i,j) = 1/8 * m2 * diag(1./c1) * m2' + 1/2 * tempD;
                    end
                end
            end

            pMinCorr = min(pCorr,[],2);
            trialMinCorr = min(trialCorr,[],2);

            % normalize correlation values
            normCorr = pMinCorr ./ (pMinCorr + trialMinCorr);
            normTrialCorr = trialMinCorr ./ (pMinCorr + trialMinCorr);
            lambda = 1 + lambda_sigma.*randn(popsize,1);
            lambda_sigma = lambda_range - lambda_range*Gen/(n*10000/popsize);
            pos = (lambda.*normTrialCorr>normTrialFit);
            p(pos,:) = uSet(pos,:);
            fit(pos) = fitSet(pos);
            flag(pos) = flag(pos) + 1;
            % i/5 successful rule
            if mod(Gen, epoch) == 0
                for i = 1 : popsize
                    if flag(i)/epoch > 0.2
                        sigma(i,:) = sigma(i,:) ./ r;
                    elseif flag(i)/epoch < 0.2
                        sigma(i,:) = sigma(i,:) .* r;
                    end
                end
                flag = zeros(popsize,1);
            end
        end

        outcome = [outcome min_f];
        time = time + 1;
    end
    disp(['the ' num2str(problem) 'th problem result is:']);
    disp(['the sorted results are ' num2str(sort(outcome))]);
    disp(['the mean result is: ' num2str(mean(outcome)) ' and the std is ' num2str(std(outcome))]);
end
toc;
