# Xiao06_color_transfer
This is an open-source implementation of Xiao's image colour transfer algorithm published in 2006. MATLAB/Octave code is provided.


Copyright 2015 Han Gong gong@fedoraproject.org, University of East Anglia


Reference

Xiao, Xuezhong, and Lizhuang Ma. "Color transfer in correlated color space." In Proceedings of the 2006 ACM international conference on Virtual reality continuum and its applications, pp. 305-309. ACM, 2006.

MATLAB/Octave Code: see m/demo.m for demonstration.

Results:

![Demo of Colour Transfer](http://cs.bath.ac.uk/~hg299/cf_Xiao06.png)
#
A further alternative implementation is provided under the directory *m_ruggedisation_update* in response to Issue #1.

This incorporates additional code written and devised by T E Johnson. It enables an improved output image for input image pairs where the original processing method gave an unsatisfactory output. Note that as Johnson's alternative implementation is different from Xiao's paper, the improved 'ruggedisation' code should not be used for result comparisons if you are citing Xiao's paper.

![Demo of Colour Transfer Processing with Ruggedisation](m_ruggedisation_update/Output.jpg?raw=true)
