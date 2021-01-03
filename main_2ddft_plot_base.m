Img_M = 20;     % 设置图像大小
Img_N = 20;
[nx,ny] = ndgrid([0:Img_M-1]-(Img_M-1)/2,[0:Img_N-1]-(Img_N-1)/2 ); % 计算x、y可能取值
figure,
set(gcf,'position',[100,100,1500*0.6,520*0.6]);
skip = 1;
for u = [0:skip:Img_M-1]
  for v = [0:skip:Img_N-1]
    subplot(1,2,1)
    b = zeros(Img_M,Img_N);
    b(u+1,v+1)=1;
    imagesc(b);colormap gray;
    xlabel('u');ylabel('v');
    title(['u=',num2str(u),',','v=',num2str(v)])
    subplot(1,2,2)
    imagesc(real(exp(-i*2*3.1416*(u*nx/Img_M+v*ny/Img_N))));colormap gray;
    xlabel('x');ylabel('y');
    pause(0.1)
  end
end