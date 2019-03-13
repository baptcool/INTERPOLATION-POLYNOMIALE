
%poly de newton

%newton([-2,-1,1,2], [10,4,6,3], (-3:0.1:3))

function[] = newton(x,y,interval)
  %x = [-2,-1,1,2]
  %y = [10,4,6,3]
  %interval = (-3:0.01:3)


 
	y1 = zeros(length(interval));
   for i = 1: length(x)
        a(i) = f(x,y,1,i)
   endfor
	for i=(1:length(interval))
	  y1(i) = calcul(x,y,interval(i),a); % on lance les calculs des y(x)
	end
	plot(interval,y1) %plot 
  
end

function[p] = calcul(x,y,c,a) % c est la valeur de l'antécédent de y(x)
    
     p =0
      for i = 1: length(x)
        p += w(i,x,c)*a(i) % p(x) =  on fait la somme des Ai * Wi
      endfor 
endfunction

function[p] = w(i,x,c) %pour un i donné, x le tableau des points initiaux , et c la valeur donné
  p=1 
  if(i != 1)
    for  k = 1:(i-1)
      p *= (c - x(k)) % la formule pour calculer les Wi
     endfor
   endif
endfunction

function[p] = f(x,y,d,i) % calcule de Ai, récurcif
  if(d == (i-1) )  %condition  si d == i-1 , car les indices commencent à 1!
     p = (y(i)-y(i-1))/(x(i)-x(i-1))
  endif
  if (d==i) % autre condiiton d=1 et i=1 ou autre
    p = y(i)
  else
    p = (f(x,y,d+1,i)-f(x,y,d,i-1))/(x(i)-x(d)) %la formule
  endif
  
end


%conclusiion, le calcule du polynome de newton est bien moins lourd que lagrange ou les matrices de la base canonique





