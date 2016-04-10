
function compute_pcp

alpha = [0.1:0.05:0.5];

euc_ps = zeros(length(alpha), 6);
final_euc_ps = zeros(length(alpha),1);

% ground-truth poses
gt_pose_dir = '../test_data/gt_poses/';

% estimated poses (here provide your results)
test_pose_dir = '../test_data/test_poses/';

gt_pose_files = dir([gt_pose_dir, 'pose*.mat']);
test_pose_files = dir([test_pose_dir, 'pose*.mat']);

assert(length(gt_pose_files) == length(gt_pose_files));
N = length(gt_pose_files);

for i = 1:N
	gt_pose_filename = [gt_pose_dir, gt_pose_files(i).name];
	gt_pose = load(gt_pose_filename);
	gt_stick{i} = get_pose_stick(gt_pose.pose);

	test_pose_filename = [test_pose_dir, test_pose_files(i).name];
	test_pose = load(test_pose_filename);
	test_stick{i} = get_pose_stick(test_pose.pose);
end

for alpha_idx = 1:length(alpha)

	PCP_euc_vec_ps = zeros(1,N);
	PCP_part_vec_euc_ps = [0,0,0, 0,0,0];

	for i = 1:N
    [PCP_euc_ps, pcp_part_vec] = eval_pcp(test_stick{i}, gt_stick{i}, alpha(alpha_idx));

    PCP_euc_vec_ps(i) = PCP_euc_ps;
    PCP_part_vec_euc_ps = PCP_part_vec_euc_ps + pcp_part_vec;
  end
  
	euc_ps(alpha_idx, :) = PCP_part_vec_euc_ps * 100 / N;
	final_euc_ps(alpha_idx) = 100*mean(PCP_euc_vec_ps);

	fprintf('----------------------------------------------\n');
	fprintf('alpha: %f\n', alpha(alpha_idx));
	fprintf(' --- TORSO --- HEAD --- R-ARM --- L-ARM --- R-FARM --- L-FARM --- All ---\n');
	fprintf('     %.1f   &  %.1f  &  %.1f   &  %.1f   &  %.1f   &   %.1f   &   %.3f\n', ...
	euc_ps(alpha_idx, 1),euc_ps(alpha_idx, 6),euc_ps(alpha_idx, 2),euc_ps(alpha_idx, 3),...
	euc_ps(alpha_idx, 4),euc_ps(alpha_idx, 5),final_euc_ps(alpha_idx));
	fprintf('----------------------------------------------\n');

end
% =========================================================================





