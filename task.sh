#!/usr/bin/env bash
#SBATCH -p wacc
#SBATCH -J task
#SBATCH -o out.out
#SBATCH -e err.err
#SBATCH -t 0-00:05:00
#SBATCH --gres=gpu:1 -c 1

./demo