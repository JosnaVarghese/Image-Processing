srcFiles = dir('Images_Temp\*.jpg');
for i = 1 : length(srcFiles)
    filename = strcat('Images_Temp\',srcFiles(i).name);
    I = imread(filename);
    imshow(I);
    
    I=rgb2gray(I);
    imwrite(I, strcat('Images\',srcFiles(i).name));
    J= imhist(I);
    
    [x, y]=kmeans(double(J(:)),4);

imseg= zeros(size(I,1),size(I,2));
for j= 1:max(x)
    imseg(x==j)=j;
end
imagesc(imseg)
%% creates binary masks for each cluster
I = mat2gray(imseg);

end