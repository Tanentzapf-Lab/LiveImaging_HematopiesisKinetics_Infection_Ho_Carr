function [minx, maxx, miny, maxy] = rangeSelect(select)
    [selectx, selecty]=size(select);

    minx = -1;
    maxx = -1;
    miny = -1;
    maxy = -1;

    for i = 1: selectx
        for j = 1: selecty
            if (select(i,j) == 1 && miny == -1)
                miny = i;
            end
            if (select(i, j) == 1 && miny ~= -1)
            	maxy = i;
            end
        end
    end

    for m = 1: selecty
        for k = 1: selectx
            if (select(k,m) == 1 && minx == -1)
        		minx = m;
            end
            if (select(k, m) == 1 && minx ~= -1)
        		maxx = m;
            end
        end
    end
    
end

