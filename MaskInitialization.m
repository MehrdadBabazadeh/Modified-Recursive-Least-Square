classdef MaskInitialization

    methods (Static)

        % Callback for the 'RateActive' checkbox
        function RateActive(callbackContext)
            % Retrieve the mask object from the block
            blockHandle = callbackContext.BlockHandle;
            maskObj = Simulink.Mask.get(blockHandle);

            % Get the value of the 'RateActive' checkbox
            isRateActive = maskObj.getParameter('RateActive').Value;

            % Enable or disable the 'Rate_Vec' parameter
            if strcmp(isRateActive, 'on')
                maskObj.getParameter('Rate_Vec').Enabled = 'on';
                %maskObj.getParameter('Rate_Vec').Value = '[-0.26  0.07 0.15]';                         
            else
                maskObj.getParameter('Rate_Vec').Enabled = 'off';                 
            end
        end
    end
end