load_system( 'seminar3questions');

M = [];

for i = 0 : 1 : 180
    set_param( 'multiple_inverter/GD5', 'Phasedelay', num2str( i*0.01/180 ) );
    set_param( 'multiple_inverter/GD6', 'Phasedelay', num2str( 0.01+i*0.1/180 ) );
    set_param( 'multiple_inverter/GD7', 'Phasedelay', num2str( 150/180*0.01+i*0.01/180 ) );
    set_param( 'multiple_inverter/GD8', 'Phasedelay', num2str( 150/180*0.01+0.01+i*0.01/180 ) );
    sim( 'seminar3questions' );
    f1 = f1.signals.values( end );
    f3 = f3.signals.values( end );
    f5 = f5.signals.values( end );
    f6 = f6.signals.values( end );
    f7 = f7.signals.values( end );
    f9 = f9.signals.values( end );
    M = [ M ; f1 f3 f5 f6 f7 f9 ];
end