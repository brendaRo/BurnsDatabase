function DO = PrincipalComponentAnalysis(DI)
    X = DI - mean(DI')';
    
    COV = X * X';
    
    [Vec, val] = eig(COV);
    
    DO = Vec;
end