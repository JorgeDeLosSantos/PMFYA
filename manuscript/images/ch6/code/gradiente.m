function n = gradiente(f)
n=[diff(f,sym('x'));diff(f,sym('y'));diff(f,sym('z'))];
end