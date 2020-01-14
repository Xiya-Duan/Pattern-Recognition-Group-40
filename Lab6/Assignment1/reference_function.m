function [reference_value] = reference_function(feature_vector,k,d)
reference_value=quantization_error(feature_vector,1)*k.^(-2/d);
end

