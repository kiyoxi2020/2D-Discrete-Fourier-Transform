clear
close all
Img=double(imread('lena.jpg'));
Img=imresize(Img,[150,150]);
[Img_M, Img_N] = size(Img);
Output=zeros(Img_M,Img_N);
SumOutner = 0;
%% 2D Discrete Fourier Transform
[nx,ny]=ndgrid([0:Img_M-1],[0:Img_N-1]);
du=1;
for u = [0:Img_M-1]
 dv=1;
for v = [0:Img_N-1]
    SumOutner=sum(sum(Img.*exp(-1i*2*3.1416*(u*nx/Img_M+v*ny/Img_N))));
    Output(du,dv) = SumOutner;
    dv=dv+1;
end
du=du+1;
end
%% Calculate Spectrum and show
figure,set(gcf,'position',[100,100,1800*0.6,520*0.6]);
subplot(1,3,1)
imagesc(Img);colormap gray;title('原始图像')
subplot(1,3,2)
imagesc(log(abs(fftshift(Output))));colormap gray;title('Fourier变换后图像')
subplot(1,3,3)
imagesc(log(abs(fftshift(fft2(Img)))));colormap gray;title('Matlab自带函数变换后图像')