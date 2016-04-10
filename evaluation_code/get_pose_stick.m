
function stick = get_pose_stick(pose)

vec = [1,2];

% Torso
points(:,1) = [pose(1,vec)';
               pose(2,vec)'];

% right-upper-arm           
points(:,2) = [pose(3,vec)';
               pose(5,vec)'];

% left-upper-arm
points(:,3) = [pose(4,vec)';
               pose(6,vec)'];

% right-fore-arm
points(:,4) = [pose(5,vec)';
               pose(7,vec)'];

% left-fore-arm
points(:,5) = [pose(6,vec)';
               pose(8,vec)'];

% Head
points(:,6) = [pose(11,vec)';
               pose(12,vec)'];

% uncomment following lines to include the hand parts
% % right-hand
% points(:,7) = [pose(7,vec)';
%                pose(9,vec)'];

% % left-hand
% points(:,8) = [pose(8,vec)';
%                pose(10,vec)'];

% --------------------------------------           
stick = points;
% --------------------------------------           


