export DETECTRON2_DATASETS=~/OVRS/OVS_datasets
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


