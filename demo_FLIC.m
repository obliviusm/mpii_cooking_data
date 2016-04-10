%% display a random image
% i = randi(length(examples));
i = '000000';

imgdir = './train_data/images';
matdir = './train_data/gt_poses';
impath = strcat(imgdir,'/img_',i,'.jpg');
matpath= strcat(matdir,'/pose_',i,'.mat');
posestruct = load(matpath);
pose = posestruct.pose;


img = imread(impath);
cla, imagesc(img), axis image, hold on

% display torso detected by berkeley poselets
% plotbox(examples(i).torsobox,'w--')

% display all the labeled joints; median of 5 annotations by mechanical turk
dots = [pose(1,:).',pose(2,:).',pose(3,:).'];
myplot(dots,'go-','linewidth',3)
% myplot(examples(i).coords(:,lookupPart('rsho','relb','rwri')),'mo-','linewidth',3)
% myplot(examples(i).coords(:,lookupPart('rhip','lhip')),'bo-','linewidth',3)
% myplot(examples(i).coords(:,lookupPart('leye','reye','nose','leye')),'c.-','linewidth',3)