function dynareOBC = SetDefaultOptions( dynareOBC )
    dynareOBC = SetDefaultOption( dynareOBC, 'Bypass', false );    
    dynareOBC = SetDefaultOption( dynareOBC, 'CalculateTheoreticalVariance', false );    
    dynareOBC = SetDefaultOption( dynareOBC, 'CubatureTolerance', 1e-6 );    
    dynareOBC = SetDefaultOption( dynareOBC, 'Estimation', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'EstimationDataFile', [ dynareOBC.BaseFileName '.xlsx' ] );
    dynareOBC = SetDefaultOption( dynareOBC, 'EstimationFixedPointMaxIterations', 100 );
    dynareOBC = SetDefaultOption( dynareOBC, 'FastCubature', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'FirstOrderAroundRSS1OrMean2', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'FirstOrderConditionalCovariance', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'FMinFunctor', @( OptiFunction, OptiX0, OptiLB, OptiUB, varargin ) fmincon( OptiFunction, OptiX0, [], [], [], [], OptiLB, OptiUB, [], optimset( 'algorithm', 'sqp', 'display', 'off', 'MaxFunEvals', Inf, 'MaxIter', Inf, 'TolX', sqrt( eps ), 'TolFun', sqrt( eps ), 'UseParallel', true, 'ObjectiveLimit', -Inf, varargin{:} ) ) );
    dynareOBC = SetDefaultOption( dynareOBC, 'FMinEstimateFunctor', @( OptiFunction, OptiX0, OptiLB, OptiUB, varargin ) fmincon( OptiFunction, OptiX0, [], [], [], [], OptiLB, OptiUB, [], optimset( 'algorithm', 'sqp', 'display', 'iter', 'MaxFunEvals', Inf, 'MaxIter', Inf, 'TolX', sqrt( eps ), 'TolFun', sqrt( eps ), 'UseParallel', true, 'ObjectiveLimit', -Inf, varargin{:} ) ) );
    % dynareOBC = SetDefaultOption( dynareOBC, 'FMinEstimateFunctor', @CMAESWrapper );   
    % dynareOBC = SetDefaultOption( dynareOBC, 'FSolveFunctor', @( OptiFunction, OptiX0, varargin ) fsolve( OptiFunction, OptiX0, optimset( 'algorithm', 'trust-region-dogleg', 'display', 'iter', 'MaxFunEvals', Inf, 'MaxIter', Inf, 'TolX', sqrt( eps ), 'TolFun', sqrt( eps ), varargin{:} ) ) );   
    dynareOBC = SetDefaultOption( dynareOBC, 'FSolveFunctor', @( OptiFunction, OptiX0, varargin ) lsqnonlin( OptiFunction, OptiX0, [], [], optimset( 'algorithm', 'trust-region-reflective', 'display', 'iter', 'MaxFunEvals', Inf, 'MaxIter', Inf, 'TolX', sqrt( eps ), 'TolFun', sqrt( eps ), varargin{:} ) ) );   
    dynareOBC = SetDefaultOption( dynareOBC, 'Global', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'IRFPeriods', 40 );
    dynareOBC = SetDefaultOption( dynareOBC, 'IRFsAroundZero', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'KappaPriorParameter', 1-eps );
    dynareOBC = SetDefaultOption( dynareOBC, 'LPSolver', '' );
    dynareOBC = SetDefaultOption( dynareOBC, 'MaxCubatureDegree', 3 );    
    dynareOBC = SetDefaultOption( dynareOBC, 'MaxCubatureDimension', 100 );
    dynareOBC = SetDefaultOption( dynareOBC, 'MILPSolver', '' );
    dynareOBC = SetDefaultOption( dynareOBC, 'MLVSimulationMode', 0 );    
    dynareOBC = SetDefaultOption( dynareOBC, 'MLVSimulationSamples', 2000 );
    dynareOBC = SetDefaultOption( dynareOBC, 'MLVSimulationCubatureDegree', 9 );  
    dynareOBC = SetDefaultOption( dynareOBC, 'NoCleanUp', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'NoCorr', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'NoCubature', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'NoDisplay', false );    
    dynareOBC = SetDefaultOption( dynareOBC, 'NoGraph', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'NoMoments', false );    
    dynareOBC = SetDefaultOption( dynareOBC, 'NoPTest', false );    
    dynareOBC = SetDefaultOption( dynareOBC, 'NoSparse', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'NoStatisticalCubature', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'Omega', 2-eps );
    dynareOBC = SetDefaultOption( dynareOBC, 'Order', 2 );
    dynareOBC = SetDefaultOption( dynareOBC, 'OrderOverride', 0 );
    dynareOBC = SetDefaultOption( dynareOBC, 'Replications', 50 );
    dynareOBC = SetDefaultOption( dynareOBC, 'Resume', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'SaveMacro', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'SaveMacroName', [ dynareOBC.BaseFileName '-macroexp.mod' ] );
    dynareOBC = SetDefaultOption( dynareOBC, 'ShockScale', 1-eps );
    dynareOBC = SetDefaultOption( dynareOBC, 'SimulationDrop', 100 );    
    dynareOBC = SetDefaultOption( dynareOBC, 'SimulationPeriods', 0 );
    dynareOBC = SetDefaultOption( dynareOBC, 'SlowIRFs', false );
    dynareOBC = SetDefaultOption( dynareOBC, 'TimeToSolveParametrically', 4 );
    dynareOBC = SetDefaultOption( dynareOBC, 'TimeToEscapeBounds', 8 );
    dynareOBC = SetDefaultOption( dynareOBC, 'TimeToReturnToSteadyState', 16 );
    dynareOBC = SetDefaultOption( dynareOBC, 'Tolerance', sqrt( eps ) );
    dynareOBC = SetDefaultOption( dynareOBC, 'IntegerTolerance', sqrt( sqrt( eps ) ) );
    
    dynareOBC = orderfields( dynareOBC );
end
