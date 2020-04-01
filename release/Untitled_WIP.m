close all;
clear all;
% frames = 157;
vid=double(imread('004s.tif'));
% [im1,map] = frame2im(vid(1));

% triggerconfig(vid,'manual');
% set(vid,'ReturnedColorSpace','rgb' );
% start(vid);
% scrsz = get(0,'ScreenSize');
% fig = figure('CloseRequestFcn',{@my_closereq,vid},'Position',scrsz);


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