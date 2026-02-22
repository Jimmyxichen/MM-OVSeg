<div align="center">
<h1 align="center">MM-OVSeg: Optical–SAR Fusion for Open-Vocabulary Segmentation in Remote Sensing</h1>

<h3>✨CVPR 2026✨</h3>

[Yimin Wei](https://www.researchgate.net/profile/Yimin-Wei-9)<sup>1,2†</sup>, [Aoran Xiao](https://scholar.google.com/citations?hl=ja&user=yGKsEpAAAAAJ)<sup>2†</sup>, [Hongruixuan Chen](https://scholar.google.ch/citations?user=XOk4Cf0AAAAJ&hl=zh-CN&oi=ao)<sup>1,2</sup>, [Junshi Xia](https://scholar.google.com/citations?user=n1aKdTkAAAAJ&hl=en)<sup>2</sup>, [Naoto Yokoya](https://scholar.google.co.jp/citations?user=DJ2KOn8AAAAJ&hl=en)<sup>1,2 *</sup>

<sup>1</sup> The University of Tokyo, <sup>2</sup> RIKEN AIP

<sup>†</sup> Equal contribution, <sup>*</sup> Corresponding author


</div>

## 🛎️News
* **` Notice☀️☀️`**: MM-OVSeg has been accepted by the CVPR 2026 conference on February 21, 2026!! Related data and benchmark suites will be released soon!

## Abstract
> *Open-vocabulary segmentation enables pixel-level recognition from an open set of textual categories, allowing generalization beyond fixed classes. Despite great potential in remote sensing, progress in this area remains largely limited to clear-sky optical data and struggles under cloudy or haze-contaminated conditions. We present MM-OVSeg, a multimodal Optical–SAR fusion framework for resilient open-vocabulary segmentation under adverse weather conditions. MM-OVSeg leverages the complementary strengths of the two modalities—optical imagery provides rich spectral semantics, while synthetic aperture radar (SAR) offers cloud-penetrating structural cues. To address the cross-modal domain gap and the limited dense prediction capability of current vision–language models, we propose two key designs: a cross-modal unification process for multi-sensor representation alignment, and a dual-encoder fusion module that integrates hierarchical features from multiple vision foundation models for text-aligned multimodal segmentation. Extensive experiments demonstrate that MM-OVSeg achieves superior robustness and generalization across diverse cloud conditions.*

## Dependencies and Installation


```
# 1. git clone this repository
git clone https://github.com/Jimmyxichen/MM-OVSeg.git
cd MM-OVSeg

# 2. create new anaconda env
conda create -n MMOVSeg python=3.8
conda activate MMOVSeg

# 3. install torch and dependencies
conda install pytorch==2.3.0 torchvision==0.18.0 torchaudio==2.3.0 pytorch-cuda=11.8 -c pytorch -c nvidia
pip install -r requirements.txt
# The dependent versions are not strict, and in general you only need to pay attention to detectron2.
```

## Datasets
We include the following multimodal RS dataset configurations under diverse weather and domain conditions in this repo:
1) `clear-sky weather`: PIE-RGB-SAR-clean
2) `real cloudy weather`: PIE-RGB-SAR-cloud
3) `synthetic cloud cover with varying opacity (thin vs. thick)`: DDHR-SK (Pohang, South Korea, thick cloud), OpenEarthMap-SAR (OEM-thin & OEM-thick)
4) `cross-domain generalization`: DDHR-CH (Xi’an, China, thick cloud)

We provide aboved processed datasets for your convenience. Download them from here.

## 🤝Acknowledgments
The authors would also like to give special thanks to [GSNet](https://github.com/yecy749/gsnet) and [SegEarth-OV](https://github.com/likyoo/SegEarth-OV).

## 🙋Q & A
***For any questions, please feel free to leave it in the [issue section](https://github.com/Jimmyxichen/MM-OVSeg/issues) or [contact us.](2364356729@qq.com)***

