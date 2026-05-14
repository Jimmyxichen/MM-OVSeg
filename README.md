<div align="center">
<h1 align="center">MM-OVSeg: Optical–SAR Fusion for Open-Vocabulary Segmentation in Remote Sensing</h1>

<h3>✨CVPR 2026✨</h3>

[Yimin Wei](https://www.researchgate.net/profile/Yimin-Wei-9)<sup>1,2*</sup>, [Aoran Xiao](https://scholar.google.com/citations?hl=ja&user=yGKsEpAAAAAJ)<sup>2*</sup>, [Hongruixuan Chen](https://scholar.google.ch/citations?user=XOk4Cf0AAAAJ&hl=zh-CN&oi=ao)<sup>1,2</sup>, [Junshi Xia](https://scholar.google.com/citations?user=n1aKdTkAAAAJ&hl=en)<sup>2</sup>, [Naoto Yokoya](https://scholar.google.co.jp/citations?user=DJ2KOn8AAAAJ&hl=en)<sup>1,2 †</sup>

<sup>1</sup> The University of Tokyo, <sup>2</sup> RIKEN AIP

<sup>*</sup> Equal contribution, <sup>†</sup> Corresponding author

[![arXiv paper](https://img.shields.io/badge/arXiv-paper-b31b1b.svg)](https://arxiv.org/abs/2603.17528)   [![HuggingFace Dataset](https://img.shields.io/badge/HuggingFace-Dataset-yellow)](https://huggingface.co/YiminJimmy/MM-OVSeg)


</div>

## 🛎️News
* **` Mar 20th, 2026`**: The [arXiv paper](https://arxiv.org/abs/2603.17528) of MM-OVSeg is now online. If you are interested in details of MM-OVSeg, do not hesitate to take a look!!
* **` Notice☀️☀️`**: MM-OVSeg has been accepted by the CVPR 2026 conference on February 21, 2026!! Related data and benchmark suites will be released soon!

## :fire:TODO
- [x] Release Datasets for CVPR version (Feb 22, 2026)
- [x] Release Train/Evaluation code for CVPR version (May 14, 2026)
- [x] Release pre-trained weights for CVPR version (May 14, 2026)

Note: Authors are occupied by other submissions now, the code and weights will be released before May 15th. Thank you for your understanding!

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

# Optional: install the latest version of PyTorch to use the DINO v3 model as backbone. In my case, the versions are PyTorch 2.5.0, Python 3.10, CUDA 12.6, and cuDNN 9.3.0, respectively.

# The dependent versions are not strict, and in general you only need to pay attention to pytorch and detectron2.
```

## Datasets
We include the following multimodal RS dataset configurations under diverse weather and domain conditions in this repo:
1) `clear-sky weather`: PIE-RGB-SAR-clean
2) `synthetic cloud cover with varying opacity (thin vs. thick vs. varied)`: PIE-RGB-SAR-cloud (varied cloud), DDHR-SK (varied cloud), OpenEarthMap-SAR (OEM-thin & OEM-thick)
3) `cross-domain generalization`: DDHR-CH (varied cloud)

We provide aboved processed datasets for your convenience. Please download the datasets and checkpoints from [HuggingFace](https://huggingface.co/YiminJimmy/MM-OVSeg/tree/main), and then make them have the following folder/file structure:
```
${ROOT}   # Root directory, for example: /yourpath/MM-OVSeg/
│
├── Dataset
│    ├── OEM   # OEM-thin & OEM-thick datasets
│    ├── PIE_RGBSAR   # PIE-RGB-SAR-cloud dataset
│    ├── DDSK  # DDHR-SK dataset
│    ├── DDCH  # DDHR-CH dataset
│         ...   
│   
└── checkpoint
     ├── B16_checkpoint.pth # Checkpoint for SAR DINOv1 (ViT-B/16)
     │
     └── L14_checkpoint.pth   # Checkpoint for SAR DINOv3 (ViT-L/14)
         ...
```

## Training and Evaluation

### Backbone switching
Please switch between different backbone models (DINOv3 or DINOv1) by modifying the configuration in mmov_seg/__init__.py.

If the user wants to use DINOv3 (ViT-L/14), please use: from .MMOVL14 import MMOV; and comment out or disable the following line: from .MMOV import MMOV.

If the user wants to use DINOv1 (ViT-B/16), please use: from .MMOV import MMOV; and comment out or disable the following line: from .MMOVL14 import MMOV.

```bash
#### mmov_seg/__init__.py file ####
#from .MMOV import MMOV   ### If you want to use DINO v1 (ViT-B/16)
from .MMOVL14 import MMOV   ### If you want to use DINO v3 (ViT-L/14)
```

### Path replacement
Please replace the paths in the following files with your own project paths:
1. mmov_seg/data/datasets/register_PIE_train.py; mmov_seg/data/datasets/register_DFC25thick_train.py; mmov_seg/data/datasets/register_DFC25thin_train.py; mmov_seg/data/datasets/register_DDSK_train.py;
2. mmov_seg/data/datasets/register_PIE_val.py; mmov_seg/data/datasets/register_DDSK_val.py; mmov_seg/data/datasets/register_DDCH_val.py; mmov_seg/data/datasets/register_DFC25thick_val.py; mmov_seg/data/datasets/register_DFC25thin_val.py;
3. mmov_seg/MMOV.py and mmov_seg/MMOVL14.py

### Training commands
We provide following commands for model training:

```bash
export DETECTRON2_DATASETS=/yourpath/MM-OVSeg/Dataset
#################### ViT-B/16 #########################################
#### PIEclean  ###
python /yourpath/MM-OVSeg/train_net.py --config /yourpath/MM-OVSeg/configs/vitb_384.yaml --num-gpus 1 --dist-url "auto" MODEL.SEM_SEG_HEAD.NUM_CLASSES 4 MODEL.SEM_SEG_HEAD.IGNORE_VALUE 255 TEST.EVAL_PERIOD 0 OUTPUT_DIR /yourpath/MM-OVSeg/output/ MODEL.SEM_SEG_HEAD.TRAIN_CLASS_JSON "/yourpath/MM-OVSeg/datasets/PIE4class.json" MODEL.SEM_SEG_HEAD.TEST_CLASS_JSON "/yourpath/MM-OVSeg/datasets/PIE.json" DATASETS.TEST \(\"PIE_valrgb_sem_seg\"\,\) 

#### PIEcloud ####
python /yourpath/MM-OVSeg/train_net.py --config /yourpath/MM-OVSeg/configs/vitb_384.yaml --num-gpus 1 --dist-url "auto" MODEL.SEM_SEG_HEAD.NUM_CLASSES 4 MODEL.SEM_SEG_HEAD.IGNORE_VALUE 255 TEST.EVAL_PERIOD 0 OUTPUT_DIR /yourpath/MM-OVSeg/output/ MODEL.SEM_SEG_HEAD.TRAIN_CLASS_JSON "/yourpath/MM-OVSeg/datasets/PIE4class.json" MODEL.SEM_SEG_HEAD.TEST_CLASS_JSON "/yourpath/MM-OVSeg/datasets/PIE.json" DATASETS.TEST \(\"PIE_val_sem_seg\"\,\) 

#### OEMthin ####
python /yourpath/MM-OVSeg/train_net.py --config /yourpath/MM-OVSeg/configs/vitb_384.yaml --num-gpus 1 --dist-url "auto" MODEL.SEM_SEG_HEAD.NUM_CLASSES 5 MODEL.SEM_SEG_HEAD.IGNORE_VALUE 255 TEST.EVAL_PERIOD 0 OUTPUT_DIR /yourpath/MM-OVSeg/output/ MODEL.SEM_SEG_HEAD.TRAIN_CLASS_JSON "/yourpath/MM-OVSeg/datasets/OEM5class.json" MODEL.SEM_SEG_HEAD.TEST_CLASS_JSON "/yourpath/MM-OVSeg/datasets/OEM.json" DATASETS.TEST \(\"OEMthin_val_sem_seg\"\,\) 

#### OEMthick ####
python /yourpath/MM-OVSeg/train_net.py --config /yourpath/MM-OVSeg/configs/vitb_384.yaml --num-gpus 1 --dist-url "auto" MODEL.SEM_SEG_HEAD.NUM_CLASSES 5 MODEL.SEM_SEG_HEAD.IGNORE_VALUE 255 TEST.EVAL_PERIOD 0 OUTPUT_DIR /yourpath/MM-OVSeg/output/ MODEL.SEM_SEG_HEAD.TRAIN_CLASS_JSON "/yourpath/MM-OVSeg/datasets/OEM5class.json" MODEL.SEM_SEG_HEAD.TEST_CLASS_JSON "/yourpath/MM-OVSeg/datasets/OEM.json" DATASETS.TEST \(\"OEMthick_val_sem_seg\"\,\)

#### DDSK ####
python /yourpath/MM-OVSeg/train_net.py --config /yourpath/MM-OVSeg/configs/vitb_384.yaml --num-gpus 1 --dist-url "auto" MODEL.SEM_SEG_HEAD.NUM_CLASSES 3 MODEL.SEM_SEG_HEAD.IGNORE_VALUE 255 TEST.EVAL_PERIOD 0 OUTPUT_DIR /yourpath/MM-OVSeg/output/ MODEL.SEM_SEG_HEAD.TRAIN_CLASS_JSON "/yourpath/MM-OVSeg/datasets/DDSK3class.json" MODEL.SEM_SEG_HEAD.TEST_CLASS_JSON "/yourpath/MM-OVSeg/datasets/DDSK.json" DATASETS.TEST \(\"DDSK_val_sem_seg\"\,\) 

#################### ViT-L/14 #########################################
#### PIEclean  ###
python /yourpath/MM-OVSeg/train_net.py --config /yourpath/MM-OVSeg/configs/vitl_336.yaml --num-gpus 1 --dist-url "auto" MODEL.SEM_SEG_HEAD.NUM_CLASSES 4 MODEL.SEM_SEG_HEAD.IGNORE_VALUE 255 TEST.EVAL_PERIOD 0 OUTPUT_DIR /yourpath/MM-OVSeg/output/ MODEL.SEM_SEG_HEAD.TRAIN_CLASS_JSON "/yourpath/MM-OVSeg/datasets/PIE4class.json" MODEL.SEM_SEG_HEAD.TEST_CLASS_JSON "/yourpath/MM-OVSeg/datasets/PIE.json" DATASETS.TEST \(\"PIE_valrgb_sem_seg\"\,\) 

#### PIEcloud ####
python /yourpath/MM-OVSeg/train_net.py --config /yourpath/MM-OVSeg/configs/vitl_336.yaml --num-gpus 1 --dist-url "auto" MODEL.SEM_SEG_HEAD.NUM_CLASSES 4 MODEL.SEM_SEG_HEAD.IGNORE_VALUE 255 TEST.EVAL_PERIOD 0 OUTPUT_DIR /yourpath/MM-OVSeg/output/ MODEL.SEM_SEG_HEAD.TRAIN_CLASS_JSON "/yourpath/MM-OVSeg/datasets/PIE4class.json" MODEL.SEM_SEG_HEAD.TEST_CLASS_JSON "/yourpath/MM-OVSeg/datasets/PIE.json" DATASETS.TEST \(\"PIE_val_sem_seg\"\,\) 

#### OEMthin ####
python /yourpath/MM-OVSeg/train_net.py --config /yourpath/MM-OVSeg/configs/vitl_336.yaml --num-gpus 1 --dist-url "auto" MODEL.SEM_SEG_HEAD.NUM_CLASSES 5 MODEL.SEM_SEG_HEAD.IGNORE_VALUE 255 TEST.EVAL_PERIOD 0 OUTPUT_DIR /yourpath/MM-OVSeg/output/ MODEL.SEM_SEG_HEAD.TRAIN_CLASS_JSON "/yourpath/MM-OVSeg/datasets/OEM5class.json" MODEL.SEM_SEG_HEAD.TEST_CLASS_JSON "/yourpath/MM-OVSeg/datasets/OEM.json" DATASETS.TEST \(\"OEMthin_val_sem_seg\"\,\) 

#### OEMthick ####
python /yourpath/MM-OVSeg/train_net.py --config /yourpath/MM-OVSeg/configs/vitl_336.yaml --num-gpus 1 --dist-url "auto" MODEL.SEM_SEG_HEAD.NUM_CLASSES 5 MODEL.SEM_SEG_HEAD.IGNORE_VALUE 255 TEST.EVAL_PERIOD 0 OUTPUT_DIR /yourpath/MM-OVSeg/output/ MODEL.SEM_SEG_HEAD.TRAIN_CLASS_JSON "/yourpath/MM-OVSeg/datasets/OEM5class.json" MODEL.SEM_SEG_HEAD.TEST_CLASS_JSON "/yourpath/MM-OVSeg/datasets/OEM.json" DATASETS.TEST \(\"OEMthick_val_sem_seg\"\,\)

#### DDSK ####
python /yourpath/MM-OVSeg/train_net.py --config /yourpath/MM-OVSeg/configs/vitl_336.yaml --num-gpus 1 --dist-url "auto" MODEL.SEM_SEG_HEAD.NUM_CLASSES 3 MODEL.SEM_SEG_HEAD.IGNORE_VALUE 255 TEST.EVAL_PERIOD 0 OUTPUT_DIR /yourpath/MM-OVSeg/output/ MODEL.SEM_SEG_HEAD.TRAIN_CLASS_JSON "/yourpath/MM-OVSeg/datasets/DDSK3class.json" MODEL.SEM_SEG_HEAD.TEST_CLASS_JSON "/yourpath/MM-OVSeg/datasets/DDSK.json" DATASETS.TEST \(\"DDSK_val_sem_seg\"\,\) 

#####################################################################
```

### Evaluation commands
We provide following commands for model evaluation:

```bash
export DETECTRON2_DATASETS=/yourpath/MM-OVSeg/Dataset
#################### ViT-B/16 #########################################
#### PIEclean  ###
python /yourpath/MM-OVSeg/train_net.py --eval-only --config /yourpath/MM-OVSeg/configs/vitb_384.yaml --num-gpus 1 --dist-url "auto" MODEL.SEM_SEG_HEAD.NUM_CLASSES 6 MODEL.SEM_SEG_HEAD.IGNORE_VALUE 255 TEST.EVAL_PERIOD 0 OUTPUT_DIR /yourpath/MM-OVSeg/eval/ MODEL.SEM_SEG_HEAD.TRAIN_CLASS_JSON "/yourpath/MM-OVSeg/datasets/PIE4class.json" MODEL.SEM_SEG_HEAD.TEST_CLASS_JSON "/yourpath/MM-OVSeg/datasets/PIE.json" DATASETS.TRAIN \(\"PIE_trainrgb_sem_seg\"\,\) DATASETS.TEST \(\"PIE_valrgb_sem_seg\"\,\) MODEL.WEIGHTS /yourpath/MM-OVSeg/output/B16/modelPIEclean.pth

#### PIEcloud ####
python /yourpath/MM-OVSeg/train_net.py --eval-only --config /yourpath/MM-OVSeg/configs/vitb_384.yaml --num-gpus 1 --dist-url "auto" MODEL.SEM_SEG_HEAD.NUM_CLASSES 6 MODEL.SEM_SEG_HEAD.IGNORE_VALUE 255 TEST.EVAL_PERIOD 0 OUTPUT_DIR /yourpath/MM-OVSeg/eval/ MODEL.SEM_SEG_HEAD.TRAIN_CLASS_JSON "/yourpath/MM-OVSeg/datasets/PIE4class.json" MODEL.SEM_SEG_HEAD.TEST_CLASS_JSON "/yourpath/MM-OVSeg/datasets/PIE.json" DATASETS.TRAIN \(\"PIE_train_sem_seg\"\,\) DATASETS.TEST \(\"PIE_val_sem_seg\"\,\) MODEL.WEIGHTS /yourpath/MM-OVSeg/output/B16/modelPIE.pth

#### OEMthin ####
python /yourpath/MM-OVSeg/train_net.py --eval-only --config /yourpath/MM-OVSeg/configs/vitb_384.yaml --num-gpus 1 --dist-url "auto" MODEL.SEM_SEG_HEAD.NUM_CLASSES 8 MODEL.SEM_SEG_HEAD.IGNORE_VALUE 255 TEST.EVAL_PERIOD 0 OUTPUT_DIR /yourpath/MM-OVSeg/eval/ MODEL.SEM_SEG_HEAD.TRAIN_CLASS_JSON "/yourpath/MM-OVSeg/datasets/OEM5class.json" MODEL.SEM_SEG_HEAD.TEST_CLASS_JSON "/yourpath/MM-OVSeg/datasets/OEM.json" DATASETS.TRAIN \(\"OEMthin_train_sem_seg\"\,\) DATASETS.TEST \(\"OEMthin_val_sem_seg\"\,\) MODEL.WEIGHTS /yourpath/MM-OVSeg/output/B16/modelOEMthin.pth

#### OEMthick ####
python /yourpath/MM-OVSeg/train_net.py --eval-only --config /yourpath/MM-OVSeg/configs/vitb_384.yaml --num-gpus 1 --dist-url "auto" MODEL.SEM_SEG_HEAD.NUM_CLASSES 8 MODEL.SEM_SEG_HEAD.IGNORE_VALUE 255 TEST.EVAL_PERIOD 0 OUTPUT_DIR /yourpath/MM-OVSeg/eval/ MODEL.SEM_SEG_HEAD.TRAIN_CLASS_JSON "/yourpath/MM-OVSeg/datasets/OEM5class.json" MODEL.SEM_SEG_HEAD.TEST_CLASS_JSON "/yourpath/MM-OVSeg/datasets/OEM.json" DATASETS.TRAIN \(\"OEMthick_train_sem_seg\"\,\) DATASETS.TEST \(\"OEMthick_val_sem_seg\"\,\) MODEL.WEIGHTS /yourpath/MM-OVSeg/output/B16/modelOEMthick.pth

#### DDSK ####
python /yourpath/MM-OVSeg/train_net.py --eval-only --config /yourpath/MM-OVSeg/configs/vitb_384.yaml --num-gpus 1 --dist-url "auto" MODEL.SEM_SEG_HEAD.NUM_CLASSES 5 MODEL.SEM_SEG_HEAD.IGNORE_VALUE 255 TEST.EVAL_PERIOD 0 OUTPUT_DIR /yourpath/MM-OVSeg/eval/ MODEL.SEM_SEG_HEAD.TRAIN_CLASS_JSON "/yourpath/MM-OVSeg/datasets/DDSK3class.json" MODEL.SEM_SEG_HEAD.TEST_CLASS_JSON "/yourpath/MM-OVSeg/datasets/DDSK.json" DATASETS.TRAIN \(\"DDSK_train_sem_seg\"\,\) DATASETS.TEST \(\"DDSK_val_sem_seg\"\,\) MODEL.WEIGHTS /yourpath/MM-OVSeg/output/B16/modelDDSK.pth

#### DDCH ####
python /yourpath/MM-OVSeg/train_net.py --eval-only --config /yourpath/MM-OVSeg/configs/vitb_384.yaml --num-gpus 1 --dist-url "auto" MODEL.SEM_SEG_HEAD.NUM_CLASSES 5 MODEL.SEM_SEG_HEAD.IGNORE_VALUE 255 TEST.EVAL_PERIOD 0 OUTPUT_DIR /yourpath/MM-OVSeg/eval/ MODEL.SEM_SEG_HEAD.TRAIN_CLASS_JSON "/yourpath/MM-OVSeg/datasets/DDSK3class.json" MODEL.SEM_SEG_HEAD.TEST_CLASS_JSON "/yourpath/MM-OVSeg/datasets/DDCH.json" DATASETS.TRAIN \(\"DDSK_train_sem_seg\"\,\) DATASETS.TEST \(\"DDCH_val_sem_seg\"\,\) MODEL.WEIGHTS /yourpath/MM-OVSeg/output/B16/modelDDCH.pth

#################### ViT-L/14 #########################################
#### PIEclean  ###
python /yourpath/MM-OVSeg/train_net.py --eval-only --config /yourpath/MM-OVSeg/configs/vitl_336.yaml --num-gpus 1 --dist-url "auto" MODEL.SEM_SEG_HEAD.NUM_CLASSES 6 MODEL.SEM_SEG_HEAD.IGNORE_VALUE 255 TEST.EVAL_PERIOD 0 OUTPUT_DIR /yourpath/MM-OVSeg/eval/ MODEL.SEM_SEG_HEAD.TRAIN_CLASS_JSON "/yourpath/MM-OVSeg/datasets/PIE4class.json" MODEL.SEM_SEG_HEAD.TEST_CLASS_JSON "/yourpath/MM-OVSeg/datasets/PIE.json" DATASETS.TRAIN \(\"PIE_trainrgb_sem_seg\"\,\) DATASETS.TEST \(\"PIE_valrgb_sem_seg\"\,\) MODEL.WEIGHTS /yourpath/MM-OVSeg/output/L14/modelPIEclean.pth

#### PIEcloud ####
python /yourpath/MM-OVSeg/train_net.py --eval-only --config /yourpath/MM-OVSeg/configs/vitl_336.yaml --num-gpus 1 --dist-url "auto" MODEL.SEM_SEG_HEAD.NUM_CLASSES 6 MODEL.SEM_SEG_HEAD.IGNORE_VALUE 255 TEST.EVAL_PERIOD 0 OUTPUT_DIR /yourpath/MM-OVSeg/eval/ MODEL.SEM_SEG_HEAD.TRAIN_CLASS_JSON "/yourpath/MM-OVSeg/datasets/PIE4class.json" MODEL.SEM_SEG_HEAD.TEST_CLASS_JSON "/yourpath/MM-OVSeg/datasets/PIE.json" DATASETS.TRAIN \(\"PIE_train_sem_seg\"\,\) DATASETS.TEST \(\"PIE_val_sem_seg\"\,\) MODEL.WEIGHTS /yourpath/MM-OVSeg/output/L14/modelPIE.pth

#### OEMthin ####
python /yourpath/MM-OVSeg/train_net.py --eval-only --config /yourpath/MM-OVSeg/configs/vitl_336.yaml --num-gpus 1 --dist-url "auto" MODEL.SEM_SEG_HEAD.NUM_CLASSES 8 MODEL.SEM_SEG_HEAD.IGNORE_VALUE 255 TEST.EVAL_PERIOD 0 OUTPUT_DIR /yourpath/MM-OVSeg/eval/ MODEL.SEM_SEG_HEAD.TRAIN_CLASS_JSON "/yourpath/MM-OVSeg/datasets/OEM5class.json" MODEL.SEM_SEG_HEAD.TEST_CLASS_JSON "/yourpath/MM-OVSeg/datasets/OEM.json" DATASETS.TRAIN \(\"OEMthin_train_sem_seg\"\,\) DATASETS.TEST \(\"OEMthin_val_sem_seg\"\,\) MODEL.WEIGHTS /yourpath/MM-OVSeg/output/L14/modelOEMthin.pth

#### OEMthick ####
python /yourpath/MM-OVSeg/train_net.py --eval-only --config /yourpath/MM-OVSeg/configs/vitl_336.yaml --num-gpus 1 --dist-url "auto" MODEL.SEM_SEG_HEAD.NUM_CLASSES 8 MODEL.SEM_SEG_HEAD.IGNORE_VALUE 255 TEST.EVAL_PERIOD 0 OUTPUT_DIR /yourpath/MM-OVSeg/eval/ MODEL.SEM_SEG_HEAD.TRAIN_CLASS_JSON "/yourpath/MM-OVSeg/datasets/OEM5class.json" MODEL.SEM_SEG_HEAD.TEST_CLASS_JSON "/yourpath/MM-OVSeg/datasets/OEM.json" DATASETS.TRAIN \(\"OEMthick_train_sem_seg\"\,\) DATASETS.TEST \(\"OEMthick_val_sem_seg\"\,\) MODEL.WEIGHTS /yourpath/MM-OVSeg/output/L14/modelOEMthick.pth

#### DDSK ####
python /yourpath/MM-OVSeg/train_net.py --eval-only --config /yourpath/MM-OVSeg/configs/vitl_336.yaml --num-gpus 1 --dist-url "auto" MODEL.SEM_SEG_HEAD.NUM_CLASSES 5 MODEL.SEM_SEG_HEAD.IGNORE_VALUE 255 TEST.EVAL_PERIOD 0 OUTPUT_DIR /yourpath/MM-OVSeg/eval/ MODEL.SEM_SEG_HEAD.TRAIN_CLASS_JSON "/yourpath/MM-OVSeg/datasets/DDSK3class.json" MODEL.SEM_SEG_HEAD.TEST_CLASS_JSON "/yourpath/MM-OVSeg/datasets/DDSK.json" DATASETS.TRAIN \(\"DDSK_train_sem_seg\"\,\) DATASETS.TEST \(\"DDSK_val_sem_seg\"\,\) MODEL.WEIGHTS /yourpath/MM-OVSeg/output/L14/modelDDSK.pth

#### DDCH ####
python /yourpath/MM-OVSeg/train_net.py --eval-only --config /yourpath/MM-OVSeg/configs/vitl_336.yaml --num-gpus 1 --dist-url "auto" MODEL.SEM_SEG_HEAD.NUM_CLASSES 5 MODEL.SEM_SEG_HEAD.IGNORE_VALUE 255 TEST.EVAL_PERIOD 0 OUTPUT_DIR /yourpath/MM-OVSeg/eval/ MODEL.SEM_SEG_HEAD.TRAIN_CLASS_JSON "/yourpath/MM-OVSeg/datasets/DDSK3class.json" MODEL.SEM_SEG_HEAD.TEST_CLASS_JSON "/yourpath/MM-OVSeg/datasets/DDCH.json" DATASETS.TRAIN \(\"DDSK_train_sem_seg\"\,\) DATASETS.TEST \(\"DDCH_val_sem_seg\"\,\) MODEL.WEIGHTS /yourpath/MM-OVSeg/output/L14/modelDDCH.pth
#####################################################################
```

## 📜Reference

If this dataset or code contributes to your research, please kindly consider citing our paper and give this repo ⭐️:
```
@article{wei2026mm,
  title={{MM-OVS}eg: {M}ultimodal {O}ptical-{SAR} {F}usion for {O}pen-{V}ocabulary {S}egmentation in {R}emote {S}ensing},
  author={Wei, Yimin and Xiao, Aoran and Chen, Hongruixuan and Xia, Junshi and Yokoya, Naoto},
  journal={arXiv preprint arXiv:2603.17528},
  year={2026}
}
```

## 🤝Acknowledgments
The authors would also like to give special thanks to [GSNet](https://github.com/yecy749/gsnet), [DINOv3](https://github.com/facebookresearch/dinov3) and [SegEarth-OV](https://github.com/likyoo/SegEarth-OV).

## 🙋Q & A
***For any questions, please feel free to leave it in the [issue section](https://github.com/Jimmyxichen/MM-OVSeg/issues) or [contact us.](2364356729@qq.com)***

