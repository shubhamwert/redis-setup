
docker compose up -d
docker exec -it clustering-redis-redis-6380-1 redis-cli --cluster create redis-6379:6379 redis-6380:6380 redis-6381:6381 redis-6382:6382 redis-6383:6383 redis-6384:6384  --cluster-replicas 1
