velocidad = input('Velocidad: ');
diametro = input('Diámetro: ');
viscosidad = input('Viscosidad: ');

Re = (velocidad*diametro)/(viscosidad);
if Re<2100
    disp('Flujo Turbulento');
elseif Re >= 2100 && Re <= 3000
    disp('Flujo transitorio');
else
    disp('Flujo turbulento');
end