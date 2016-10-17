A = randi( [ -2, 2 ], 4, 4 )
x = randi( [ -2, 2 ], 4, 1 )
y = randi( [ -2, 2 ], 4, 1 )

Asymm = tril( A ) + tril( A, -1 )';

if ( isequal( matvec( A, x, y ), Asymm * x + y ) )
    disp( 'matvec appears to be correct' )
else
    disp( 'matvec has a problem' )
end
