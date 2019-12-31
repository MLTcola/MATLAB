function F = fitness( x )
F=0;
for i=1:30
    F=F+x(i)^2+x(i)-6;%这个是目标函数方程式
end


end

