function X = cambiar_filas(M,fa,fb)
X = M;
X(fa,:) = M(fb,:);
X(fb,:) = M(fa,:);
end