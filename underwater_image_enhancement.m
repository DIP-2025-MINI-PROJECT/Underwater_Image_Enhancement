clear;
close all;
clc;
image_filename = '892_img_.png'; 

original_rgb = imread(image_filename);
enhanced_rgb = enhance_underwater_lab(im2double(original_rgb));

figure('Name', 'Underwater Image Enhancement', 'NumberTitle', 'off');
subplot(1, 2, 1);
imshow(original_rgb);
title('Original Image');
subplot(1, 2, 2);
imshow(enhanced_rgb);
title('Enhanced Image (L*a*b* Method)');

figure('Name', 'Histogram Comparison', 'NumberTitle', 'off');

subplot(2, 3, 1); imhist(original_rgb(:, :, 1)); title('Original - Red'); set(gca, 'YScale', 'log');
subplot(2, 3, 2); imhist(original_rgb(:, :, 2)); title('Original - Green'); set(gca, 'YScale', 'log');
subplot(2, 3, 3); imhist(original_rgb(:, :, 3)); title('Original - Blue'); set(gca, 'YScale', 'log');

subplot(2, 3, 4); imhist(enhanced_rgb(:, :, 1)); title('Enhanced - Red'); set(gca, 'YScale', 'log');
subplot(2, 3, 5); imhist(enhanced_rgb(:, :, 2)); title('Enhanced - Green'); set(gca, 'YScale', 'log');
subplot(2, 3, 6); imhist(enhanced_rgb(:, :, 3)); title('Enhanced - Blue'); set(gca, 'YScale', 'log');



function enhanced_img_rgb = enhance_underwater_lab(rgb_img)
   
    lab_img = rgb2lab(rgb_img);
    L = lab_img(:, :, 1);
    a = lab_img(:, :, 2);
    b = lab_img(:, :, 3);

    L_norm = L / 100;
    L_enhanced_norm = adapthisteq(L_norm, 'ClipLimit', 0.01, 'Distribution', 'uniform');
    L_enhanced = L_enhanced_norm * 100;

    a_min = min(a(:));
    a_max = max(a(:));
    a_norm = (a - a_min) / (a_max - a_min);
    a_adj_norm = imadjust(a_norm, stretchlim(a_norm, 0.01), []);
    a_enhanced = a_adj_norm * (a_max - a_min) + a_min;

    b_min = min(b(:));
    b_max = max(b(:));
    b_norm = (b - b_min) / (b_max - b_min);
    b_adj_norm = imadjust(b_norm, stretchlim(b_norm, 0.01), []);
    b_enhanced = b_adj_norm * (b_max - b_min) + b_min;

    lab_enhanced = cat(3, L_enhanced, a_enhanced, b_enhanced);
    enhanced_img_rgb = lab2rgb(lab_enhanced);
    
    enhanced_img_rgb(enhanced_img_rgb > 1) = 1;
    enhanced_img_rgb(enhanced_img_rgb < 0) = 0;
end