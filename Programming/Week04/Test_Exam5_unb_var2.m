A = randi( [ -2, 2 ], 4, 4 )
x = randi( [ -2, 2 ], 4, 1 )
y = randi( [ -2, 2 ], 4, 1 )

Asymm = tril( A ) + tril( A, -1 )';

if ( isequal( matvec_unb_var2( A, x, y ), Asymm * x + y ) )
    disp( 'matvec_unb_var2 appears to be correct' )
else
    disp( 'matvec_unb_var2 has a problem' )
end

