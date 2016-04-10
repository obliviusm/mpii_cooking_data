# -----------------------------------------
Pose Challenge contains,
* train and test datasets used in [1] for evaluation of different pose-estimation approaches.
* evaluation code to compute the PCP values (compute_pcp.m is the main file).

The ground-truth poses for train and test datasets are provided as .mat files in 
'train_data/gt_poses/' and 'test_data/gt_poses/' directories, respectively.
Also, our results (FPS model) from [1], are provided in 'test_data/test_poses/' directory.

NOTE: For association of the 'test_data' in our poseChallenge to the complete MPII-Cooking dataset,
the pose files are given as, pose_<index>_<subject>_<imgidx>.jpg
and the images are given as,  img_<index>_<subject>_<imgidx>.mat

<index> is just the index of the image in this dataset.
<imgidx> is the actual image index from the complete dataset (for association).
<subject> is the subject name.

Each pose file contains the location of 10 parts (torso and head each consists of two points),

     pose(1,:) -> torso upper point
     pose(2,:) -> torso lower point
     pose(3,:) -> right shoulder
     pose(4,:) -> left shoulder
     pose(5,:) -> right elbow
     pose(6,:) -> left elbow
     pose(7,:) -> right wrist
     pose(8,:) -> left wrist     
     pose(9,:) -> right hand
     pose(10,:)-> left hand
     pose(11,:)-> head upper point
     pose(12,:)-> head lower point


[1] A Database for Fine Grained Activity Detection of Cooking Activities, M. Rohrbach, S. Amin, M. Andriluka and B. Schiele, 
    2012 IEEE Conference on Computer Vision and Pattern Recognition (CVPR), June, Providence, United States, (2012)

# -----------------------------------------








