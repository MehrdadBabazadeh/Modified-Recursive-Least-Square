function ModelInitFcn()
    % Get the current model's name
    modelName = bdroot;

    % Define the block name pattern to search for
    block_name_pattern = 'Mod_RLS.*'; % Regular expression for blocks like Mod_RLS, Mod_RLS_V, Mod_RLS_T

    % Use find_system to locate blocks matching the pattern
    block_handle1 = find_system(modelName, ...
                                'SearchDepth', 2, ... % Increase depth as needed
                                'RegExp', 'on', ...  % Enable regular expressions
                                'Name', block_name_pattern);

    % Check if blocks were found
    if ~isempty(block_handle1)
        % Iterate through all matching blocks
        for i = 1:length(block_handle1)
            % Get the block handle
            block_handle = get_param(block_handle1{i}, 'Handle');
            
            % Example: Print the block path and handle
            disp(['Block found: ', block_handle1{i}, ' with handle: ', num2str(block_handle)]);
            
            % Example operation: Modify a parameter
            % set_param(block_handle, 'Parameter1', 'new_value'); % Uncomment to use
        end
    else
        % Handle case where no blocks are found
        warning('No blocks found matching pattern: %s', block_name_pattern);
    end
end
%%
% function ModelInitFcn()
%     % Get the current model's name
%     modelName = bdroot;
% 
%     % ... rest of your code ...
%     % For example, to find a block named 'Mod_RLS':
%     block_name_pattern = '*Mod_RLS*';
%     block_handle1 = find_system(modelName, 'SearchDepth', 1, 'Name', block_name_pattern);
% 
%     % Assuming a unique match, extract the handle
%     if ~isempty(block_handle1)
%         block_handle = block_handle1{3};
%         % Now you can use the block handle to modify parameters, etc.
%         set_param(block_handle, 'Parameter1', 'new_value');
%     else
%         warning('Block not found: %s', block_name_pattern);
%     end
% end