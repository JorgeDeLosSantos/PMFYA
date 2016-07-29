classdef List < handle
    % List class
    
    properties
        elements = {}; % empty cell
    end
    
    methods
        function obj = List(varargin)
            for arg=1:length(varargin)
                obj.add(varargin{arg});
            end
        end
        
        function add(obj,elm)
            obj.elements = [obj.elements, elm];
        end
        
        function el = get(obj,idx)
            disp(obj.elements);
            try
                el = obj.elements(idx);
            catch %#ok
                el = []; % empty array
            end
        end
        
        function disp(obj)
            fprintf('uimoon.utils.List\n');
%             disp(obj.elements);
        end
    end
end

