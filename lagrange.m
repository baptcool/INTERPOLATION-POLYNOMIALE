%MILLOT DUCHANGE
%lagrande 

%lagrange([-2,-1,1,2], [10,4,6,3], (-3:0.1:3))

%w is [-2,-1,1,2]
%abs is abs=[10,4,6,3]
%x is the interval x = (-10:0.1:10);
function[] = lagrange(w,abs,x)
  %w=[-2,-1,1,2]
  %abs=[10,4,6,3]
	%x = (-3:0.1:3);
	y1 = zeros(length(x));

	for i=(1:length(x))
	  y1(i) = calcul(x(i),w,abs);  %calcule des points de l'interpolation
	end
	plot(x,y1) %plot 
end


function[l] = lP(x,j,w) %calcule d'un Li pour un x donné, avec j et w les points donnés
  l=1
  
  for i = 1:length(w)
    if(i != j)
         tempo = ((x- w(i))/(w(j)- w(i)) ) %la formule de calcule de Li
         l *= tempo
     endif
  endfor
end


function[p] =calcul(x,w,abs)
    p=0
  for i = 1:length(w)
      p += abs(i) * lP(x,i,w) %on lance le calcul de p(x) , c'est a dire une somme des yi * li  .   On calcule les li pour chaque points, ce qui est extremenent lourd, on aurait pu donc les enregistrés une bonne fois pour toute.
  endfor
end