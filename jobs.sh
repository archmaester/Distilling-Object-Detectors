#!/bin/sh

#SBATCH --job-name=Test5Stu # Job name
#SBATCH --ntasks=4 # Run on a single CPU
#SBATCH --time=24:00:00 # Time limit hrs:min:sec
#SBATCH --output=Test5Stu%j.out # Standard output and error log
#SBATCH --gres=gpu:1
#SBATCH --partition=cl1_48h-1G

python test_net.py --dataset pascal_voc --net vgg11 \
--checksession 1 --checkepoch 5 --checkpoint 10021 \
--load_dir /scratch/pratheekb/models-student \
--cuda
# python trainval_net_sup.py \
# --dataset pascal_voc --net vgg11 \
# --lr 3e-3 --bs 1 --nw 1 \
# --lr_decay_step 8 --epochs 15 \
# --save_dir /scratch/pratheekb/models-student-1 \
# --cuda