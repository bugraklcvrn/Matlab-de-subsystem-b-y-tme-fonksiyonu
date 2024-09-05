function bigger(blockName) 
    % blockName: Büyütülecek Simulink bloğunun adı.
    
    % Bloğun mevcut pozisyonunu al
    blockPosition = get_param(blockName, 'Position');
    
    % Pozisyon vektörünü [left top right bottom] olarak ayarlayın
    left = blockPosition(1);
    top = - blockPosition(2);
    right = blockPosition(3);
    bottom = - blockPosition(4);
    
    % Genişlik ve yüksekliği hesapla
    width = right - left;
    height = top - bottom;

    % Blokun input ve output port sayısını al
    inPorts = get_param(blockName, 'Ports');
    numInPorts = inPorts(1);
    numOutPorts = inPorts(2);
        
    % İnput ve output sayısına göre yeni genişlik ve yükseklik ayarları
    if ((numInPorts>5)||(numOutPorts>5)) && ((numInPorts<11)&&(numOutPorts<11))
        newWidth = 1.1 * width;
        newHeight = 1.1 * height;
    elseif (numInPorts>10) || (numOutPorts>10)
        if numInPorts >= numOutPorts
            newWidth = (1+(0.02 * numInPorts)) * width;
            newHeight = 0.1 * numInPorts * height;
        else
            newWidth = (1+(0.02 * numOutPorts)) * width;
            newHeight = 0.1 * numOutPorts * height;
        end
    else
        newWidth = width;
        newHeight = height;
    end
            
    % Yeni pozisyonu hesapla
    newRight = left + newWidth;
    newBottom = top - newHeight;
    
    % Yeni pozisyonu ayarla
    newPosition = [left, - top, newRight, - newBottom];
    set_param(blockName, 'Position', newPosition);
    
    fprintf('inputsayısı: %i\n', numInPorts)
    fprintf('outputsayısı: %i\n', numOutPorts)

end
