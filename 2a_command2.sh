export OUTPUT_DIR=/proj/cos568proj2-PG0/groups/jk6372/COS568-DistLM-SP25/2a_output

python 2a_run_glue_skeleton_node_distribution.py \
--model_type bert \
--model_name_or_path bert-base-cased \
--task_name RTE \
--do_train \
--do_eval \
--data_dir /proj/cos568proj2-PG0/glue_data/RTE \
--max_seq_length 128 \
--per_device_train_batch_size 16 \
--learning_rate 2e-5 \
--num_train_epochs 3 \
--output_dir $OUTPUT_DIR/ \
--overwrite_output_dir \
--master_ip 10.10.1.2 \
--master_port 29500 \
--world_size 4 \
--local_rank 2