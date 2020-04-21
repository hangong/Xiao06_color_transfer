function [U_t,A_t] = MatchColumns(us,ut,at)
% Ensures consistency between the target & source image rotation matrices.

% This routine matches columns in the target image rotation matrix to those
% in the source image rotation matrix.

% Each rotation matrix is derived by undertaking a singular value
% decomposition of the respective cross covariance matrices. The
% outcome of the decomposition is ordered within the rotation matrix in 
% the order of the descending singular values.  This often leads to 
% compatible rotation matrices but that is not guaranteed.  Sometimes the 
% colour ordering of one rotation matrix may be different from the other.
%
% Additionally even when the matrices do correspond in orientation, they
% need not correspond in direction. The direction axis rotation in one
% matrix may be the negative of the rotation in the other.

% Rotations of the individual colour axes are given by the columns of the
% rotation matrices.  In the following processing, all rearrangements are 
% considered of the columns in the target rotation matrix 'ut', to find 
% the arrangement that best matches the source rotation matrix 'us'. 
% Matching is measured by taking the vector dot products of the 
% corresponding matrix columns and finding the arrangement with the 
% largest sum of absolute dot product values.  Absolute values are used 
% to accommodate axis pairs that have similar orientations but different 
% directions.
%
% Once the best match has been found this is taken as the correct target
% image rotation matrix.  Columns are negated where the vector cross
% product has a negative value, to ensure direction compatibility.  The 
% singular value matrix for the target image is reordered to match the 
% reordering of the rotation matrix.
%
% This processing method and routine copyright Dr T E Johnson 2020.
% terence.johnson@gmail.com

% All 6 permutations of the three columns need to be addressed.
perm = perms([1 2 3]);
     
max=0.0;

for i=1:6
    % Compute the sum of the absolute dot products for the matrix columns. 
    sum=abs(ut(:,perm(i,1)).'*us(:,1)) + ...
        abs(ut(:,perm(i,2)).'*us(:,2)) + ...
        abs(ut(:,perm(i,3)).'*us(:,3)) ;

    if(sum>max)
        % Best aligned axes give the biggest sum.
        max=sum;
        bestperm=i;
    end
end
    % Now recover the best permutation and implement it.
    b1=perm(bestperm,1);
    b2=perm(bestperm,2);
    b3=perm(bestperm,3);
 
    % Set the rotation matrix columns to the new order, changing the 
    % direction of rotations if necessary by negating column values.
    U_t(:,1)=ut(:,b1)*sign(ut(:,b1).'*us(:,1));
    U_t(:,2)=ut(:,b2)*sign(ut(:,b2).'*us(:,2));
    U_t(:,3)=ut(:,b3)*sign(ut(:,b3).'*us(:,3));    
    
    % Similarly reorder the singular values.
    A_t(1,1)=at(b1,b1);
    A_t(2,2)=at(b2,b2);
    A_t(3,3)=at(b3,b3);     
end


