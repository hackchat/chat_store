root = "/home/deployer/apps/chat_store/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn_chat_store.log"
stdout_path "#{root}/log/unicorn_chat_store.log"

listen "/tmp/unicorn.chat_store.sock"
listen 7002
worker_processes 2
timeout 30