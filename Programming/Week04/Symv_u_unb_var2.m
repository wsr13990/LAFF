function [ Y_out ] = Symv_u_unb_var2( U, X, Y )

  [ UTL, UTR, ...
    UBL, UBR ] = FLA_Part_2x2( U, ...
                               0, 0, 'FLA_TL' );

  [ XT, ...
    XB ] = FLA_Part_2x1( X, ...
                         0, 'FLA_TOP' );

  [ YT, ...
    YB ] = FLA_Part_2x1( Y, ...
                         0, 'FLA_TOP' );

  while ( size( UTL, 1 ) < size( U, 1 ) )

    [ U00,  u01,       U02,  ...
      u10t, upsilon11, u12t, ...
      U20,  u21,       U22 ] = FLA_Repart_2x2_to_3x3( UTL, UTR, ...
                                                      UBL, UBR, ...
                                                      1, 1, 'FLA_BR' );

    [ X0, ...
      x1t, ...
      X2 ] = FLA_Repart_2x1_to_3x1( XT, ...
                                    XB, ...
                                    1, 'FLA_BOTTOM' );

    [ Y0, ...
      y1t, ...
      Y2 ] = FLA_Repart_2x1_to_3x1( YT, ...
                                    YB, ...
                                    1, 'FLA_BOTTOM' );

    %------------------------------------------------------------%

    Y0 = laff_axpy(x1t,u01,Y0);
    y1t = laff_axpy(x1t,upsilon11,y1t);
    Y2 = laff_axpy(x1t,u12t,Y2);

    %------------------------------------------------------------%

    [ UTL, UTR, ...
      UBL, UBR ] = FLA_Cont_with_3x3_to_2x2( U00,  u01,       U02,  ...
                                             u10t, upsilon11, u12t, ...
                                             U20,  u21,       U22, ...
                                             'FLA_TL' );

    [ XT, ...
      XB ] = FLA_Cont_with_3x1_to_2x1( X0, ...
                                       x1t, ...
                                       X2, ...
                                       'FLA_TOP' );

    [ YT, ...
      YB ] = FLA_Cont_with_3x1_to_2x1( Y0, ...
                                       y1t, ...
                                       Y2, ...
                                       'FLA_TOP' );

  end

  Y_out = [ YT
            YB ];

return


