Below are example commands you could run on each node. In these examples, we’ll assume the master node’s IP is **192.168.1.100**, you’re using port **29500**, and you have **4 nodes**. Each node’s command is identical except for the value of `--local_rank`, which should be set as follows:

- **Node 0 (Master, Rank 0):**

  ```shell
  python run_glue.py \
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
    --output_dir /tmp/RTE/ \
    --overwrite_output_dir \
    --master_ip 192.168.1.100 \
    --master_port 29500 \
    --world_size 4 \
    --local_rank 0
  ```

- **Node 1 (Rank 1):**

  ```shell
  python run_glue.py \
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
    --output_dir /tmp/RTE/ \
    --overwrite_output_dir \
    --master_ip 192.168.1.100 \
    --master_port 29500 \
    --world_size 4 \
    --local_rank 1
  ```

- **Node 2 (Rank 2):**

  ```shell
  python run_glue.py \
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
    --output_dir /tmp/RTE/ \
    --overwrite_output_dir \
    --master_ip 192.168.1.100 \
    --master_port 29500 \
    --world_size 4 \
    --local_rank 2
  ```

- **Node 3 (Rank 3):**

  ```shell
  python run_glue.py \
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
    --output_dir /tmp/RTE/ \
    --overwrite_output_dir \
    --master_ip 192.168.1.100 \
    --master_port 29500 \
    --world_size 4 \
    --local_rank 3
  ```

### Explanation of Key Parameters

- **`--master_ip 192.168.1.100`**  
  This is the IP address of the master node. All nodes will use this to connect to the master for gradient synchronization and other distributed communications.

- **`--master_port 29500`**  
  This port on the master node is used for initializing the distributed process group. Ensure that this port is open and not used by other services.

- **`--world_size 4`**  
  This indicates that there are 4 nodes (or processes) participating in the training.

- **`--local_rank <RANK>`**  
  The local rank uniquely identifies each node (or process) within the job. For your 4 nodes, you would set this to 0, 1, 2, and 3 respectively.

- **`--per_device_train_batch_size 16`**  
  Since your total batch size should match what you used in single-node training (64 in your example), using 16 per node with 4 nodes gives you 16 × 4 = 64.

Be sure to replace the paths and parameters with values that suit your environment if they differ. Running these commands on each node (using tools like `tmux` to keep sessions active) should launch your distributed training job.