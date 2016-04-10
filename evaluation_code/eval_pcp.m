% PCP evaluation through Euclidean distance calculation between endpoints
% of part sticks
function [PCP, pcp_part_vec] = eval_pcp(test_stick, gt_stick, alpha)

num_of_cp = 0;
% iterate over all parts (columns of the stickmen.coor matrix)

numparts = size(gt_stick, 2);
pcp_part_vec = zeros(1,numparts);

for j = 1:length(pcp_part_vec)
    
    % Ground Truth value of the part length
    part_length = sqrt( ( gt_stick(1,j) - gt_stick(3,j) )^2 + ( gt_stick(2,j) - gt_stick(4,j) )^2 );
    
    radius_of_precision = alpha*part_length;
    
    dist1 = sqrt( ( test_stick(1,j) - gt_stick(1,j) )^2 + ( test_stick(2,j) - gt_stick(2,j) )^2 );
    dist2 = sqrt( ( test_stick(3,j) - gt_stick(3,j) )^2 + ( test_stick(4,j) - gt_stick(4,j) )^2 );

    if ( (dist1 <= radius_of_precision) && (dist2 <= radius_of_precision) )
    
        num_of_cp = num_of_cp + 1;
        pcp_part_vec(j) = 1;
        
    end
    
end

PCP = num_of_cp / numparts;




