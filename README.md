# Underwater Image Enhancement (L\*a\*b\* Based Method)

##  Project Description
This project enhances underwater images using a color–space–based technique implemented in MATLAB. The algorithm corrects color distortions, restores suppressed red tones, and improves contrast by processing the image in the **CIE L\*a\*b\*** color space. A histogram comparison is also generated to visualize improvement in color distribution.

---

##  Summary
Underwater images often appear bluish/greenish due to loss of red wavelengths and reduced visibility.  
This project enhances the image using:

1. **RGB → L\*a\*b\*** conversion  
2. **CLAHE enhancement of the L-channel**  
3. **Chrominance correction on a and b channels**  
4. **Reconstruction using lab2rgb**  
5. **Histogram comparison on R/G/B channels**

The method is simple, fast, and produces significantly improved visibility and color balance.

---

##  Course Concepts Used
- RGB to L\*a\*b\* Conversion  
- Adaptive Histogram Equalization (CLAHE)  
- Normalization and Contrast Stretching  
- Image Reconstruction  
- Histogram Analysis  

---

##  Additional Concepts Used
- Chrominance–Luminance Separation  
- Pixel Intensity Remapping  
- Logarithmic Histogram Visualization  

---

##  Dataset
Input underwater images are stored in the **data/** folder.

Users may add:
- Real underwater photos  
- UIEB / EUVP underwater datasets  
- Any `.png` or `.jpg` image  

Example used in script:
image_filename = '467_img_.png';


---

##  How to Run the Code

1. Place input images inside:

data/


2. Run the MATLAB script:

underwater_enhancement.m


3. The script will display:
- Original vs Enhanced image  
- Histogram comparison (R/G/B channels)

4. Save enhanced images into:


3. The script will display:
- Original vs Enhanced image  
- Histogram comparison (R/G/B channels)

4. Save enhanced images into:


---

##  Output Description

### **1. Image Comparison**
- **Left:** Original underwater image  
- **Right:** Enhanced image using L\*a\*b\* correction  

### **2. Histogram Comparison**
- Shows R, G, B histograms  
- Logarithmic scale highlights improved color spread  
- Demonstrates recovery of red tones and contrast

### **Enhancement Results**
- Improved luminance  
- Better contrast  
- Balanced color tones  
- Reduced blue/green dominance  

---
### **Final Output**
![alt text](<WhatsApp Image 2025-11-16 at 19.37.45_a3012f94.jpg>)

---

## Contributors
| Name | SRN |
|------|-----|
| Bhavanesh A Mali Patil | PES1UG323EC070 |
| Ayush M  | PES1UG323EC068 |
| Chirag M K| PES1UG323EC080 |

---

##  References
- MATLAB Functions: `rgb2lab`, `lab2rgb`, `adapthisteq`, `imadjust`, `stretchlim`, `imhist`  
- Gonzalez & Woods, *Digital Image Processing*, 4th Edition  

---

##  Limitations
- Severely degraded images may not fully recover  
- No haze or scattering compensation  
- Can produce mild color shifts for extreme cases  

---

##  Future Improvements
- Underwater dehazing methods  
- Multi-level Retinex enhancement  
- Automated output saving  
- Quality metrics (UIQM, SSIM, PSNR)  
- Multi-stage enhancement pipeline  

