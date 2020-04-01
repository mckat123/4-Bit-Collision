%
% Purpose : Find distinct points of the Pupils, Nostrils and Mouth in
% images taken from a video stream to get the Pupils' position in relation
% to the fixed position of Mouth and Nose
%
% A video input adaptor (webcam) has to be connected to the computer in
% order to run this program
%
% Author : Peter Aldrian, Uwe Meier, Andre Pura
% Date : August 12, 2009
% Version : 1.0
% -------------------------------------------------------------------------
% (c) 2009, Meier, University of Leoben, Leoben, Austria
% email: aldrian.peter@gmail.com uwemei@gmail.com andre.pura@gmail.com
% -------------------------------------------------------------------------

close all;
clear all;

% set length of video stream (if set to 'inf' stop video by closing figure
frames = 100

% starting routine for video input
% Image Acquisition Toolbox has to be installed
vid=videoinput('winvideo',1,getResolution());
triggerconfig(vid,'manual');
set(vid,'ReturnedColorSpace','rgb' );
start(vid);

% start figure; for display purpose only
scrsz = get(0,'ScreenSize');
fig = figure('CloseRequestFcn',{@my_closereq,vid},'Position',scrsz);


for jjj = 1 : frames
    
    %     get snapshot from video device
    snapshot = getsnapshot(vid);
    
    % delete this two lines after downloading the
    % haarcascade_frontalface_alt2.xml -File
    disp('Because of license restrictions you have to download the file "haarcascade_frontalface_alt2.xml" on your own.');
    disp('Just google it or download it at http://www.mathworks.de/matlabcentral/fileexchange/19912.');
    
    
    
    %     main routine to detect distinct points for the eyes, nose and mouth
    [T] = getPoints(snapshot);
    
    %     displaying snapshot and found points; for display purpose only
    if T~=-1
        
        imshow(snapshot,'InitialMagnification','fit');
        hold on;
        
        for i=1:2:9
            plot(T(i),T(i+1),'ro');
            plot(T(i),T(i+1),'gx');
        end
    else
        imshow(snapshot);
    end
    
    %     pause needed, so matlab can draw figures;for display purpose only
    pause(0.05);
    hold off;
end

% stops video input
stop(vid);



