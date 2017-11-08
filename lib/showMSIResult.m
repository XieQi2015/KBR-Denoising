function showMSIResult(Re_msi,Omsi,minI,maxI,methodname,enList,band2show)
%% Use to show the video result of TC methods

numLine = ceil((length(enList)+2)/5);
% figure('units','normalized','position',[0.05,0.482-0.29*3/2,0.9,0.29*3],'name','video');
%% UI
close all;

figure('units','normalized','position',[0.05,0.482-0.29*numLine/2,0.9,0.29*numLine],'name','MSI');
sld = uicontrol('Style', 'slider',...
    'Min',1,'Max',31,'Value',band2show,...
    'Position', [220 20 500 20],...
    'Callback', @TheFram);
showShow(band2show)

    function showShow(band2show)
        txt = uicontrol('Style','text',...
            'Position',[220 45 500 20],...
            'String',['Showing the ', num2str(band2show) ,'th fram']);
        set(txt,'Fontsize',13)
        numLine = ceil((length(enList)+1)/5);

        subplot(numLine,5,1); imshow((Omsi(:,:,band2show)-minI)/(maxI-minI)),title( 'Clean');
        for i = 1:length(enList)
            subplot(numLine,5,i+1);
            imshow((Re_msi{enList(i)}(:,:,band2show)-minI)/(maxI-minI));title( methodname{enList(i)});
        end
    end


    function TheFram(source,callbackdata)
        band2show =  round(source.Value);
        showShow(band2show)
    end
end